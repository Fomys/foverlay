# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1 cmake git-r3

DESCRIPTION="Freescale/NXP I.MX Chip image deploy tools"
HOMEPAGE="https://github.com/nxp-imx/mfgtools"
EGIT_REPO_URI="https://github.com/nxp-imx/mfgtools.git"

LICENSE="BSD-2"
SLOT="0"

RDEPEND="app-arch/bzip2
	>=dev-libs/libusb-1.0.16
	dev-libs/openssl
	dev-libs/tinyxml2
	sys-libs/zlib"
DEPEND="${RDEPEND}
	dev-libs/libzip"

src_prepare() {
	rm -rf bzip2 libusb zlib

	cmake_src_prepare
}

src_install() {
	cmake_src_install

	newbashcomp "${S}"/snap/local/bash-completion/universal-update-utility ${PN}
}
