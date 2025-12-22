EAPI=8

DESCRIPTION="XMODEM protocol implementation in python"
HOMEPAGE="https://github.com/tehmaze/xmodem"
LICENSE="MIT"
SLOT="0"

DISTUTILS_USE_PEP517=setuptools
EGIT_REPO_URI="https://github.com/tehmaze/xmodem.git"
PYTHON_COMPAT=( python3_{9,10,11,12,13,14} )
IUSE="doc"

if [ "${PV}" = "9999" ]; then
	inherit git-r3
fi

inherit distutils-r1

RDEPEND="${PYTHON_DEPS}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

distutils_enable_sphinx doc/source
