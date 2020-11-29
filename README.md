# anard-overlay
Gentoo repository to install dpluzz-cli

## Installation
To install the repository, copy these lines in /etc/portage/repos.conf/anard.conf
```
[anard]
location = /var/db/repos/anard
sync-type = git
sync-uri = https://github.com/Anard/anard-overlay.git
auto-sync = no
```

To install dpluzz-cli, simply use
```
# emerge --sync anard
# emerge -a dpluzz-cli
```
