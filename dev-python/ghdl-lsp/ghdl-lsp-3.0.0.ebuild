# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9,10,11} )
inherit distutils-r1

DESCRIPTION="VHDL 2008/93/87 simulator"
HOMEPAGE="http://ghdl.free.fr/"
SRC_URI="https://github.com/ghdl/ghdl/archive/refs/tags/v${PV}.tar.gz -> ghdl-3.0.0.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
S="${WORKDIR}/ghdl-3.0.0"

PATCHES=(
	"${FILESDIR}/${P}-lib-to-lib64.patch"
)

REQUIRED_USE=${PYTHON_REQUIRED_USE}

RDEPEND="sci-electronics/ghdl"
BDEPEND=${RDEPEND}

python_configure() {
	./configure --prefix=/usr --libdir=lib64
}
