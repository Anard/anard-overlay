# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop
inherit xdg-utils

DESCRIPTION="Simple way to upgrade Gentoo system"
HOMEPAGE="https://github.com/Anard/${PN}.git"
SRC_URI="https://github.com/Anard/${PN}/archive/refs/heads/${PVR}.zip -> ${PF}.zip"
S="${WORKDIR}/${PF}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+color +gtk"

RDEPEND="color? ( >=scripts/shell-text-1.0-r2 ) gtk? ( gnome-extra/zenity || ( lxqt-base/lxqt-openssh-askpass net-misc/ssh-askpass-fullscreen net-misc/x11-ssh-askpass ) )"
DEPEND="${RDEPEND}"

src_install() {
	einfo 'Installing files...'
	dosbin "${S}/upgrade"
	if use gtk; then
		doicon -s 64 "${S}/upgrade-portage.png"
		domenu "${S}/upgrade.desktop"
		ewarn "Be sure to have properly configured an askpass program in /etc/sudo.conf"
	fi
}

pkg_postinst() {
	if use gtk; then
#		xdg_desktop_database_update
		xdg_icon_cache_update
	fi
}
pkg_postrm() {
	if use gtk; then
		xdg_icon_cache_update
	fi
}
