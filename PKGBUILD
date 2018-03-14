pkgname=overlayroot
pkgver=0.2
pkgrel=1
pkgdesc="overlayFS root file system"
arch=('any')
url="https://github.com/nils-werner/arch-overlayroot"
license=('MIT')
depends=(
  'mkinitcpio'
  'arch-install-scripts'
)
install=overlayroot.install
source=(
  'overlayroot.install'
  'initcpio-install-overlayroot'
  'initcpio-hooks-overlayroot'
  'rwrootfs'
  'fsck.overlay'
  'journald-volatile-storage.conf'
  'overlayroot-motd.sh'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  :
}

package() {
  install -Dm644 "$srcdir/initcpio-install-overlayroot" "$pkgdir/usr/lib/initcpio/install/overlayroot"
  install -Dm644 "$srcdir/initcpio-hooks-overlayroot" "$pkgdir/usr/lib/initcpio/hooks/overlayroot"
  install -Dm644 "$srcdir/journald-volatile-storage.conf" "$pkgdir/etc/systemd/journald.conf.d/volatile-storage.conf"
  install -Dm755 "$srcdir/rwrootfs" "$pkgdir/usr/bin/rwrootfs"
  install -Dm755 "$srcdir/fsck.overlay" "$pkgdir/usr/bin/fsck.overlay"
  install -Dm644 "$srcdir/overlayroot-motd.sh" "$pkgdir/etc/profile.d/overlayroot-motd.sh"
}
