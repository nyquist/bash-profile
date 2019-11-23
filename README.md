A set of enhancements for .bash_profile

Heavily inspired by https://gist.github.com/natelandau/10654137

To use it, simply pull the repository somewhere on your host. Let's call it REPOSITORY_PATH
Edit your current ~/.bash_profile file and add these to the top, making sure you replace REPOSITORY_PATH with the actual path:
```bash
MY_PROFILE_PATH="REPOSITORY_PATH"
source $MY_PROFILE_PATH/bash_profile
```
Modify any private variables in REPOSITORY_PATH/bash_profile/private.bash_profile
There's a private.bash_profile.default as an example
Load the new bash profile

```source ~/.bash_profile```
