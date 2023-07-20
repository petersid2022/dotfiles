# All of my scripts

## add_license_file

I used to include all of the License info in the README.md file but I found that it was too much clutter so I decided to create a separate LICENSE file

This script adds a license file to a git repository and updates the README.md file with the license information and pushes the changes to the remote repository

TODO: add more license options and a command line option to choose the license type

## dmenu_power_menu 

Dmenu power menu that uses dmenu and systemctl. 

## How do I lock my screen?

I use this in my [i3 config file](../i3wm/config/config)
```bindsym $mod+shift+x exec betterlockscreen -l dim```

## lock.sh 

Similarly to the [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen) command above, it locks the screen when executed. It uses i3lock under the hood. 
