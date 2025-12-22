EAPI=8

DESCRIPTION="TFTPy is a pure python TFTP implementation"
HOMEPAGE="https://github.com/msoulier/tftpy"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DISTUTILS_USE_PEP517=setuptools
EGIT_REPO_URI="https://github.com/msoulier/tftpy.git"
PYTHON_COMPAT=( python3_{8,9,10,11,12,13,14} )

if [ "${PV}" = "9999" ]; then
	inherit git-r3
else
	inherit pypi
fi
inherit distutils-r1

BDEPEND="
	>=dev-python/setuptools-61.0
	dev-python/wheel
"
RDEPEND="
	${PYTHON_DEPS}
"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_test() {
	python tests/test.py || die
}

distutils_enable_sphinx doc
