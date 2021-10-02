# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Simple way to upgrade Gentoo system"
HOMEPAGE="https://github.com/Anard/${PN}.git"
SRC_URI="https://github.com/Anard/${PN}/archive/refs/heads/1.01-r2.zip -> ${PF}.zip"
S="${WORKDIR}/${PN}-1.01-r2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+color +gtk"

RDEPEND="color? ( >=scripts/shell-text-1.0-r2 ) gtk? ( gnome-extra/zenity || ( lxqt-base/lxqt-openssh-askpass net-misc/ssh-askpass-fullscreen net-misc/x11-ssh-askpass ) )"
DEPEND="${RDEPEND}"

src_install() {
	einfo 'Installing files...'
	dosbin "${S}/upgrade"
	insinto "/usr/share/applications"
	doins "upgrade.desktop"
}
