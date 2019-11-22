### This is the main bash profile that should work on most Linux hosts.
### Specific profiles are loaded based on os type

##   Set Prompt (to format username@host[full/path]$)
export PS1="\u@\h[\w]\$ "

##  Set Default Editor (change 'Nano' to the editor of your choice)
export EDITOR=/usr/bin/vim

##  General aliases

alias cp='cp -iv'                           # Preferred 'cp' implementation: -i = interactive, -v=verbose
alias mv='mv -iv'                           # Preferred 'mv' implementation: -i = interactive, -v=verbose
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation: -p = create intermediary folders, -v = verbose
alias less='less -FRXSc'                     # Preferred 'less' implementation: 
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias dirsize='du -hsx * | sort -rh'
alias filesize='ll -aS | grep "^-"'
##  lr:  Full Recursive Directory Listing
##  --------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

##   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
##           displays paginated result with colored search terms
##   Optional argument '3' is used to show $3 lines of context before and after the match 
#   --------------------------------------------------------------------
mans () {
    if [ -n $3 ] ; then man $1 | grep -i$3 --color=always $2 | less 
    else man $1 | grep -i --color=always $2 | less 
    fi
}

##  Zip Folder
##  -----------
zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder

## Extract most know archives with one command
## -------------------------------------------
extract () {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
}

##  SEARCHING

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

## Proxy
## Export your proxy address with 
# export PROXY_HOST='HOST:PORT'
## or define it in the private file
## ----------------------------------------
alias proxyOn='export http_proxy="$PROXY_HOST" ; export https_proxy="$PROXY_HOST"'
alias proxyOff='unset http_proxy ; unset https_proxy'

## Info
alias whatismyip.opendns.com='dig +short myip.opendns.com @resolver1.opendns.com'
alias whatismyip.google.com='dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F"\"" "{ print $2}"'
