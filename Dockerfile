FROM ubuntu:18.04

MAINTAINER Joel B 

RUN apt-get -y update && apt-get install -y software-properties-common && rm -rf /var/lib/apt/lists/*;

RUN apt-add-repository -u ppa:wireshark-dev/stable -y; \
    DEBIAN_FRONTEND=noninteractive apt-get --yes install wireshark wireshark-dev git cmake; \
    rm -rf /var/lib/apt/lists/*; 

#Plugin instalation
RUN git clone https://github.com/SecureAuthCorp/SAP-Dissection-plug-in-for-Wireshark/ && \
    cd SAP-Dissection-plug-in-for-Wireshark/ && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu/wireshark/plugins/3.2/epan/ .. && \
    make && \
    make install clean BATCH=yes

ENV shared_folder /mnt/shared_folder
RUN mkdir -p ${shared_folder}
WORKDIR ${shared_folder}

CMD ["wireshark"]
