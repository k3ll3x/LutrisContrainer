FROM archlinux/archlinux:base as lutris

RUN pacman -Syy --noconfirm
RUN pacman -S --noconfirm lutris

RUN echo [multilib] >> /etc/pacman.conf
RUN echo Include = /etc/pacman.d/mirrorlist >> /etc/pacman.conf

RUN pacman -Syy --noconfirm
RUN pacman -S --noconfirm nvidia nvidia-utils lib32-nvidia-utils nvidia-settings \
    lib32-mesa vulkan-icd-loader lib32-vulkan-icd-loader \
    vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader \
    vulkan-radeon lib32-vulkan-radeon \
    amdvlk lib32-amdvlk \
    iputils p7zip winetricks xorg-xinput wine steam pciutils firefox sdl procps-ng

RUN pacman -Sy --noconfirm joystick xdg-utils thunar base-devel git sudo

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

# Add the user to the audio and input group
RUN usermod -a -G audio gamer
RUN usermod -a -G input gamer
#set machine id?
RUN systemd-machine-id-setup

USER gamer
ENV USER=gamer
ENV WINEPREFIX=~/.wine
ENV WINEARCH=amd64
#VOLUME /home/gamer

CMD ["lutris"]
