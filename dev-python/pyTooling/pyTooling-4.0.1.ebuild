EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8,9,10,11} pypy3 )
inherit distutils-r1

DESCRIPTION="pyTooling is a powerful collection of arbitrary useful things."
HOMEPAGE="https://github.com/pyTooling/pyTooling"
SRC_URI="https://github.com/pyTooling/pyTooling/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
