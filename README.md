Here is a config I use for PXE booting both UEFI and legacy BIOS clients at the same time.

See common.cfg for boot entry configuration, everything else is just machinery to get pxelinux to execute it, loading the plugins from the directory that matches the architecture of the client

## How to use
1. Set up a TFTP server to serve files from the `./tftp` directory
2. Set up a HTTP server to serve files from the `./tftp/disks` directory (because TFTP is horribly slow, and pxelinux doesn't support the RFC 7440 extension to make it somewhat bearable)
3. Set up an NFS server to serve files from the `./tftp/disks` directory (required for booting older versions of Ubuntu, you may be able to get by with just HTTP in newer releases)
4. Set up a DHCP server to provide correct config file depending on the type of the client. See `dnsmasq.conf` for raw dnsmasq, or `etc_config_network` for OpenWRT
5. Configure `common.cfg` to your needs. An example of booting **Ubuntu 20.04.3** Installer/Live CD is provided.
6. (Optional) Run `./download.sh` to update the PXELINUX binary files from kernel.org. You can also change the `$VERSION` variable in that file if a new one is ever released
