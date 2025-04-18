# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Sonic 3 A.I.R. (Angel Island Revisited) - Fan-made remaster of Sonic 3 & Knuckles"
HOMEPAGE="https://github.com/Eukaryot/sonic3air"
SRC_URI="https://github.com/Eukaryot/sonic3air/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="discord opengl vulkan debug static-libs wayland"

RESTRICT="fetch"  # Requires the user to manually provide the Sonic 3 & Knuckles ROM file

# Dependencies
DEPEND="
    media-libs/libsdl2[wayland?]
    media-libs/libogg
    media-libs/libvorbis
    sys-libs/zlib
    net-misc/curl
    dev-util/cmake
    opengl? ( virtual/opengl virtual/glu )
    vulkan? ( media-libs/vulkan-loader )
    discord? ( dev-libs/discord-game-sdk )
"
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/gcc"

# Source directory
S=${WORKDIR}/${PN}-${PV}

src_prepare() {
    # Apply any user-provided or custom patches
    default
    eapply_user

    # Add specific patches or fixes if needed
    if use wayland; then
        einfo "Applying Wayland-specific patches() {
    local mycmakeargs=(
        -DCMAKE_BUILD_TYPE=$(usex debug "Debug" "Release")
        -DCMAKE_INSTALL_PREFIX="/usr"
        -DCMAKE_INSTALL_LIBDIR="/usr/lib"
        $(usex opengl "-DENABLE_OPENGL=ON" "-DENABLE_OPENGL=OFF")
        $(usex vulkan "-DENABLE_VULKAN=ON" "-DENABLE_VULKAN=OFF")
        $(usex discord "-DENABLE_DISCORD_SDK=ON" "-DENABLE_DISCORD_SDK=OFF")
        $(usex static-libs "-DBUILD_STATIC_LIBS - ]]; then
       ()Sonic 3 A.I.R. requires the original Sonic 3 & Knuckles ROM file."
    elog "Please place 'Sonic_Knuckles_wSonic3.bin' in the game directory to play."

    if use discord; then
        elog "Discord Rich Presence is enabled. Ensure you have a    if use vulkan; then
        elog "Vulkan support is enabled for modern rendering pipelines."
    fi

    if use wayland; then
        elog "Wayland support is enabled. Ensure your environment supports Wayland."
    fi

    ewarn "Make sure your system meets the game's runtime requirements, including SDL2."
}

pkg_pretend() {
    # Check for system compatibility
    if [[ $(gcc-major-version) -lt 9 ]]; then
        die "GCC 9 or newer is required to build Sonic 3 A.I.R."
    fi

    if use discord && [[ ! -d /opt/discord ]]; then
        ewarn "Discord SDK is enabled, but no Discord installation was detected."
    fi
}

pkg_postrm() {
    elog "Sonic 3 A.I.R. has been removed. Configuration files might remain in your home directory."
}