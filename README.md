# anard-overlay
Gentoo repository to port various additionnal packages
- [**dpluzz-cli**](README.md#dpluzz) :
    downloads videos from various websites
- [**disklav**](README.md#disklav) :
    manages files from specfic Yamaha Disklavier's disk images

## Installation
To install the repository, copy these lines in /etc/portage/repos.conf/anard.conf
```
[anard]
location = /var/db/repos/anard
sync-type = git
sync-uri = https://github.com/Anard/anard-overlay.git
auto-sync = yes
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
