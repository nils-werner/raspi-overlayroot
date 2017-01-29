# overlayroot for Raspberry Pi

Mounts an overlay filesystem over the root filesystem, so you can run without losing data on powerloss or wearing out your SD cards.

## Installation

### Package

Install this package

```
makepkg -si
```

then add to the end of `/boot/config.txt`

```
initramfs initrd followkernel
```

try rebooting, it should boot as normal.

### Enable overlayroot hook

Then try adding `overlayroot` to your `HOOKS` array in `/etc/mkinitcpio.conf`, run

```
mkinitcpio -g /boot/initrd
```

and reboot. It should boot as normal.

### Enable overlayroot in commandline

Add `overlayroot`  to `/boot/cmdline.txt`

```
root=/dev/mmcblk0p2 rw rootwait console=ttyAMA0,115200 console=tty1 selinux=0 plymouth.enable=0 smsc95xx.turbo_mode=N dwc_otg.lpm_enable=0 kgdboc=ttyAMA0,115200 elevator=noop overlayroot
```

and reboot. All changes you make to your filesystem should be non-persistent after this.

### Set filesystems readonly

You can now also set the entire root filesystem as readonly by adding changing `rw` to `ro` in `/boot/cmdline.txt`

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

## Editing the root filesystem

You can run `sudo chroot /overlay/lower` to change into an interactive shell in your SD card file system.

If you have also set your file systems to read-only you can run `sudo rwrootfs` both mount them read-write and then `chroot` into the file system. After exiting that shell, the filesystem is mounted as readonly again.

Be aware that all system settings that are set during boot time will not be set in the chroot. Most notably, DNS hostname resolution will not work.

For full system-upgrades it is recommended you change the filesystems to read-write and remove `overlayroot` from `/boot/cmdline.txt`.

## Debugging

Sometimes, overlayroot may cause trouble during boot time. To boot without it simply remove `overlayroot` from `/boot/cmdline.txt` and

```
initramfs initrd followkernel
```

from `/boot/config.txt`
