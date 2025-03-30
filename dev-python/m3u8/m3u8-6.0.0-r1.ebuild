# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1

DESCRIPTION="Python m3u8 Parser for HTTP Live Streaming (HLS) Transmissions"
HOMEPAGE="https://github.com/globocom/m3u8 https://pypi.org/project/m3u8"
SRC_URI="https://github.com/globocom/${PN}/archive/refs/tags/${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/iso8601[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
