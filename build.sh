#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

sudo pacman-key --init
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

paru -Syu --noconfirm --ignore linux

PKG='$$TEMPLATE_PKG$$'

paru -G "$PKG"
paru -B "$PKG" --noconfirm

cp "$PKG"/*.pkg.tar.zst .
