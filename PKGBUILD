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
  '7e8e5a9e813e46aa679a276b7475c0601d4124f3c35d21797330769a9b21d21d'
  # 'rwrootfs'
  '75b8c2ebe9e08e58f207a82aa93cfdd0b46a2255e49493cf6fedfe97cc61bd98'
  # 'fsck.overlay'
  'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
  # 'journald-volatile-storage.conf'
  'c0c9a711f7554fdd02650409b098fc0636b8f3f574f03d927c6df84f5ec82a7f'
  # 'overlayroot-motd.sh'
  'e2e917ab85d44abfc8e4c504cd8925d6fec5d26c452198303e2238464552e9a1'
  # 'mkinitcpio-overlayroot.conf'
  '27c68a520ad657f6d404bc5c2df4b7f5fb77f048b21bbfc8989d3360a1306251'
  # 'mkinitcpio-overlayroot.preset'
  '9c0293c1edb3f9662b09a5618361457934a82f04ed8aef11786ed54abe33dab7'
  # '90-overlayroot.hook'
  '0a81b378572ea6e2de20d9b52f2a1f6271a98aae31fe01f6c4a386df9ddf56aa'
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
