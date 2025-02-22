# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit kde.org cmake git-r3

DESCRIPTION="KDE Discover - KDE software center"
HOMEPAGE="https://invent.kde.org/plasma/discover"

EGIT_REPO_URI="https://invent.kde.org/plasma/discover.git"
EGIT_BRANCH="master"

LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=kde-frameworks/plasma-framework-5.0.0:5
	>=kde-frameworks/kirigami-5.0.0:5
	>=kde-frameworks/kio-5.0.0:5
	>=kde-frameworks/kcmutils-5.0.0:5
	>=kde-frameworks/knewstuff-5.0.0:5
	>=kde-frameworks/kirigami-5.0.0:5
	>=dev-qt/qtgui-5.0.0:5
	>=dev-qt/qtnetwork-5.0.0:5
	>=dev-qt/qtsql-5.0.0:5
	>=dev-qt/qtwidgets-5.0.0:5
	>=dev-qt/qtxml-5.0.0:5
"

RDEPEND="${DEPEND}"

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install
}

pkg_postinst() {
	elog "KDE Discover has been installed. You can run it using the command 'discover'."
}

pkg_postrm() {
	elog "KDE Discover has been removed."
}
