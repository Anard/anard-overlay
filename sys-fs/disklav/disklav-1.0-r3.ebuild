# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="# Manage MIDI/E-Seq files inside of Disklavier images"
HOMEPAGE="https://github.com/MS3FGX/disklav"
SRC_URI="https://github.com/MS3FGX/${PN}/archive/master.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-master"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
BDEPEND="app-arch/unzip"
RDEPEND="dev-python/bitstring"
DEPEND="${RDEPEND}"

src_install() {
	einfo 'Installing files...'
	exeinto /usr/bin/
	mv "${S}/${PN}.py" "${S}/${PN}"
	doexe "${S}/${PN}"
}
