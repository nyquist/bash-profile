##   Add color to terminal
###   export CLICOLOR=1
###   export LSCOLORS=ExFxBxDxCxegedabagacad

alias ll='ls -lhp --color=auto'                  # Preferred 'ls': -l = long, -h = human (kMG), -p = adds / to folder
# use ss or netstat
alias lsock='sudo ss -tuanp'             # lsock:        Display open sockets
alias lsockU='sudo ss -uanp'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo ss -tanp'                    # lsockT:       Display only open TCP sockets
alias openPorts='sudo ss -tulanp'               # openPorts:    All listening connections


ii() {
    clear
    echo -e "\nYou are logged on `hostname` ($machine)"
    echo -e "\nAdditionnal information: " ; uname -a
    echo -e "\nUsers logged on: " ; w -h
    echo -e "\nCurrent date : " ; date
    echo -e "\nMachine stats : " ; uptime
    echo -e "\nLocal IP Address : " ; ip address | grep "inet "; ip address | grep "inet6"; 
    echo -e "\nPublic IP Address : " ; whatismyip.google.com
}