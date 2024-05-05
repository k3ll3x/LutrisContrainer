#!/bin/bash
# Create the Pulseaudio socket directory
mkdir -p /tmp/pulseaudio

# Create the Pulseaudio client configuration file
cat << EOF > /tmp/pulseaudio/client.conf
default-server = unix:/tmp/pulseaudio/pulseaudio.socket
autospawn = no
daemon-binary = /bin/true
enable-shm = false
EOF

pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio/pulseaudio.socket

touch /tmp/pulseaudio/pulseaudio.cookie

chown -R $USER:$USER /tmp/pulseaudio
chmod -R 755 /tmp/pulseaudio
