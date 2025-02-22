#!/usr/bin/env bash
# Copyright 1999-2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Sonic 3 A.I.R. (Angel Island Revisited) - A fan-made remaster of Sonic 3 & Knuckles"
HOMEPAGE="https://sonic3air.org/"
SRC_URI="https://github.com/Eukaryot/sonic3air/archive/refs/tags/v1.0.0.tar.gz"
LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/sdl2
        media-libs/ogg
        media-libs/vorbis
        media-libs/zlib"

RDEPEND="${DEPEND}"

src_unpack() {
    default
    cd "${S}"
    # Additional unpacking steps if necessary
}

src_compile() {
    cd "${S}"
    # Compilation steps
    # For example:
    # cmake -DCMAKE_INSTALL_PREFIX="${D}/usr" .
    # make
}

src_install() {
    cd "${S}"
    # Installation steps
    # For example:
    # make DESTDIR="${D}" install
}
