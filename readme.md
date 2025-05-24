## Lutris Docker Container with PulseAudio (Arch Linux)

This is a README file for a Lutris Docker container that includes PulseAudio for audio support, running on Arch Linux.

### Overview

The Lutris Docker container is a pre-configured environment for running games and other applications on your Linux system. This particular container is based on Arch Linux and includes PulseAudio, a sound server that provides a unified interface for your audio devices, allowing for seamless audio playback and recording.

### Features

- **Arch Linux**: The container is built on the Arch Linux distribution, providing a stable and up-to-date base for your Lutris setup.
- **Lutris**: The latest version of the Lutris game launcher, which simplifies the installation and management of games on Linux.
- **PulseAudio**: Integrated PulseAudio sound server for high-quality audio playback and recording.

### Installation

dependencies

```bash
	pulseaudio
	docker
	docker-compose
```
Edit .env file for parameters


### Usage

Create pulse audio socket and cookie with provided bash script and then just do

```bash
	docker-compose up
```

### Conclusion

This Lutris Docker container with PulseAudio integration provides a seamless audio experience for your games and applications on Arch Linux. By using this pre-configured environment, you can focus on enjoying your favorite titles without worrying about audio-related issues.
