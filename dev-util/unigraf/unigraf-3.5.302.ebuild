EAPI=8

inherit udev desktop

DESCRIPTION="Unigraf software bundle"
HOMEPAGE="https://www.unigraf.fi/"
SRC_URI="SoftwareBundle_3.5.302[2112].tar.gz"
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="fetch strip"

# Very bad naming from Unigraf, the extracted folder is not named the same
BDEPEND="
	sys-apps/fakeroot
	app-arch/7zip
"

pkg_nofetch() {
	einfo "Please download ${SRC_URI} and move it to"
	einfo "your distfiles directory:"
	einfo
	einfo "  https://www.unigraf.fi/downloads/"
	einfo
}

src_unpack() {
	tar xf "${DISTDIR}/${SRC_URI}" -C "${T}" || die
	ls
	mkdir "${T}/install_dir"
	# Unigraf badly packaged their application and it always want to be root
	# It also try to execute some script using sudo to install udev rules
	# which obviously fails.
	fakeroot "${T}/SoftwarePackage_3.5.254[11946]/SoftwareBundle_3.5.302[2112]" \
		in -t "${T}/install_dir" \
		--create-local-repository \
		--accept-licenses \
		--auto-answer installationErrorWithCancel=Ignore \
		--confirm-command || die

	7za x "-o${S}" "${T}/install_dir/repository/UCDTools/3.5.254content.7z"
	7za x "-o${S}" "${T}/install_dir/repository/UCDTools/3.5.254documents.7z"
	7za x "-o${S}" "${T}/install_dir/repository/UCDTools/3.5.254icons.7z"
	7za x "-o${S}" "${T}/install_dir/repository/UCDTools/3.5.254firmware.7z"
	7za x "-o${S}" "${T}/install_dir/repository/UCDTools/3.5.254meta.7z"
	7za x "-o${S}" "${T}/install_dir/repository/UCDTools/3.5.254sdk.7z"
	7za x "-o${S}" "${T}/install_dir/repository/UCDTools/3.5.254test-content.7z"
	7za x "-o${S}" "${T}/install_dir/repository/UCDTools/3.5.254udev-rules.7z"
}

src_install() {
	udev_dorules udev-rules/90-Unigraf-Devices.rules

	doicon icons/*

	insinto /opt/unigraf
	exeinto /opt/unigraf
	doexe UCDConfig.AppImage
	doexe UCDConsole.AppImage
	doexe UCDLicense.AppImage
	doexe UCDPlayback.AppImage
	doexe UCDTimelineViewer.AppImage
	doins -r firmware
	doins -r sdk
	doins -r documents

	domenu "${FILESDIR}/UCDConsole.desktop"
	domenu "${FILESDIR}/UCDConfig.desktop"
	domenu "${FILESDIR}/UCDLicense.desktop"
	domenu "${FILESDIR}/UCDPlayback.desktop"
	domenu "${FILESDIR}/UCDTimelineViewer.desktop"
}

src_postinst() {
	udev_reload
}
