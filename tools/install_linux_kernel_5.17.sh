#!/bin/sh

sudo apt update
sudo apt upgrade

curl -o "$HOME"/Downloads/linux-image-unsigned-5.17.15-051715-generic_5.17.15-051715.202206141358_amd64.deb https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17.15/amd64/linux-image-unsigned-5.17.15-051715-generic_5.17.15-051715.202206141358_amd64.deb

curl -o "$HOME"/Downloads/linux-modules-5.17.15-051715-generic_5.17.15-051715.202206141358_amd64.deb https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17.15/amd64/linux-modules-5.17.15-051715-generic_5.17.15-051715.202206141358_amd64.deb

sudo apt install "$HOME"/Downloads/linux-image-unsigned-5.17.15-051715-generic_5.17.15-051715.202206141358_amd64.deb "$HOME"/Downloads/linux-modules-5.17.15-051715-generic_5.17.15-051715.202206141358_amd64.deb

