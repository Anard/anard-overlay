# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

LICENSE="MIT"
DESCRIPTION="Python m3u8 Parser for HTTP Live Streaming (HLS) Transmissions"
HOMEPAGE="https://github.com/globocom/m3u8 https://pypi.org/project/m3u8"

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

DEPEND="dev-python/iso8601[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
