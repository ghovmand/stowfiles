# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dc='pushd $HOME/dev/docker-compose > /dev/null && docker-compose'
    alias f="pushd"
    alias b="popd"
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ping='prettyping --nolegend'

alias gwbootrun="./gradlew clean bootRun -Dspring.artemis.mode=native -Deureka.client.enabled=true -Deureka.client.registerWithEureka=true -Deureka.client.fetchRegistry=true"

alias gwbootrunRibbon="./gradlew clean bootRun -Dspring.artemis.mode=native -Deureka.client.enabled=true -Deureka.client.registerWithEureka=true -Deureka.client.fetchRegistry=true -Dribbon.eureka.enabled=false -Dregister.ribbon.listOfServers=localhost:8094"

alias gwdebug="./gradlew clean bootRun --debug-jvm -Dspring.artemis.mode=native -Deureka.client.enabled=true -Deureka.client.registerWithEureka=true -Deureka.client.fetchRegistry=true"

alias chromedebug="chromium --remote-debugging-port=9222 --user-data-dir=remote-profile"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)"
 "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias gw='./gradlew clean'
alias run='./gradlew clean bootRun'

if test -f /usr/bin/batcat; then
  alias cat='batcat'
fi

gcp() {
    git commit "$1" -m "$2" && git push
}

alias gemini='npx https://github.com/google-gemini/gemini-cli'
