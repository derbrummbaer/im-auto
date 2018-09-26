 # knxd
# 
#
FROM debian:jessie
MAINTAINER Sven Berger sven@berger-lembeck.debhelper


RUN  apt-get update \
  && apt-get dist-upgrade -qy \
  && apt-get install git-core init-system-helpers -qy \
  && apt-get install build-essential wget cdbs debhelper libusb-1.0-0-dev libsystemd-daemon-dev autotools-dev autoconf automake libtool pkg-config dh-systemd libev-dev cmake -qy


RUN git clone https://github.com/knxd/knxd.git

ENV KNXD_CHANGESET d65322446039f15610dc5058c4ea80a2c4699987
#ENV KNXD_VERSION v0.12.6
ENV KNXD_VERSION stable

# PATCH: remove tests as they don't run well on travis
RUN cd knxd \
 && git checkout ${KNXD_VERSION} \
 && echo "#!/bin/bash" > tools/test.sh \
 && dpkg-buildpackage -b -uc

RUN dpkg -i knxd_*.deb knxd-tools_*.deb

RUN apt-get remove build-essential debhelper autotools-dev autoconf automake cmake pkg-config -qy \
  && apt-get autoremove -qy \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 6720

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["knxd"]













# RUN apt-get -y update
# RUN apt-get -y install git-core build-essential debhelper autotools-dev autoconf automake libtool \
#                        libusb-1.0-0-dev  pkg-config base-files  base-files libev-dev  \
#                        init-system-helpers dh-systemd libsystemd-dev  libsystemd-daemon-dev

# # now build+install knxd

# RUN git clone https://github.com/knxd/knxd.git && cd knxd && git checkout tags/v0.12.6 && \
#     dpkg-buildpackage -b -uc && cd .. && dpkg -i knxd_*.deb knxd-tools_*.deb


# #EXPOSE  4720 6720 3671/udp
# ##### NOTE AND README ######
# #start this container with --net=host instead of binding ports

# CMD ["knxd", "-e 0.0.1", "-E 0.0.2:8", "-DTRS", "-c", "-i", "--send-delay=70", "-B single", "-b ipt:192.168.177.24"]
