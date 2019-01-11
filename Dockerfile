FROM ubuntu:16.04

MAINTAINER Joel B 

RUN apt-repository ppa:wireshark-dev/stable -y; \
    apt-get -y update; \
    DEBIAN_FRONTEND=noninteractive apt-get --yes install wireshark wireshark-dev git cmake;

#Plugin instalation
RUN git clone https://github.com/SecureAuthCorp/SAP-Dissection-plug-in-for-Wireshark/ && \
    cd SAP-Dissection-plug-in-for-Wireshark/ && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu/wireshark/plugins/2.6/epan/ .. && \
    make && \
    make install clean BATCH=yes

ENV shared_folder /mnt/shared_folder
RUN mkdir -p ${shared_folder}
WORKDIR ${shared_folder}

CMD ["wireshark"]