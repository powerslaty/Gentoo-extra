# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Precompiled binary LTS Linux kernel"
HOMEPAGE="https://www.kernel.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/xz-utils net-misc/curl"
RDEPEND=""

fetch_latest_lts_version() {
    local latest_lts_url="https://www.kernel.org/finger_banner"
    local latest_lts_version=$(curl -s $latest_lts_url | grep -oP 'latest-lts:\s+\K[^\s]+')
    echo "$latest_lts_version"
}

LATEST_LTS_VERSION=$(fetch_latest_lts_version)
SRC_URI="https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${LATEST_LTS_VERSION}.tar.xz"

S="${WORKDIR}/linux-${LATEST_LTS_VERSION}"

src_unpack() {
    unpack ${A}
}

src_install() {
    dodir /boot
    dodir /lib/modules

    cp "${S}/vmlinuz-${LATEST_LTS_VERSION}" "${D}/boot/vmlinuz-${LATEST_LTS_VERSION}" || die
    cp "${S}/System.map-${LATEST_LTS_VERSION}" "${D}/boot/System.map-${LATEST_LTS_VERSION}" || die
    cp -r "${S}/modules/${LATEST_LTS_VERSION}" "${D}/lib/modules/" || die

    insinto /etc/kernel
    doins "${S}/config-${LATEST_LTS_VERSION}" || die
}

pkg_postinst() {
    ewarn "Remember to update your bootloader configuration!"
}

pkg_prerm() {
    if [[ -e "/boot/vmlinuz-${LATEST_LTS_VERSION}" ]]; then
        ewarn "You are about to remove the kernel. Make sure you have another kernel available."
    fi
}
