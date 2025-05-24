#!/bin/bash

pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket

# Create the Pulseaudio client configuration file
cat << EOF > /tmp/pulseaudio.client.conf
default-server = unix:/tmp/pulseaudio.socket
autospawn = no
daemon-binary = /bin/true
enable-shm = false
EOF
