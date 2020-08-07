EAPI=6

PYTHON_COMPAT=( python3_{6,7,8} )
inherit gnome2 python-single-r1 autotools

DESCRIPTION="A small MPD client written in python"
HOMEPAGE="https://github.com/SoongNoonien/${PN}"

SRC_URI=""

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/SoongNoonien/${PN}.git"
else
	SRC_URI="https://github.com/SoongNoonien/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-3"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

COMMON_DEPEND="${PYTHON_DEPS}
	dev-libs/gobject-introspection:=
	x11-libs/gtk+:3[introspection]
	x11-libs/libnotify[introspection]
"

RDEPEND="${COMMON_DEPEND}
	$(python_gen_cond_dep '
		dev-python/pygobject:3[${PYTHON_MULTI_USEDEP}]
		dev-python/python-mpd[${PYTHON_MULTI_USEDEP}]
		dev-python/requests[${PYTHON_MULTI_USEDEP}]
		dev-python/beautifulsoup:4[${PYTHON_MULTI_USEDEP}]
		dev-python/dbus-python
	')
"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	sys-devel/gettext
"

RESTRICT="test"

src_prepare() {
	eaclocal
	eautoconf
	eautomake
	python_fix_shebang .
	gnome2_src_prepare
}

src_install() {
	gnome2_src_install
}
