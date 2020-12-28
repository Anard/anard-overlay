# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Read Yamaha Disklavier floppy disk images"
HOMEPAGE="https://hackaday.io/project/164793-hacking-yamaha-disklavier-floppies/log/164053-public-release-of-disklavpy"
SRC_URI="https://github.com/MS3FGX/disklav"
S="${PN}-master"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="dev-python/bitstring"
DEPEND="${RDEPEND}"
