#!/usr/bin/env bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

ADMIN_USER="azureuser"
ADMIN_HOME="/home/${ADMIN_USER}"

retry() {
  local attempts=0
  local max_attempts=5

  until "$@"; do
    attempts=$((attempts + 1))
    if [[ "${attempts}" -ge "${max_attempts}" ]]; then
      return 1
    fi
    sleep $((attempts * 10))
  done
}

retry apt-get update
retry apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  dbus-x11 \
  gpg \
  git \
  software-properties-common \
  wget \
  xfce4 \
  xfce4-goodies \
  xorg \
  xorgxrdp \
  xrdp

install -d -m 0755 /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" \
  > /etc/apt/sources.list.d/docker.list

curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /etc/apt/keyrings/packages.microsoft.gpg
chmod a+r /etc/apt/keyrings/packages.microsoft.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
  > /etc/apt/sources.list.d/vscode.list

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" \
  > /etc/apt/sources.list.d/edge.list

retry apt-get update
retry apt-get install -y \
  code \
  containerd.io \
  docker-buildx-plugin \
  docker-ce \
  docker-ce-cli \
  docker-compose-plugin \
  microsoft-edge-stable

usermod -aG docker "${ADMIN_USER}"

printf 'startxfce4\n' > /etc/skel/.xsession
printf 'startxfce4\n' > "${ADMIN_HOME}/.xsession"
chown "${ADMIN_USER}:${ADMIN_USER}" "${ADMIN_HOME}/.xsession"

adduser xrdp ssl-cert
systemctl enable --now docker
systemctl enable --now xrdp

runuser -l "${ADMIN_USER}" -c "code --install-extension ms-vscode-remote.remote-containers --force"