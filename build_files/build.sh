#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# dnf install -y <package>

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

### Install Nessus
# Download Nessus RPM
curl --request GET \
  --url 'https://www.tenable.com/downloads/api/v2/pages/nessus/files/Nessus-10.11.0-el9.x86_64.rpm' \
  --output '/tmp/Nessus-10.11.0-el9.x86_64.rpm'

# Install Nessus
dnf install -y /tmp/Nessus-10.11.0-el9.x86_64.rpm

# Clean up RPM file
rm -f /tmp/Nessus-10.11.0-el9.x86_64.rpm

#### Example for enabling a System Unit File

systemctl enable podman.socket
