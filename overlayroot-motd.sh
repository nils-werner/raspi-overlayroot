if [ "$(awk '$2 == "/overlay" { print $3 }' /proc/mounts)" = "tmpfs" ]; then
cat << EOF

==> WARNING: overlayroot backed on tmpfs in effect.  None of the changes you
make will be preserved after reboot.

To disable overlayroot remove the 'overlayroot' argument from the kernel
commandline.
EOF
fi
