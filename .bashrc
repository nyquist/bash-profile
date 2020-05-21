## Detect os type
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux
                if [ -e $MY_PROFILE_PATH/linux.bashrc ]
			then
			source $MY_PROFILE_PATH/linux.bashrc
		fi
                ;;
    Darwin*)    machine=Mac
		if [ -e $MY_PROFILE_PATH/macos.bashrc ]
                	then source $MY_PROFILE_PATH/macos.bashrc
		fi
                ;;
    CYGWIN*)    machine=Cygwin
                if [ -e $MY_PROFILE_PATH/linux.bashrc ]
			then source $MY_PROFILE_PATH/linux.bashrc
		fi
                ;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

#  Load the bulk of the bash_profile

if [ -e $MY_PROFILE_PATH/generic.bashrc ] 
	then source $MY_PROFILE_PATH/generic.bashrc
fi
if [ -e $MY_PROFILE_PATH/private.bashrc ] 
	then source $MY_PROFILE_PATH/private.bashrc
fi
