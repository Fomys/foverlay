EAPI=8

DESCRIPTION="Classes to calculate CRCs and checksums from binary data"
HOMEPAGE="https://github.com/MartinScharrer/crccheck"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DISTUTILS_USE_PEP517=setuptools
EGIT_REPO_URI="https://github.com/MartinScharrer/crccheck"
PYTHON_COMPAT=( python3_{7,8,9,10,11,12,13,14} )

if [ "${PV}" = "9999" ]; then
	inherit git-r3
else
	inherit pypi
fi

inherit distutils-r1

RDEPEND="${PYTHON_DEPS}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

distutils_enable_tests unittest
distutils_enable_sphinx docs/source
