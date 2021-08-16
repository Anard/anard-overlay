# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# Short one-line description of this package.
DESCRIPTION="Easily build and update kernel in Gentoo"

HOMEPAGE="https://github.com/Anard/${PN}.git"
SRC_URI="https://github.com/Anard/${PN}/archive/refs/heads/master.zip -> ${PF}.zip"

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
S="${WORKDIR}/${PN}-master"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+color +grub"

# Run-time dependencies. Must be defined to whatever this depends on to run.
# Example:
#    ssl? ( >=dev-libs/openssl-1.0.2q:0= )
#    >=dev-lang/perl-5.24.3-r1
# It is advisable to use the >= syntax show above, to reflect what you
# had installed on your system when you tested the package.  Then
# other users hopefully won't be caught without the right version of
# a dependency.
RDEPEND="color? ( >=scripts/shell-text-1.0-r2 ) grub? ( >=sys-boot/grub-2 )"

# Build-time dependencies that need to be binary compatible with the system
# being built (CHOST). These include libraries that we link against.
# The below is valid if the same run-time depends are required to compile.
DEPEND="${RDEPEND}"

src_configure() {
	# set grub variable in build-kernel
	if use grub; then
		sed -i '6s/.*/grub=1/' "${S}/build-kernel"
	else
		sed -i '6s/.*/grub=0/' "${S}/build-kernel"
	fi
}

src_install() {
	einfo 'Installing files...'
	if use grub; then
		dosbin "${S}/update-grub"
	fi
	dosbin "${S}/build-kernel"
	doman "${S}/build-kernel.1"
}
