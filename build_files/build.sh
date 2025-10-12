#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# add preferred packages to image
dnf5 install -y nmtui btop

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# add asusctl
dnf5 -y copr enable lukenukem/asus-linux
dnf5 -y install asusctl asusctl-rog-gui

# add cosmic (this may be a horrible idea)
#dnf5 -y copr enable ryanabx/cosmic-epoch
#dnf5 -y install cosmic-desktop


# nix setup (may  not actually do anything on silverblue 41 base)
mkdir -p /nix && \
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix -o /nix/determinate-nix-installer.sh && \
	chmod a+rx /nix/determinate-nix-installer.sh
