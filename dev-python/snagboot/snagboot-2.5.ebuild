EAPI=8

PYTHON_COMPAT=( python3_{11,12,13} )

DESCRIPTION="Snagboot isan open-source tool to recover and/or reflash embedded platforms."
HOMEPAGE="https://github.com/bootlin/snagboot"
SRC_URI="https://github.com/bootlin/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
EGIT_REPO_URI="https://github.com/bootlin/snagboot.git"
IUSE="doc"

if [ "${PV}" = "9999" ]; then
	inherit git-r3
fi

inherit distutils-r1 udev

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/pyusb-1.3[${PYTHON_USEDEP}]
		>=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
		>=dev-python/xmodem-0.4.6[${PYTHON_USEDEP}]
		>=dev-python/tftpy-0.8.2[${PYTHON_USEDEP}]
		>=dev-python/crccheck-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
		>=dev-python/pyfatfs-1.1.0[${PYTHON_USEDEP}]
	')
	>=sys-apps/dtc-1.7.2[python,${PYTHON_SINGLE_USEDEP}]
	virtual/udev
"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

python_install_all() {
	udev_dorules src/snagrecover/50-snagboot.rules
	dodoc -r docs/
	distutils-r1_python_install_all
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
