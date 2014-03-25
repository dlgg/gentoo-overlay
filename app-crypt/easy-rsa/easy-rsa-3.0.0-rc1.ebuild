# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/easy-rsa/easy-rsa-2.2.0-r1.ebuild,v 1.7 2013/12/17 10:45:29 armin76 Exp $

EAPI=4

inherit eutils

DESCRIPTION="Small RSA key management package, based on OpenSSL."
HOMEPAGE="https://github.com/OpenVPN/easy-rsa/"
KEYWORDS="~alpha amd64 arm hppa ~ia64 ppc ~s390 ~sh ~sparc x86"
SRC_URI="https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.0-rc1/EasyRSA-3.0.0-rc1.tgz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=">=dev-libs/openssl-0.9.6"
RDEPEND="${DEPEND}
		!<net-misc/openvpn-2.3"

S="${WORKDIR}/${P}_master"

src_prepare() {
	epatch "${FILESDIR}/${PN}-2.0.0-pkcs11.patch"
	epatch "${FILESDIR}/no-licenses.patch"
}

src_configure() {
	econf --docdir="${EPREFIX}/usr/share/doc/${PF}"
}

src_install() {
	emake DESTDIR="${D}" install
	doenvd "${FILESDIR}/65easy-rsa" # config-protect easy-rsa
}
