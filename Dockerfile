FROM --platform=linux/amd64 mcr.microsoft.com/cbl-mariner/base/core:2.0.20220909
MAINTAINER Carlos Marcelo "crodriguezde@microsoft.com"

RUN tdnf -y install iputils
RUN tdnf -y install bind-utils
RUN tdnf -y install net-tools
RUN tdnf -y install python
RUN tdnf -y install systemd
RUN tdnf -y install dos2unix
RUN tdnf -y install python3-pip
RUN pip install dnspython
RUN pip install requests
RUN pip install netifaces
RUN pip install statsd
RUN pip install pyopenssl
RUN tdnf -y install vim
RUN tdnf -y install sudo
RUN tdnf -y install procps
RUN tdnf -y install mdadm
RUN tdnf -y install parted
RUN tdnf -y install util-linux
RUN tdnf -y install gawk
RUN tdnf -y install dbus
RUN tdnf -y install walinuxagent
RUN tdnf -y install moby-cli moby-engine
RUN tdnf -y install nvme-cli
RUN tdnf -y install python3-m2crypto
RUN tdnf -y install dnsmasq
RUN tdnf -y install rsync
RUN tdnf -y install ntp
RUN tdnf -y install gobject-introspection
RUN tdnf -y install file
RUN tdnf -y install veritysetup
RUN tdnf -y install squashfs-tools
RUN tdnf -y install glib

#RUN rm -rf /etc/systemd/system/{dbus*,getty.target.wants,multi-user.target.wants,network-online.target.wants,sockets.target.wants,timers.target.wants}

#VOLUME ["/sys/fs/cgroup"]
#VOLUME ["/run"]

COPY docker-entrypoint.sh /
RUN chmod 0700 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]