#!/bin/bash
echo "Creating Pulseaudio socket"
bash pulseAudioHostSocket.sh
echo "xorg routing"
xhost +local:docker
echo "starting docker with lutris"
docker-compose up
