FROM debian:buster

ARG username="gamer"
ARG userhome="/home/${username}"

ENV HOME ${userhome}
ENV USER ${username}

RUN apt update

RUN apt install -y wget gpg

RUN echo "deb http://download.opensuse.org/repositories/home:/strycore/Debian_12/ ./" | tee /etc/apt/sources.list.d/lutris.list
RUN wget -q https://download.opensuse.org/repositories/home:/strycore/Debian_12/Release.key -O- | apt-key add -
RUN apt update
RUN apt install -y libterm-readline-gnu-perl

RUN apt install -y libvulkan1 p7zip-full wine pciutils xterm libglib2.0-0 libglib2.0-dev dbus-x11
RUN apt install -y alsa-utils pulseaudio
RUN apt install -y libunwind8
RUN apt install -y vulkan-utils dxvk
RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y wine32 libgl1-mesa-glx:i386 libgl1-mesa-dri:i386 libvulkan1:i386 libgnutls30:i386
RUN ldconfig

RUN apt update
RUN apt install -y lutris
RUN apt install -y sudo 

ENV PATH /home/${username}:$PATH

# User
RUN groupadd -r ${username}
RUN useradd -rm -d ${userhome} -s /bin/bash -g ${username} -u 1000 ${username}
RUN adduser ${username} sudo
RUN chown -R ${username}:${username} ${userhome}
RUN echo ${username}:${username} | chpasswd

WORKDIR /home/${username}

USER ${username}
