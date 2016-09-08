{CompositeDisposable} = require 'atom'

module.exports = RememberFilePositions =
  subscriptions: null
  fileNumbers: {}
  filePositions: {}

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @fileNumbers = state.fileNumbersState ? {}
    @filePositions = state.filePositionsState ? {}

    @subscriptions.add atom.workspace.observeTextEditors (editor) =>
      @handleAddTextEditor(editor)
      @subscriptions.add atom.views.getView(editor).onDidChangeScrollTop (scroll) =>
        @handleChangeScroll(scroll, editor)
      @subscriptions.add editor.onDidChangeCursorPosition (event) =>
        @handleChangeCursorPosition(event)

  handleAddTextEditor: (editor) ->
    uri = editor.getURI()
    currentPosition = editor.getCursorBufferPosition()

    if @fileNumbers[uri]? and (currentPosition.row is 0 or currentPosition.row is @fileNumbers[uri].row)
      # HACK Atom to scroll to the cursor position of any TextEditors when this package is activated.
      # This is only necessary because Atom incorrectly applies deserialized scroll values.
      @setCursorAndScroll(editor, uri)

      # We need to know when the editor is actually attached in order to scroll.
      # Otherwise the `lineHeight` of the editor view is 0, and scrolling is impossible.
      view = atom.views.getView(editor)
      disposable = view.onDidAttach =>
        disposable.dispose()
        @setCursorAndScroll(editor, uri)

  setCursorAndScroll: (editor, uri) ->
    position = @filePositions[uri]
    editor.setCursorBufferPosition(@fileNumbers[uri])
    if position?
      view = atom.views.getView(editor)
      view.setScrollTop(position.top)
      view.setScrollLeft(position.left)

  handleChangeCursorPosition: (event) ->
    @fileNumbers[event.cursor.editor.getURI()] = event.newBufferPosition

  handleChangeScroll: (scroll, editor) ->
    # editor.displayBuffer.pixelPositionForScreenPosition(position)
    view = atom.views.getView(editor)
    screenPosition = {top: view.getScrollTop(), left: view.getScrollLeft()}
    @filePositions[editor.getURI()] = screenPosition

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->
    {fileNumbersState: @fileNumbers, filePositionsState: @filePositions}
