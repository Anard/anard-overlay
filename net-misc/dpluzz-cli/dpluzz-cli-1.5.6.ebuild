# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Telecharge les videos depuis differents sites de rattrapage"
HOMEPAGE="https://forum.ubuntu-fr.org/viewtopic.php?id=1559861"
#SRC_URI="https://launchpad.net/~melixgaro/+archive/ubuntu/dpluzz-dev/+sourcefiles/${PN}/${PV}~focal/${PN}_${PV}~focal.tar.gz -> ${P}.tar.gz"
SRC_URI="https://launchpad.net/~melixgaro/+archive/ubuntu/dpluzz-dev/+sourcefiles/${PN}/${PV}~focal/${PN}_${PV}~focal.tar.gz"
S="${WORKDIR}/${PN}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND=">=dev-libs/uni2ascii-4.18 media-video/ffmpeg sys-apps/coreutils dev-libs/openssl >=dev-perl/Text-Unidecode-1.300.0 >=dev-perl/HTML-Parser-3.720.0"
#RDEPEND="${RDEPEND} app-text/recode"
DEPEND="${RDEPEND}"

src_install() {
	einfo 'Installing files...'
	insinto /usr/share/
	exeinto /usr/bin/
	doins -r "${S}/usr/share/dPluzz"
	doexe "${S}/usr/bin/dpluzz-cli"
}
