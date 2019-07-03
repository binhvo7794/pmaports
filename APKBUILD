# Reference: <https://postmarketos.org/devicepkg>
pkgname="device-samsung-herolte"
pkgdesc="Samsung Galaxy S7"
pkgver=0.1
pkgrel=1
url="https://postmarketos.org"
license="MIT"
arch="aarch64"
options="!check !archcheck"
depends="postmarketos-base linux-samsung-herolte mkbootimg mesa-dri-swrast msm-fb-refresher"
makedepends="devicepkg-dev"
source="deviceinfo initfs-hook.sh"
subpackages="$pkgname-nonfree-firmware:nonfree_firmware"

build() {
	devicepkg_build $startdir $pkgname
}

package() {
	devicepkg_package $startdir $pkgname
	install -Dm644 "$srcdir"/initfs-hook.sh \
		"$pkgdir"/etc/postmarketos-mkinitfs/hooks/00-${pkgname}.sh
}

nonfree_firmware() {
	pkgdesc="Non-free firmware for the Samsung Galaxy S7"
	depends="firmware-samsung-hero"
	mkdir "$subpkgdir"
}

sha512sums="c273794d0f9b16f14020d8165ec8413ee243511743e9c48c3245cc7390419889c8e8b6ffef2e066b5b1f97fb473848da22990ba067293e8b22caaad537b9067a  deviceinfo
5a7be3cb8835ffb3783fcd4539de04f7f006c726ac9aea35cdca9e90b2877dc36cf4e314851bf9078f4b2dac061b7265866792d92a79f5232c56a0e17f7910b1  initfs-hook.sh"
