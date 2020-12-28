# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="# Manage MIDI/E-Seq files inside of Disklavier images"
HOMEPAGE="https://github.com/MS3FGX/${PN}"
SRC_URI="https://github.com/MS3FGX/${PN}/archive/master.zip"
S="${WORKDIR}/${PN}-master"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="dev-python/bitstring"
DEPEND="${RDEPEND}"

src_configure() {
	echo 'no configuration needed'
}

src_compile() {
	echo 'no compilation needed'
}

src_install() {
	echo 'Installing files...'
	exeinto /usr/bin/
	doexe "${S}/${PN}"
}
