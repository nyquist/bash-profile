##   Add color to terminal
###   export CLICOLOR=1
###   export LSCOLORS=ExFxBxDxCxegedabagacad

alias chkdsk="df -BG"

alias ll='ls -lhp --color=auto'                  # Preferred 'ls': -l = long, -h = human (kMG), -p = adds / to folder
# use ss or netstat
alias lsock='sudo ss -tuanp'             # lsock:        Display open sockets
alias lsockU='sudo ss -uanp'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo ss -tanp'                    # lsockT:       Display only open TCP sockets
alias openPorts='sudo ss -tulanp'               # openPorts:    All listening connections
alias whatismyip='ip address | egrep "(inet6? [0-9a-f./:]+|[a-z]{2,4}[0-9]*: )"'
alias whatismydns='dig localhost | grep SERVER'

ii() {
    clear
    echo -e "\nYou are logged on `hostname` ($machine)"
    echo -e "\nAdditionnal information: " ; uname -a
    echo -e "\nUsers logged on: " ; w -h
    echo -e "\nCurrent date : " ; date
    echo -e "\nMachine stats : " ; uptime
    echo -e "\nLocal IP Address : " ; whatismyip
    echo -e "\nDNS Server : " ; whatismydns
    echo -e "\nPublic IP Address : " ; whatismyip.google.com
}


## APP Specific
if [ -x  /usr/bin/docker ]; then
    #Docker usual commands
    alias dls="docker ps -a"                                       #list all containers"
    alias dlog="docker logs $1"                                    #show logs for one running container
    alias dnuke-containers="docker rm -f $(docker ps -aq)"         #stop&remove all running containers
    alias dnuke-images="docker rmi -f $(docker images -aq)"        #delete all docker images
    alias dstats="watch -n1 docker ps"                             #show all runing container         
    alias dprune="docker system prune" 
fi