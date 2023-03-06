# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils xdg-utils

DESCRIPTION="LeoCAD is a CAD program that uses bricks similar to those found in many toys."
HOMEPAGE="http://www.leocad.org"

BASE_URI="https://github.com/leozide/leocad"
PARTS_LIB="complete.zip"
PARTS_URI="https://www.ldraw.org/library/updates/"

if [[ ${PV} == *9999* ]];then
	SRC_URI="${BASE_URI}/archive/refs/tags/continuous.tar.gz -> ${P}.tar.gz"
	KEYWORDS=""
	S="${WORKDIR}/${PN}-continuous"
else
	SRC_URI="${BASE_URI}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64 ~arm"
fi
SRC_URI="
	${SRC_URI}
	${PARTS_URI}/${PARTS_LIB} -> library.bin
"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtopengl:5
	dev-qt/qtconcurrent:5
"
RDEPEND="${DEPEND}
	x11-themes/hicolor-icon-theme"

src_unpack(){
	unpack "${P}.tar.gz"
}

src_configure(){
	eqmake5 ${PN}.pro DISABLE_UPDATE_CHECK=1
}

src_install(){
	emake INSTALL_ROOT="${D}" install
	insinto /usr/share/${PN}
	doins "${DISTDIR}/library.bin"
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
