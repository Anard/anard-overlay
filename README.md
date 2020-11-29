# anard-overlay
Gentoo repository to install dpluzz-cli which downloads videos from various websites

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

To install dpluzz-cli, simply use
```
# emerge -a dpluzz-cli
```
