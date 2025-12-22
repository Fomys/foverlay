EAPI=8
DESCRIPTION="pyfatfs is a library to interact with FAT filesystems"
HOMEPAGE="https://github.com/nathanhi/pyfatfs"
LICENSE="MIT"
SLOT="0"

DISTUTILS_USE_PEP517=setuptools
EGIT_REPO_URI="https://github.com/nathanhi/pyfatfs.git"
PYTHON_COMPAT=( python3_{8,9,10,11,12,13,14} )
IUSE="test"
RESTRICT="!test? ( test )"

if [ "${PV}" = "9999" ]; then
	inherit git-r3
else
	inherit pypi
fi

inherit distutils-r1

BDEPEND="
	>=dev-python/setuptools-scm-7.1[${PYTHON_USEDEP}]
"
RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/fs-2.4.16-r1[${PYTHON_USEDEP}]
"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

distutils_enable_sphinx docs
