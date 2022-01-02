# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

DESCRIPTION="SideQuest is a place to get more apps for your Oculus Quest."
HOMEPAGE="https://sidequestvr.com/"
SRC_URI="https://github.com/SideQuestVR/SideQuest/releases/download/v${PV}/SideQuest-${PV}.tar.xz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64"

src_unpack() {
	unpack ${A}
	mv SideQuest-${PV} ${PF}
}

src_install() {
	dodir /opt/${PF}
	insinto /opt/${PF}
	doins -r *
	dosym /opt/${PF}/sidequest /usr/bin/sidequest
	fperms 755 /opt/${PF}/sidequest

	make_desktop_entry sidequest SideQuest /opt/${PF}/resources/app.asar.unpacked/build/icon.ico "Game"
}
