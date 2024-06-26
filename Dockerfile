FROM archlinux/archlinux:base as lutris

RUN pacman -Syy --noconfirm
RUN pacman -S --noconfirm lutris

RUN echo [multilib] >> /etc/pacman.conf
RUN echo Include = /etc/pacman.d/mirrorlist >> /etc/pacman.conf

RUN pacman -Syy --noconfirm
RUN pacman -S --noconfirm nvidia nvidia-utils lib32-nvidia-utils nvidia-settings lib32-mesa vulkan-icd-loader lib32-vulkan-icd-loader vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader
RUN pacman -S --noconfirm iputils p7zip winetricks wine steam pciutils firefox sdl procps-ng
RUN pacman -Sy --noconfirm joystick

RUN pacman -Sy --noconfirm \
    pulseaudio \
    pulseaudio-alsa \
    alsa-utils \
    pavucontrol

RUN pacman -Sy --noconfirm lib32-libpulse lib32-alsa-plugins


#User with sudo
RUN groupadd sudo
RUN pacman -Syu --needed sudo --noconfirm
RUN useradd -m gamer
RUN gpasswd -a gamer sudo
RUN echo '%sudo ALL=(ALL) ALL' >> /etc/sudoers
RUN echo 'gamer:gamer' | chpasswd

# Add the user to the audio group
RUN usermod -a -G audio gamer
#set machine id?
RUN systemd-machine-id-setup

USER gamer
ENV USER=gamer
#VOLUME /home/gamer

CMD ["lutris"]
