# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="# Manage MIDI/E-Seq files inside of Disklavier images"
HOMEPAGE="https://github.com/MS3FGX/disklav"
SRC_URI="https://github.com/MS3FGX/${PN}/archive/master.zip -> ${P}.zip"
S="${WORKDIR}/${PN}-master"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
BDEPEND="app-arch/unzip"
RDEPEND="dev-python/bitstring"
DEPEND="${RDEPEND}"

src_install() {
	einfo 'Installing files...'
	exeinto /usr/bin/
	mv "${S}/${PN}.py" "${S}/${PN}"
	doexe "${S}/${PN}"
}
