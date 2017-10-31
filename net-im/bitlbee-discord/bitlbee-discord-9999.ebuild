# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit ltprune autotools git-r3

EGIT_REPO_URI="https://github.com/sm00th/bitlbee-discord.git"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="Discord protocol plugin for BitlBee"
HOMEPAGE="https://github.com/sm00th/bitlbee-discord"

LICENSE="GPL-2+"
SLOT="0"

RDEPEND="
	dev-libs/glib:2
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
