# anard-overlay
Gentoo repository to port various additionnal packages
- [**dpluzz-cli**](README.md#dpluzz) :
    downloads videos from various websites
- [**disklav**](README.md#disklav) :
    manages files from specfic Yamaha Disklavier's disk images
- **shell-text** :
    utility to decorate shell texts
- [**kernel-tools**](README.md#kernel-tools) :
    shortcut to `grub-mkconfig -o /boot/grub/grub.cfg` as `grub-update` for Grub users
    build-kernel utility perform full update of kernel based on existing or working configuration file

## Installation
To install the repository, copy these lines in /etc/portage/repos.conf/anard.conf
```
[anard]
location = /var/db/repos/anard
sync-type = git
sync-uri = https://github.com/Anard/anard-overlay.git
auto-sync = yes
```

Or just use eselect repository
```
# eselect repository enable anard
```

And sync with overlay :

```
# emerge --sync anard
```

## dPluzz
### Instructions
To install dpluzz-cli, simply use :
```
# emerge -a dpluzz-cli
```

For help, type :
```
$ dpluzz-cli --help
```

You'll have to use dpluzz-cli with -f option to work (use ffmpeg in place of avconv).

### Thanks
[Melixgaro](https://launchpad.net/~melixgaro)


## disklav
### Instructions
Read and manages files from Yamaha Disklavier disk image.
```
# emerge -a disklav
$ disklav --help
```
### Thanks
[Tom Nardi](https://github.com/MS3FGX/)

## kernel-tools
### Instructions
Easily build a new kernel from known or working configuration.
```
# emerge -a kernel-tools
# eselect-kernel set X
$ build-kernel --help
```
### Thanks
[Tony0945](https://forums.gentoo.org/viewtopic-t-1135833.html)
