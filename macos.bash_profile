
alias ll='ls -Glhp'                         # Preferred 'ls' implementation: -G = color, -l = long, -h = human (kMG), -p = adds / to folder
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
    cdf () {
        currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }
#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   Hint: To see hiddne files in Finder: CMD + SHIFT + "."
#   Hint: To go to a specific folder in Finder: CMD + SHIFT + "G"
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
#   -----------------------------------------------------------------------------------
    alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#   ---------------------------
#   5. PROCESS MANAGEMENT
#   ---------------------------

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
    findpid () { lsof -t -c "$@" ; }

#   Resource Utilization
#   -----------------------------------------------------
    alias memhogs='ps wwaxm -o pid,stat,%cpu,%mem,start,time,command | head -20 | less'
    alias cpuhogs='ps wwaxr -o pid,stat,%cpu,%mem,start,time,command | head -20 | less'

#   myps: List processes owned by my user:
#   ------------------------------------------------------------
    myps() { ps $@ -u $USER -o pid,stat,%cpu,%mem,start,time,bsdtime,command | less; }
    
    
    #   NETWORKING

alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache

alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections


#  Info
#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
ii() {
    clear
    echo -e "\nYou are logged on `hostname` ($machine)"
    echo -e "\nAdditionnal information: " ; uname -a
    echo -e "\nUsers logged on: " ; w -h
    echo -e "\nCurrent date : " ; date
    echo -e "\nMachine stats : " ; uptime
    echo -e "\nCurrent network location : " ; scselect
    echo -e "\nLocal IP Address : " ; scutil --nwi | grep address
    echo -e "\nPublic IP Address : " ; whatismyip.google.com
}