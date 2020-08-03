# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="JackTrip is a multi-machine audio system used for network music performance over the Internet."
HOMEPAGE="https://github.com/jacktrip/jacktrip"
SRC_URI="https://github.com/jacktrip/jacktrip/archive/v1.2.zip"

LICENSE="UNKNOWN"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/jack media-sound/qjackctl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
./build
}

src_install() {
dobin jacktrip
}
