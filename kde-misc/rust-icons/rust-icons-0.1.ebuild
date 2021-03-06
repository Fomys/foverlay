# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

DESCRIPTION="All official rust icons"
HOMEPAGE="https://www.rust-lang.org.cc/"

LICENSE="CC-BY-4.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
#	default
	doicon ${FILESDIR}/*.png
}
