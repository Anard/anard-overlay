# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop
inherit xdg-utils
inherit git-r3

DESCRIPTION="Simple way to upgrade Gentoo system"
EGIT_REPO_URI="https://github.com/Anard/${PN}.git"
EGIT_BRANCH="develop"
S="${WORKDIR}/${PF}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+color +gtk"

RDEPEND=">=sys-apps/portage-3.0 color? ( >=scripts/shell-text-1.0-r2 ) gtk? ( gnome-extra/zenity || ( lxqt-base/lxqt-openssh-askpass net-misc/ssh-askpass-fullscreen net-misc/x11-ssh-askpass ) )"
DEPEND="${RDEPEND}"

src_unpack() {
	git-r3_fetch
	git-r3_checkout
}

src_install() {
	einfo 'Installing files...'
	dosbin "${S}/upgrade"
	if use gtk; then
		doicon -s 64 "${S}/upgrade-portage.png"
		domenu "${S}/upgrade.desktop"
		grep -e '^Path askpass .*' "/etc/sudo.conf" > /dev/null
		if [ $? -gt 0 ]; then
			ewarn "Be sure to have properly configured an askpass program in /etc/sudo.conf"
		fi
		if ! type qlop &> /dev/null; then
			elog "qlop is used to estimate merge times, you can install it via emerge -a app-portage/portage-utils"
		fi
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
