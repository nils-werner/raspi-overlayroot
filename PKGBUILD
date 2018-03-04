pkgname=overlayroot
pkgver=0.2
pkgrel=1
pkgdesc="overlayFS root file system"
arch=('any')
url="https://github.com/nils-werner/arch-overlayroot"
license=('MIT')
depends=('mkinitcpio')
optdepends=('arch-install-scripts: for arch-chroot script')
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
  'c9d1af0a1a6284bfed0bb7ba90e7b4c71d51de9cb457ce96a8d0b48d15702ee3'
  '3f197246d31439c84d7433609628126354c02bc496b72291cf884a21d1e1d492'
  'f80edb981d0a8d86b0f1d119a1d14fc39ed1d098b2920a80afce739cc93e33bf'
  '44b903bcff55b73c062c50851f87c1ef0ea4c1deaa8059210a5058ec7e4784ec'
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
