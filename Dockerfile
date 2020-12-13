FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu20.04
ENV NVIDIA_DRIVER_CAPABILITIES all
ENV DEBIAN_FRONTEND noninteractive
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y x11-apps mesa-utils libgl1-mesa-glx:i386 libcanberra-gtk-module:i386 pulseaudio dbus-x11
RUN apt-get install -y software-properties-common
RUN apt-get install -y kmod locales
RUN locale-gen en_US.UTF-8
RUN add-apt-repository multiverse
RUN add-apt-repository ppa:graphics-drivers/ppa
RUN apt-get install -y -q nvidia-driver-455
RUN apt-get install -y steam
RUN apt-get install -y pulseaudio-utils
RUN apt-get install -y pciutils psmisc
COPY steam.sh /root/steam.sh
CMD [ '/bin/bash' ]
