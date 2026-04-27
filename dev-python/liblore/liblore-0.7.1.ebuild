EAPI=8

DESCRIPTION="TFTPy is a pure python TFTP implementation"
HOMEPAGE="https://git.kernel.org/pub/scm/utils/liblore/liblore.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DISTUTILS_USE_PEP517=setuptools
EGIT_REPO_URI="https://git.kernel.org/pub/scm/utils/liblore/liblore.git"
PYTHON_COMPAT=( python3_{9,10,11,12,13,14} )

if [ "${PV}" = "9999" ]; then
	inherit git-r3
else
	inherit pypi
fi
inherit distutils-r1

IUSE="auth"

BDEPEND="
	>=dev-python/requests-2.31[${PYTHON_USEDEP}]
	auth? (
		>=dev-python/authheaders-0.15[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	${PYTHON_DEPS}
"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
