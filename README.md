# overlayroot for Raspberry Pi

Mounts an overlay filesystem over the root filesystem, so you can run without losing data on powerloss or wearing out your SD cards.

## Background

Most common Linux installations require large parts of the root fileystem to be writable to run services reliably: Logging services create logfiles, other services create temporary config files, some services need a cache they can write to.

However, SD cards like the ones used with Raspberry Pis don't like constantly being written to. They wear out and start to show errors after a few months or years of constantly being written to.

So what one needs in this situation is a file system that can be read-only on the hardware side, but read-write on the operating system side.

OverlayFS can do exactly that: by layering several file systems one can show data from one (the 'lower') filesystem, but have all changes to the data end up in a different (the 'upper') file system. If the lower filesystem is our SD card and the upper filesystem is a temporary filesystem in RAM, we have effectively separated our SD card from all write-attempts of the operating system. Without the operating system even noticing.

If we even mounted the lower filesystem as readonly, it also becomes 100% tolerant to power-losses. You can simply pull the plug to power down your Raspberry Pi.

Using this method I have been running several Raspberry Pi computers for 3+ years nonstop, after which the power supply gave way and had to be replaced. The SD-Card however is still working.

## Installation

### Package

Install this package

```
makepkg -si
```

Then try rebooting, it should boot as normal.

### Enable overlayroot hook

Then add `overlayroot` to your `HOOKS` array in `/etc/mkinitcpio.conf` and rebuild the initramfs by running

```
mkinitcpio -P
```

and reboot. It should boot as normal.

### Enable overlayroot in commandline

With the initramfs in place, you can now enable overlayroot by adding `overlayroot` to the end of `/boot/cmdline.txt`

```
root=/dev/mmcblk0p2 rw rootwait console=ttyAMA0,115200 console=tty1 selinux=0 plymouth.enable=0 smsc95xx.turbo_mode=N dwc_otg.lpm_enable=0 kgdboc=ttyAMA0,115200 elevator=noop overlayroot
```

and reboot. You should see a warning during login that any changes you make to your filesystem will be non-persistent after this point.

### Set filesystems readonly

You can now also set the entire root filesystem as readonly by changing `rw` to `ro` in `/boot/cmdline.txt`

```
root=/dev/mmcblk0p2 ro rootwait console=ttyAMA0,115200 console=tty1 selinux=0 plymouth.enable=0 smsc95xx.turbo_mode=N dwc_otg.lpm_enable=0 kgdboc=ttyAMA0,115200 elevator=noop overlayroot
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

You can change `ro` back to `rw` and remove `overlayroot` from `/boot/cmdline.txt` to re-enable write access to your root FS.

Alternatively you can run `sudo chroot /overlay/lower` to change into an interactive shell in your SD card file system.

If you have also set your file systems to read-only you can run `sudo rwrootfs` both mount them read-write and then `chroot` into the file system. After exiting that shell, the filesystem is mounted as readonly again.

Be aware that many runtime system settings that are set during boot time will not be set in the chroot. Most notably, you will find that DNS hostname resolution will not work.

For full system-upgrades it is recommended you change the filesystems to read-write and remove `overlayroot` from `/boot/cmdline.txt`.

## Debugging

Sometimes, overlayroot may cause trouble during boot time. To boot without it simply remove `overlayroot` from `/boot/cmdline.txt`.

If you still have problems, you can also try removing the initramfs by removing

```
initramfs initramfs-linux.img followkernel
```

from `/boot/config.txt`.
