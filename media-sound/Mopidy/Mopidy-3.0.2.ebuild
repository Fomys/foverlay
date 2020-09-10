# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8} )
inherit distutils-r1

DESCRIPTION="An extensible music server written in Python"
HOMEPAGE="https://www.mopidy.com"

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"

SLOT="0"

KEYWORDS="~amd64"

IUSE=""

RDEPEND="
	>=www-servers/tornado-4.4[${PYTHON_USEDEP}]"
