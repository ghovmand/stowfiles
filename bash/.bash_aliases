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

alias gwbootrun="./gradlew clean bootRun -Dspring.artemis.mode=native -Deureka.client.enabled=true -Deureka.client.registerWithEureka=true -Deureka.client.fetchRegistry=true"

alias gwbootrunRibbon="./gradlew clean bootRun -Dspring.artemis.mode=native -Deureka.client.enabled=true -Deureka.client.registerWithEureka=true -Deureka.client.fetchRegistry=true -Dribbon.eureka.enabled=false -Dregister.ribbon.listOfServers=localhost:8094"

alias gwdebug="./gradlew clean bootRun --debug-jvm -Dspring.artemis.mode=native -Deureka.client.enabled=true -Deureka.client.registerWithEureka=true -Deureka.client.fetchRegistry=true"

alias chromedebug="chromium --remote-debugging-port=9222 --user-data-dir=remote-profile"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)"
 "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

 alias gw='./gradlew'
 alias run='./gradlew clean bootRun'

# Docker
alias ds="docker stats --all --format 'table {{.Container}}\t{{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}'"

alias gwloaddatadev1="./gradlew clean cucumber -Ptags=~@Qa -D\"DEV_URL=147.29.92.18\""
alias gwloaddatadev2="./gradlew clean cucumber -D"DEV_URL=147.29.92.19" -D\"cucumber.options=--tags @Alleroed\""
alias gwloaddatadev3="./gradlew clean cucumber -D"DEV_URL=147.29.92.32" -D\"cucumber.options=--tags @Alleroed\""

