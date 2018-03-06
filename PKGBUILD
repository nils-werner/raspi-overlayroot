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
  '4c43a761749dd6b39f4bd9219014417cad011208a136e6b7af7dbf8dc7b89d61'
  '3f197246d31439c84d7433609628126354c02bc496b72291cf884a21d1e1d492'
  'f80edb981d0a8d86b0f1d119a1d14fc39ed1d098b2920a80afce739cc93e33bf'
  '9cb629a6cf488ec686123bbdd113ea1b8b52f7ba561ad89efbbce7023fe97870'
  'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
  'c0c9a711f7554fdd02650409b098fc0636b8f3f574f03d927c6df84f5ec82a7f'
  '40cf596b3637439c18d3320476536ecbc35df63302f776ce2d1ebf0769dea580'
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
