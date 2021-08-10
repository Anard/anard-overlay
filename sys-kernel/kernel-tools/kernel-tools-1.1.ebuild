# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Easily build and update kernel in Gentoo"
HOMEPAGE="https://github.com/Anard/${PN}.git"

SRC_URI="https://github.com/Anard/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
#S="${WORKDIR}/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="+color +grub"

RDEPEND="color? ( >=scripts/shell-text-1.0-r2 ) grub? ( >=sys-boot/grub-2 )"
DEPEND="${RDEPEND}"

src_configure() {
	# set grub variable in build-kernel
	if use grub; then
		sed -i '5s/.*/grub=1/' "${S}/build-kernel"
	else
		sed -i '5s/.*/grub=0/' "${S}/build-kernel"
	fi
}

src_install() {
	einfo 'Installing files...'
	exeinto /usr/sbin/
	if use grub; then
		doexe "${S}/update-grub"
	fi
	doexe "${S}/build-kernel"
}
