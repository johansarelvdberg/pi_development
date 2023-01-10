#!/bin/bash

# Remove bloatware (Wolfram Engine, Libre Office, Minecraft Pi, sonic-pi dillo gpicview penguinspuzzle oracle-java8-jdk openjdk-7-jre oracle-java7-jdk openjdk-8-jre)
sudo apt-get remove --purge wolfram-engine libreoffice* scratch* minecraft-pi sonic-pi dillo gpicview oracle-java8-jdk python-sense-hat python3-sense-hat python3-sense-emu python-sense-emu python-sense-emu-doc wolfram-engine python3-skywriter python-skywriter wolframscript scratch2 scratch openjdk-7-jre oracle-java7-jdk openjdk-8-jre -y

# Autoremove
sudo apt-get autoremove -y

# Install packages
sudo apt install npm
curl -fsSL https://code-server.dev/install.sh | sh

# Clean
sudo apt-get autoclean -y

# Update
sudo apt-get update
