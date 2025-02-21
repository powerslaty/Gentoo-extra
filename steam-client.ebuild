# steam-<version>.ebuild
EAPI=8

DESCRIPTION="Steam Client for Linux"
HOMEPAGE="https://store.steampowered.com/"
SRC_URI="https://steamcdn-a.akamaihd.net/client/installer/steam.deb"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="app-arch/dpkg"
RDEPEND="x11-libs/libX11
         x11-libs/libXrandr
         x11-libs/libXcursor
         x11-libs/libXi
         x11-libs/libXss
         app-emulation/lib32-glibc"

src_unpack() {
    # Extract the .deb package
    dpkg-deb -x ${DISTDIR}/steam.deb ${WORKDIR}/steam
}

src_install() {
    # Install the extracted files
    mv ${WORKDIR}/steam/* /usr/

    # Create necessary symlinks or directories if needed
    dosym /usr/steam/steam /usr/bin/steam

    # Set permissions
    chmod +x /usr/bin/steam
}

pkg_postinst() {
    einfo "Steam has been installed. You can launch it using the command 'steam'."
}
