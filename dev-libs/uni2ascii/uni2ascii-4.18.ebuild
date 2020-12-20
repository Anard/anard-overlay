# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Convert in both directions UTF-8 Unicode and more to 7-bit ASCII equivalents"
HOMEPAGE="http://www.billposer.org/Software/uni2ascii.html"
SRC_URI="http://billposer.org/Software/Downloads/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

src_test() {
	make check
}
