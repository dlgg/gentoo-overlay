# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit ltprune autotools

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/bitlbee/bitlbee-facebook.git"
	inherit git-r3
else
	SRC_URI="https://github.com/bitlbee/bitlbee-facebook/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Facebook protocol plugin for BitlBee"
HOMEPAGE="https://github.com/bitlbee/bitlbee-facebook"

LICENSE="GPL-2+"
SLOT="0"

RDEPEND="
	dev-libs/glib:2
	dev-libs/json-glib
	>=net-im/bitlbee-3.5[plugins]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_install() {
	default
	prune_libtool_files --modules
}
