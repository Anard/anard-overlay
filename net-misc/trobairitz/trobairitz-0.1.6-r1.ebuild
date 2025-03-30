# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Telecharge les videos depuis differents sites de rattrapage"
HOMEPAGE="https://forum.ubuntu-fr.org/viewtopic.php?pid=22562352#p22562352"
SRC_URI="https://launchpad.net/~melixgaro/+archive/ubuntu/${PN}-stable/+sourcefiles/${PN}/${PV}~jammy/${PN}_${PV}~jammy.tar.gz"
S="${WORKDIR}/v${PV}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
PYTHON_COMPAT=( python3_{6..13} )
RDEPEND="media-video/ffmpeg dev-python/requests dev-python/beautifulsoup4 dev-python/m3u8"
#BDEPEND=">=dev-util/debhelper-12"
DEPEND="${RDEPEND}"

src_install() {
	einfo 'Installing files...'
	exeinto /usr/bin/
	doexe "${S}/usr/bin/trobairitz"
}
