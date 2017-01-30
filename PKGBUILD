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
  'journald-volatile-storage.conf'
  'overlayroot-motd.sh'
)
sha256sums=(
  'df3ee97a1c0358d05fa04d2d77d6bd74fa3ae64d9046ba4d791da5a932478058'
  '3f197246d31439c84d7433609628126354c02bc496b72291cf884a21d1e1d492'
  'f80edb981d0a8d86b0f1d119a1d14fc39ed1d098b2920a80afce739cc93e33bf'
  '4a012c5aa6247b6c828d100c06352b505f5e529b9ed1d39d06ae4308e63473fd'
  'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
  'c0c9a711f7554fdd02650409b098fc0636b8f3f574f03d927c6df84f5ec82a7f'
  'd3081cb89142f8fab0229dff10b697c0a4f2d9c076a5cd6676b73a54d1b54926'
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
