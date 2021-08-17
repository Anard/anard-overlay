# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# Short one-line description of this package.
DESCRIPTION="Easily build and update kernel in Gentoo"

HOMEPAGE="https://github.com/Anard/${PN}.git"
SRC_URI="https://github.com/Anard/${PN}/archive/refs/heads/r5.zip -> ${PF}.zip"

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
# If anything have ever been downloaded with same $S, it won't be updated, so always have here a different name, ${PF} contains full package name - version - rXX
S="${WORKDIR}/${PF}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+color +grub genkernel dracut"
REQUIRED_USE="dracut? ( !genkernel )"

# Run-time dependencies. Must be defined to whatever this depends on to run.
# Example:
#    ssl? ( >=dev-libs/openssl-1.0.2q:0= )
#    >=dev-lang/perl-5.24.3-r1
# It is advisable to use the >= syntax show above, to reflect what you
# had installed on your system when you tested the package.  Then
# other users hopefully won't be caught without the right version of
# a dependency.
# -- util-linux for using getopt function
RDEPEND="sys-apps/util-linux color? ( >=scripts/shell-text-1.0-r2 ) grub? ( >=sys-boot/grub-2 ) genkernel? ( sys-kernel/genkernel ) dracut? ( sys-kernel/dracut )"

# Build-time dependencies that need to be binary compatible with the system
# being built (CHOST). These include libraries that we link against.
# The below is valid if the same run-time depends are required to compile.
DEPEND="${RDEPEND}"

# print config parameter
## print_conf PARAMETER VALUE FILE
### FILE is under ${S} directory
print_conf() {
	param=$1
	value=$2
	file=$3
	# get current parameter's line
	pos=`grep -n "${param}=" "${S}/${file}" | cut -d : -f1`
	if [ "$pos" = "" ]; then
		# not found, write at end of file
		echo "${param}=${value}" >> "${S}${file}"
	else
		# found, replace it
		sed -i "${pos}s/.*/${param}=${value}/" "${S}/${file}"
	fi

}

src_configure() {
	# set GRUB variable in build-kernel.cnf
	if use grub; then
		print_conf GRUB 1 build-kernel.cnf
	else
		print_conf GRUB 0 build-kernel.cnf
	fi

	# set INITRAMFS variable in build-kernel.cnf
	if use genkernel; then
		print_conf INITRAMFS 'genkernel' build-kernel.cnf
	elif use dracut; then
		print_conf INITRAMFS 'dracut' build-kernel.cnf
	else
		print_conf INITRAMFS 'no' build-kernel.cnf
	fi
}

src_install() {
	einfo 'Installing files...'
	if use grub; then
		dosbin "${S}/update-grub"
	fi
	dosbin "${S}/build-kernel"
	doconfd "${S}/build-kernel.cnf"
	doman "${S}/man/build-kernel.1"
	doman "${S}/man/build-kernel.fr.1"
}
