Here is a config I use for PXE booting both UEFI and legacy BIOS clients at the same time.

See common.cfg for boot entry configuration, everything else is just machinery to get pxelinux to execute it, loading the plugins from the directory that matches the architecture of the client

## How to use
1. Set up a TFTP server to serve files from the `./tftp` directory
2. Set up an NFS server to serve files from the `./tftp/disks` directory (if you need it - required for booting Ubuntu)
3. Set up a DHCP server to provide correct config file depending on the type of the client. See `dnsmasq.conf` for raw dnsmasq, or `etc_config_network` for OpenWRT
4. Configure `common.cfg` to your needs. An example of booting **Ubuntu 16.04** and **Ubuntu 20.04** Installer/Live CD is provided.
5. (Optional) Run `./download.sh` to update the PXELINUX binary files from kernel.org. You can also change the `$VERSION` variable in that file if a new one is ever released
