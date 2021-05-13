pkgname=overlayroot
pkgver=0.2
pkgrel=2
pkgdesc="overlayFS root file system"
arch=('any')
url="https://github.com/nils-werner/arch-overlayroot"
license=('MIT')
depends=(
  'mkinitcpio'
)
install=overlayroot.install
source=(
  'overlayroot.install'
  'sd-volatile'
  'overlayroot-motd.sh'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  :
}

package() {
  install -Dm644 "$srcdir/sd-volatile" "$pkgdir/usr/lib/initcpio/install/sd-volatile"
  install -Dm644 "$srcdir/overlayroot-motd.sh" "$pkgdir/etc/profile.d/overlayroot-motd.sh"
}
