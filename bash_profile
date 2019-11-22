## Detect os type
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux
                if [ -e $MY_PROFILE_PATH/linux.bash_profile ]
			then
			source $MY_PROFILE_PATH/linux.bash_profile
		fi
                ;;
    Darwin*)    machine=Mac
		if [ -e $MY_PROFILE_PATH/macos.bash_profile ]
                	then source $MY_PROFILE_PATH/macos.bash_profile
		fi
                ;;
    CYGWIN*)    machine=Cygwin
                if [ -e $MY_PROFILE_PATH/linux.bash_profile ]
			then source $MY_PROFILE_PATH/linux.bash_profile
		fi
                ;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

#  Load the bulk of the bash_profile

if [ -e $MY_PROFILE_PATH/generic.bash_profile ] 
	then source $MY_PROFILE_PATH/generic.bash_profile
fi
if [ -e $MY_PROFILE_PATH/private.bash_profile ] 
	then source $MY_PROFILE_PATH/private.bash_profile
fi
