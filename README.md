# Mariner linux container image with systemd

## Build docker image with docker tools

I used a private registry to build the image with docker tools.
1) docker run -d -p 5000:5000 --restart=always --name registry registry:2

2) docker build -t localhost:5000/mariner-systemd . 

Push local image to registry
3) docker push localhost:5000/mariner-systemd

## Using docker
```
❯ docker run --privileged --rm -it localhost:5000/mariner-systemd /usr/bin/bash
Created symlink /etc/systemd/system/systemd-firstboot.service → /dev/null.
Created symlink /etc/systemd/system/systemd-udevd.service → /dev/null.
Created symlink /etc/systemd/system/systemd-modules-load.service → /dev/null.
Created symlink /etc/systemd/system/multi-user.target.wants/docker-entrypoint.service → /etc/systemd/system/docker-entrypoint.service.
/docker-entrypoint.sh: starting /lib/systemd/systemd --show-status=false --unit=docker-entrypoint.target
systemd 250 running in system mode (+PAM -AUDIT +SELINUX -APPARMOR +IMA +SMACK -SECCOMP +GCRYPT -GNUTLS +OPENSSL -ACL +BLKID -CURL +ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB -ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
Detected virtualization docker.
Detected architecture x86-64.
Initializing machine ID from random generator.
/usr/lib/systemd/system/dbus.socket:5: ListenStream= references a path below legacy directory /var/run/, updating /var/run/dbus/system_bus_socket → /run/dbus/system_bus_socket; please update the unit file accordingly.
tmp.mount: Directory /tmp to mount over is not empty, mounting anyway.
modprobe@configfs.service: Deactivated successfully.
modprobe@drm.service: Deactivated successfully.
modprobe@fuse.service: Deactivated successfully.
+ source /etc/docker-entrypoint-cmd
++ /usr/bin/bash
root [ / ]# 

```

## Using crictl/containerd

Pull image for containerd/crictl use
1) crictl pull localhost:5000/mariner-systemd

Notes: Check the container-config.json , the trick is to use the equivalend of the --privileged in "docker run" in the crictl.

TODO:
Start pod
Start container

```
```