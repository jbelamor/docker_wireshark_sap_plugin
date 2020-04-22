# DOCKER FOR WIRESHARK WITH SAP TRAFFIC DISSECTION PLUGIN
This is a dockerfile for setting up a wireshark instance with a plugin developed by SecureAuthCorp.
The repository of the plugin is --> https://github.com/SecureAuthCorp/SAP-Dissection-plug-in-for-Wireshark

## Instructions
The folder `_shared_data` is the voluma shared with the container to store the pcap files to be analyzed with wireshark.

### Using Github
```
git clone https://github.com/jbelamor/docker_wiresark_sap_plugin.git
cd docker_wiresark_sap_plugin
chmod +x *.sh && ./build.sh && ./wireshark.sh
```

### Using DockerHub
```
docker pull jbelamor/wireshark_sap_plugin
mkdir _shared_data
docker run -d --net=host --privileged -v `pwd`/_shared_data/:/mnt/shared_folder -e XAUTHORITY=$HOME/.Xauthority --env=DISPLAY --env=QT_X11_NO_MITSHM=1 --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --name wireshark_sap joelbelena/wireshark_sap_plugin:latest
```
