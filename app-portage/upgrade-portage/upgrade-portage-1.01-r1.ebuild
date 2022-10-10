# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Simple way to upgrade Gentoo system"
HOMEPAGE="https://github.com/Anard/upgrade-portage.git"
SRC_URI="https://github.com/Anard/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="+color"

RDEPEND="color? ( >=scripts/shell-text-1.0-r2 )"
DEPEND="${RDEPEND}"

src_install() {
	einfo 'Installing files...'
	dosbin "${S}/upgrade"
}
