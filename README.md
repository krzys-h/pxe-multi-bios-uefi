Here is a config I use for PXE booting both UEFI and legacy BIOS clients at the same time.

See common.cfg for boot entry configuration, everything else is just machinery to get pxelinux to execute it, loading the plugins from the directory that matches the architecture of the client

TODO: Figure out where I took all of the executables from and add a script that downloads the latest versions from the source, add some documentation
