# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

DESCRIPTION="All official arduino icons"
HOMEPAGE="https://www.arduino.cc/"

LICENSE="UNKNOWN"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
#	default
	doicon "${FILESDIR}/*.png"
}
