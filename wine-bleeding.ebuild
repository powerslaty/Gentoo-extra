# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Free implementation of Windows(tm) on Unix, using the Windows API"
HOMEPAGE="https://www.winehq.org/"
SRC_URI=""

LICENSE="LGPL-2.1-or-later"
SLOT="0"
KEYWORDS=""
IUSE="X alsa cups dos fontconfig gecko gphoto2 gsm gstreamer jpeg kerberos lcms ldap mono mpg123 ncurses netapi nls odbc openal opencl openexr osmesa oss perl pipelight png pulseaudio samba sdl selinux staging test themes truetype udev v4l vaapi vkd3d vulkan xcomposite xinerama xml"

RDEPEND="
    X? ( x11-libs/libX11 )
    alsa? ( media-libs/alsa-lib )
    cups? ( net-print/cups )
    dos? ( app-emulation/dosemu )
    fontconfig? ( media-libs/fontconfig )
    gecko? ( www-plugins/gecko-mediaplayer )
    gphoto2? ( media-libs/libgphoto2 )
    gsm? ( media-sound/gsm )
    gstreamer? ( media-libs/gstreamer )
    jpeg? ( media-libs/libjpeg-turbo )
    kerberos? ( app-crypt/mit-krb5 )
    lcms? ( media-libs/lcms )
    ldap? ( net-nds/openldap )
    mono? ( dev-lang/mono )
    mpg123? ( media-sound/mpg123 )
    ncurses? ( sys-libs/ncurses )
    netapi? ( net-fs/samba )
    nls? ( virtual/libintl )
    odbc? ( dev-db/unixODBC )
    openal? ( media-libs/openal )
    opencl? ( dev-libs/ocl-icd )
    openexr? ( media-libs/openexr )
    osmesa? ( media-libs/osmesa )
    oss? ( media-sound/oss )
    perl? ( dev-lang/perl )
    pipelight? ( www-plugins/pipelight )
    png? ( media-libs/libpng )
    pulseaudio? ( media-sound/pulseaudio )
    samba? ( net-fs/samba )
    sdl? ( media-libs/libsdl2 )
    selinux? ( sec-policy/selinux-wine )
    staging? ( app-emulation/wine-staging )
    test? ( dev-util/cmocka )
    themes? ( x11-themes/wine-themes )
    truetype? ( media-libs/freetype )
    udev? ( virtual/udev )
    v4l? ( media-libs/libv4l )
    vaapi? ( media-libs/libva )
    vkd3d? ( media-libs/vkd3d )
    vulkan? ( media-libs/vulkan-loader )
    xcomposite? ( x11-libs/libXcomposite )
    xinerama? ( x11-libs/libXinerama )
    xml? ( dev-libs/libxml2 )
"

DEPEND="${RDEPEND}
    >=sys-devel/gcc-4.2
    >=sys-devel/binutils-2.16.1
    >=sys-devel/make-3.80
    >=sys-devel/automake-1.9
    >=sys-devel/autoconf-2.59
    >=sys-devel/libtool-1.5.22
    >=sys-devel/pkgconfig-0.15.0
"

EGIT_REPO_URI="https://source.winehq.org/git/wine.git"
EGIT_BRANCH="master"

src_unpack() {
    git clone "${EGIT_REPO_URI}" "${WORKDIR}/wine" || die
    cd "${WORKDIR}/wine" || die
}

src_prepare() {
    cd "${WORKDIR}/wine" || die
    eapply_user
}

src_configure() {
    cd "${WORKDIR}/wine" || die
    ./configure --prefix="${EPREFIX}"/usr
}

src_compile() {
    cd "${WORKDIR}/wine" || die
    emake
}

src_install() {
    cd "${WORKDIR}/wine" || die
    emake DESTDIR="${D}" install
}

pkg_postinst() {
    elog "Wine has been installed and configured to always keep up to date with the latest source code."
    elog "A cron job has been set up to fetch the latest updates automatically."
    elog "You may need to configure Wine before use."
}

pkg_postrm() {
    # Clean up the cron job if the package is removed
    crontab -l | grep -v "${EPREFIX}/usr/portage/app-emulation/wine" | crontab -
}

pkg_setup() {
    # Set up a cron job to update the Wine source code regularly
    (crontab -l 2>/dev/null; echo "0 0 * * * cd ${WORKDIR}/wine && git pull && emerge --oneshot wine") | crontab -
}
