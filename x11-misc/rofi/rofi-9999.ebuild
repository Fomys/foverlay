# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson toolchain-funcs xdg-utils

DESCRIPTION="A window switcher, run dialog and dmenu replacement"
HOMEPAGE="https://github.com/lbonn/rofi"

EGIT_REPO_URI="https://github.com/lbonn/rofi"
inherit git-r3

LICENSE="MIT"
SLOT="0"
IUSE="+drun test +windowmode +wayland"
RESTRICT="!test? ( test )"

BDEPEND="
	sys-devel/bison
	>=sys-devel/flex-2.5.39
	virtual/pkgconfig
"
RDEPEND="
	>=dev-libs/glib-2.72:2
	x11-libs/cairo
	x11-libs/pango
	x11-libs/xcb-util
	x11-libs/libxkbcommon[wayland?]
	x11-libs/gdk-pixbuf:2
	dev-libs/wayland
	sys-libs/glibc
"

DEPEND="
	${RDEPEND}
	test? ( >=dev-libs/check-0.11 )
"

DOCS=(
	AUTHORS
	Changelog
	Examples/
	README.md
)

src_configure() {
	# Doesn't work with reflex, bug #887049
	export LEX=flex

	# Requires bison, see https://bugs.gentoo.org/894634.
	unset YACC

	tc-export CC

	local emesonargs=(
		$(meson_use drun)
		$(meson_use windowmode window)
		$(meson_feature test check)
		$(meson_feature wayland)
		-Dimdkit=false
		-Dxcb=disabled
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
