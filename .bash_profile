## Detect os type
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux
                source $MY_PROFILE_PATH/linux.bash_profile
                ;;
    Darwin*)    machine=Mac
                source $MY_PROFILE_PATH/macos.bash_profile
                ;;
    CYGWIN*)    machine=Cygwin
                source $MY_PROFILE_PATH/linux.bash_profile
                ;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

#  Load the bulk of the bash_profile

source $MY_PROFILE_PATH/generic.bash_profile
source $MY_PROFILE_PATH/private.bash_profile