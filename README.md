# overlayroot for Raspberry Pi

Mounts an overlay filesystem over the root filesystem, so you can run without losing data on powerloss or wearing out your SD cards.

## Installation

Install this package and then add to the end of `/boot/config.txt`

```
initramfs initrd followkernel
```

try rebooting, it should reboot as normal.

Then try adding `overlayroot` to your `HOOKS` array in `/etc/mkinitcpio.conf` and reboot.

All changes you make to your filesystem should be non-persistent after this. You can now also set the entire root filesystem as readonly by adding changing `rw` to `ro` in `/boot/cmdline.txt`

```
root=/dev/mmcblk0p2 ro rootwait console=ttyAMA0,115200 console=tty1 selinux=0 plymouth.enable=0 smsc95xx.turbo_mode=N dwc_otg.lpm_enable=0 kgdboc=ttyAMA0,115200 elevator=noop
```

and adding `ro` to `/etc/fstab`

```
#
# /etc/fstab: static file system information
#
# <file system>	<dir>	<type>	<options>	<dump>	<pass>
/dev/mmcblk0p1  /boot   vfat    defaults,ro     0       0
```

## Editing the root FS

You can run `sudo rwrootfs` to enable writing to the root filesystem and change into an interactive shell in that filesystem. After exiting that shell, the filesystem is mounted as readonly again.

Be aware that all your dynamic system settings will not be set in the chroot. Most notably, name resolution will not work.

For full system-upgrades you need to change all filesystems to read-write and disable the initramfs.

## Debugging

Sometimes, overlayroot may cause trouble during boot time. To boot without it simply remove the line

```
initramfs initrd followkernel
```

from `/boot/config.txt`
