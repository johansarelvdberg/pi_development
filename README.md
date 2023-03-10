based on `https://github.com/raspberrycoulis/remove-bloat`

# Remove Bloatware on the Raspberry Pi
Remove bloatware from Raspberry Pi Raspbian with one script. This will remove the storage hogging programs and some other often never-used tools including:

1. Wolfram Engine
2. LibreOffice
3. Minecraft Pi
4. Sonic Pi 
5. Dillo Web Broswer (dillo)
6. Image Viewer (gpicview)
7. Penguines Puzzle (penguinspuzzle)
8. Java (oracle-java8-jdk openjdk-7-jre oracle-java7-jdk openjdk-8-jre)

The script will then `autoremove`, `autoclean` and then `update` the aptitude pacakges on the Pi itself.

## Installation

### Automatic
Run the following command within the Raspberry Pi terminal:

```bash
sudo curl -fsSL https://raw.githubusercontent.com/johansarelvdberg/remove-bloat/master/remove-bloat.sh | bash
```

### Manual
If the automatic method does not work, you can manually download the repository and run the script after making it executable.

```bash
git clone git://github.com/johansarelvdberg/remove-bloat.git
cd remove-bloat
sudo chmod +x remove-bloat.sh
sudo ./remove-bloat.sh
```

# add ons

Install zram for better performance

```bash
cd /tmp
git clone https://github.com/foundObjects/zram-swap.git
cd zram-swap && sudo ./install.sh
```


# Pi setup for development

Based on "Getting started with Pashberry Pi Pico"

## Step 1
Install basic tools as in chapter 1:
```bash
sudo apt update
sudo apt install automake git autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev libusb-1.0-0-dev -y
sudo apt install minicom  gdb-multiarch sshfs openssh-server rsync ca-certificates -y
sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi -y
sudo apt install build-essential libstdc++-arm-none-eabi-newlib libusb-1.0-0-dev -y
sudo apt install code -y
code --install-extension marus25.cortex-debug
code --install-extension ms-vscode.cmake-tools
code --install-extension ms-vscode.cpptools

wget https://raw.githubusercontent.com/raspberrypi/pico-setup/master/pico_setup.sh
chmod +x pico_setup.sh
./pico_setup.sh
sudo reboot
```

## Step 2
Get the sdk and exmaples:
```bash
git clone https://github.com/raspberrypi/pico-sdk.git --branch master
cd pico-sdk
git submodule update --init
cd ..
git clone https://github.com/raspberrypi/pico-examples.git --branch master
```
Install the chain tools"
```bash

cd pico-sdk
git pull
git submodule update
```


## Step 3

Compile process see readme of `https://github.com/raspberrypi/pico-sdk`.

Use picotool to load binary to Pico, see `https://github.com/raspberrypi/picotool`

Unplug Pico, hold boot select down and plugin in Pico to enable storage mode. Run ` sudo picotool info -a`
to get info about Pico.

## Step 4

cross compile see 

-   https://hub.docker.com/r/sdthirlwall/raspberry-pi-cross-compiler/  
-   https://desertbot.io/blog/how-to-cross-compile-for-raspberry-pi 
-   https://hub.docker.com/r/mitchallen/pi-cross-compile/

Mounting:

-   https://phoenixnap.com/kb/sshfs
