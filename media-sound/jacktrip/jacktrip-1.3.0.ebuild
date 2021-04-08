# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="JackTrip is a multi-machine audio system."
HOMEPAGE="https://github.com/jacktrip/jacktrip"
SRC_URI="https://github.com/jacktrip/jacktrip/archive/v1.3.0.zip"

LICENSE="UNKNOWN"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/jack media-sound/qjackctl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
cd src/ && ./build
}

src_install() {
cd src/ && dobin jacktrip
}
