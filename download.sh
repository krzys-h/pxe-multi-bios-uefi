#!/bin/bash
VERSION=syslinux-6.03

mkdir -p tftp/{bios,efi32,efi64}

wget https://mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/$VERSION.tar.gz
tar xzf $VERSION.tar.gz

cp $VERSION/bios/core/lpxelinux.0 tftp/
cp $VERSION/bios/com32/elflink/ldlinux/ldlinux.c32 tftp/
cp $VERSION/efi32/com32/elflink/ldlinux/ldlinux.e32 tftp/
cp $VERSION/efi64/com32/elflink/ldlinux/ldlinux.e64 tftp/
for platform in bios efi32 efi64; do
	cp $VERSION/$platform/com32/lib/libcom32.c32 tftp/$platform/
	cp $VERSION/$platform/com32/libutil/libutil.c32 tftp/$platform/
	cp $VERSION/$platform/com32/modules/linux.c32 tftp/$platform/
	cp $VERSION/$platform/com32/menu/menu.c32 tftp/$platform/
	cp $VERSION/$platform/com32/menu/vesamenu.c32 tftp/$platform/
done

rm -r $VERSION/ $VERSION.tar.gz
