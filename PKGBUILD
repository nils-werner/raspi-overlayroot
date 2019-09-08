pkgname=overlayroot
pkgver=0.2
pkgrel=2
pkgdesc="overlayFS root file system"
arch=('any')
url="https://github.com/nils-werner/arch-overlayroot"
license=('MIT')
depends=(
  'mkinitcpio'
  'arch-install-scripts'
)
source=(
  'initcpio-install-overlayroot'
  'initcpio-hooks-overlayroot'
  'rwrootfs'
  'fsck.overlay'
  'journald-volatile-storage.conf'
  'overlayroot-motd.sh'
  'mkinitcpio-overlayroot.conf'
  'mkinitcpio-overlayroot.preset'
  '90-overlayroot.hook'
)
sha256sums=(
  # 'initcpio-install-overlayroot'
  '3f197246d31439c84d7433609628126354c02bc496b72291cf884a21d1e1d492'
  # 'initcpio-hooks-overlayroot'
  'ad262726508954ba51d821449cd03d2cb58ff181ea437fa0a229e3aeef675ee4'
  # 'rwrootfs'
  '75b8c2ebe9e08e58f207a82aa93cfdd0b46a2255e49493cf6fedfe97cc61bd98'
  # 'fsck.overlay'
  'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
  # 'journald-volatile-storage.conf'
  'c0c9a711f7554fdd02650409b098fc0636b8f3f574f03d927c6df84f5ec82a7f'
  # 'overlayroot-motd.sh'
  'e2e917ab85d44abfc8e4c504cd8925d6fec5d26c452198303e2238464552e9a1'
  # 'mkinitcpio-overlayroot.conf'
  '0954c40ee94824707ed0d4bf65bda0be1b3e57c52dd8cd2d12df23bf597ae6a2'
  # 'mkinitcpio-overlayroot.preset'
  '7ebdad6c610b8d35dab94343b7a98fb7dca4534aa43c49680b346919496fd1e8'
  # '90-overlayroot.hook'
  '939e8f4589ac008196386896a4ae221099186f22f27ee04de3e1e645f9e89a6d'
)

build() {
  :
}

package() {
  install -Dm644 "$srcdir/initcpio-install-overlayroot" "$pkgdir/usr/lib/initcpio/install/overlayroot"
  install -Dm644 "$srcdir/initcpio-hooks-overlayroot" "$pkgdir/usr/lib/initcpio/hooks/overlayroot"
#  install -Dm644 "$srcdir/journald-volatile-storage.conf" "$pkgdir/etc/systemd/journald.conf.d/volatile-storage.conf"
  install -Dm755 "$srcdir/rwrootfs" "$pkgdir/usr/bin/rwrootfs"
  install -Dm755 "$srcdir/fsck.overlay" "$pkgdir/usr/bin/fsck.overlay"
  install -Dm644 "$srcdir/mkinitcpio-overlayroot.conf" "$pkgdir/etc/mkinitcpio-overlayroot.conf"
  install -Dm644 "$srcdir/mkinitcpio-overlayroot.preset" "$pkgdir/etc/mkinitcpio.d/overlayroot.preset"
  install -Dm644 "$srcdir/overlayroot-motd.sh" "$pkgdir/etc/profile.d/overlayroot-motd.sh"
  install -Dm644 "$srcdir/90-overlayroot.hook" "$pkgdir/usr/share/libalpm/hooks/90-overlayroot.hook"
}
