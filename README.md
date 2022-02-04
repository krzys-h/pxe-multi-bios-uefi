Here is a config I use for PXE booting both UEFI and legacy BIOS clients at the same time.

This is the GRUB variant; for the previous version I used see the `pxelinux` branch.

The main config is in `boot/grub/grub.cfg`

## How to use
1. Run `./make.sh` on Ubuntu to copy the required files from system packages
1. Set up a TFTP server to serve files from the `./tftp` directory
2. Set up a HTTP server to serve files from the `./tftp` directory (because TFTP is horribly slow, and you would need to load the initrd over it otherwise, which is ~100MB on recent Ubuntu releases)
3. Set up an NFS server to serve files from the `./tftp/disks` directory (you may be able to get by with just HTTP in newer releases of Ubuntu if you have enough RAM to fit the entire ISO)
4. Set up a DHCP server to provide correct config file depending on the type of the client. See `dnsmasq.conf` for raw dnsmasq, or `etc_config_network` for OpenWRT
5. Configure `boot/grub/grub.cfg` to your needs. An example of booting **Ubuntu 20.04.3** Installer/Live CD is provided.
