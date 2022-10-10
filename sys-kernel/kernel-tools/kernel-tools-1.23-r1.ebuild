# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Easily build and update kernel in Gentoo"
HOMEPAGE="https://github.com/Anard/kernel-tools.git"

SRC_URI="https://github.com/Anard/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+color +grub genkernel dracut +menuconfig gconfig xconfig nconfig"
REQUIRED_USE="dracut? ( !genkernel ) ^^ ( menuconfig gconfig xconfig nconfig )"

RDEPEND="color? ( >=scripts/shell-text-1.0-r2 ) grub? ( >=sys-boot/grub-2 ) genkernel? ( sys-kernel/genkernel ) dracut? ( sys-kernel/dracut ) nconfig? ( sys-libs/ncurses ) xconfig? ( dev-qt/qtwidgets ) gconfig? ( x11-libs/gtk+:* dev-libs/glib gnome-base/libglade )"
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

	# set CONFIG_TOOL variable in build-kernel.cnf
	if use xconfig; then
		print_conf CONFIG_TOOL 'xconfig' build-kernel.cnf
	elif use gconfig; then
		print_conf CONFIG_TOOL 'gconfig' build-kernel.cnf
	elif use nconfig; then
		print_conf CONFIG_TOOL 'nconfig' build-kernel.cnf
	else
		print_conf CONFIG_TOOL 'menuconfig' build-kernel.cnf
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
