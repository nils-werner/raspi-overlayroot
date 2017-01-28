pkgname=overlayroot
pkgver=0.1
pkgrel=1
pkgdesc="overlayFS root file system"
arch=('any')
url="https://github.com/nils-werner/arch-overlayroot"
license=('MIT')
depends=('mkinitcpio')
install=overlayroot.install
source=(
  'overlayroot.install'
  'initcpio-install-overlayroot'
  'initcpio-hooks-overlayroot'
  'rwrootfs'
  'fsck.overlay'
)
sha256sums=(
  'df3ee97a1c0358d05fa04d2d77d6bd74fa3ae64d9046ba4d791da5a932478058'
  '3f197246d31439c84d7433609628126354c02bc496b72291cf884a21d1e1d492'
  '5b74e80cd01730cd7e9cdb644a491e77d6f1dbf69e2a974438d5299adb324124'
  '4a012c5aa6247b6c828d100c06352b505f5e529b9ed1d39d06ae4308e63473fd'
  'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
)

build() {
  :
}

package() {
  install -Dm644 "$srcdir/initcpio-install-overlayroot" "$pkgdir/usr/lib/initcpio/install/overlayroot"
  install -Dm644 "$srcdir/initcpio-hooks-overlayroot" "$pkgdir/usr/lib/initcpio/hooks/overlayroot"
  install -Dm755 "$srcdir/rwrootfs" "$pkgdir/usr/bin/rwrootfs"
  install -Dm755 "$srcdir/fsck.overlay" "$pkgdir/usr/bin/fsck.overlay"
}
