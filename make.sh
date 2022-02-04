#!/bin/bash -e

# Based on https://github.com/Jingella/grub-pxe-boot

sudo apt install grub-efi-amd64-bin grub-efi-amd64-signed grub-efi-ia32-bin grub-pc-bin shim-signed
grub-mknetdir --net-directory=tftp/
if [ -f /usr/lib/grub/x86_64-efi-signed/grubnetx64.efi.signed ]; then
  cp /usr/lib/grub/x86_64-efi-signed/grubnetx64.efi.signed tftp/boot/grub/x86_64-efi/grubx64.efi
fi
if [ -f /usr/lib/shim/shimx64.efi.signed ]; then
  cp /usr/lib/shim/shimx64.efi.signed tftp/boot/grub/x86_64-efi/shimx64.efi
fi
