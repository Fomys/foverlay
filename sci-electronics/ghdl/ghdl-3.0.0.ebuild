# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="VHDL 2008/93/87 simulator"
HOMEPAGE="http://ghdl.free.fr/"
SRC_URI="https://github.com/ghdl/ghdl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_configure() {
	./configure --prefix=/usr --libdir=lib64
	# TODO: gcc, llvm, libghdl
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
	rm "${D}"/usr/bin/ghwdump
}
