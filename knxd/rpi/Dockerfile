 # knxd
# 
#
FROM resin/rpi-raspbian:stretch

MAINTAINER Sven Berger


RUN apt-get update
RUN apt-get dist-upgrade -qy
RUN apt-get install -qy git-core init-system-helpers
RUN apt-get install -qy build-essential wget cdbs debhelper libusb-1.0-0-dev libsystemd-dev 
RUN apt-get install -qy autotools-dev autoconf automake libtool pkg-config dh-systemd libev-dev cmake 


RUN git clone -b stable https://github.com/knxd/knxd.git

RUN cd knxd \
     && ./bootstrap.sh \
     && ./configure --disable-systemd --enable-tpuart --enable-usb --enable-eibnetipserver --enable-eibnetip --enable-eibnetserver --enable-eibnetiptunnel \
     && mkdir -p src/include/sys && ln -s /usr/lib/bcc/include/sys/cdefs.h src/include/sys \
     && make \
     && make install

RUN apt-get remove build-essential debhelper autotools-dev autoconf automake cmake pkg-config -qy \
  && apt-get autoremove -qy \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rm -R ./knxd

EXPOSE 3672 6720

COPY scripte/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["knxd"]