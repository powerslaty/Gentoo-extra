# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Grapejuice is a project to manage and run Roblox games on Linux using Wine."
HOMEPAGE="https://github.com/grapejuice-project/grapejuice"
SRC_URI="https://github.com/grapejuice-project/grapejuice/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-emulation/wine
    dev-python/pip
    dev-python/setuptools
    dev-python/virtualenv
    dev-python/requests
    dev-python/psutil"
DEPEND="${RDEPEND}
    app-arch/unzip
    dev-util/cmake"

src_unpack() {
    unpack ${P}.tar.gz
}

src_compile() {
    cmake .
    emake
}

src_install() {
    python3 setup.py install --root="${D}" --optimize=1

    # Install additional documentation
    dodoc README.md
}
