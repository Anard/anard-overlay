# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils eutils xdg-utils

DESCRIPTION="LeoCAD is a CAD program that uses bricks similar to those found in many toys."
HOMEPAGE="http://www.leocad.org"

BASE_URI="https://github.com/leozide/leocad"

if [[ ${PV} == *9999* ]];then
	inherit git-r3
	EGIT_REPO_URI="${BASE_URI}"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="${BASE_URI}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64 ~arm"
fi

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

src_configure(){
	eqmake5 ${PN}.pro DISABLE_UPDATE_CHECK=1
}

src_install(){
	emake INSTALL_ROOT="${D}" install
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
