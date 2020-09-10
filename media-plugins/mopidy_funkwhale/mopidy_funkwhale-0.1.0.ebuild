# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_7 )
inherit distutils-r1

DESCRIPTION="A backend extension for mopidy to stream music from a Funkwhale server"
HOMEPAGE="https://dev.funkwhale.audio/funkwhale/mopidy"

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.dev22.tar.gz"

LICENSE="GLP-3"

SLOT="0"

KEYWORDS="~amd64"

IUSE=""

RDEPEND="
	>=media-sound/Mopidy-3.0.2[${PYTHON_USEDEP}]"
