#!/bin/sh
set -e
USERNAME=navigator
HOST_NAME=nav1

sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get update
sudo apt-get -y install \
  apt-transport-https \
  build-essential \
  ca-certificates \
  cmake \
  console-setup-linux \
  curl \
  fail2ban \
  fldigi \
  gdb \
  git \
  gpsd \
  gpsd-clients \
  htop \
  i2c-tools \
  jq \
  lcov \
  libbz2-dev \
  libc6-dev \
  libdbd-pg-perl \
  libdbd-sqlite3-perl \
  libffi-dev \
  libgdbm-compat-dev \
  libgdbm-dev \
  libgdbm-dev \
  liblzma-dev \
  libncurses5-dev \
  libncursesw5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  lightdm \
  lm-sensors \
  lzma \
  lzma-dev \
  mtr \
  net-tools \
  nmap \
  octave \
  opencpn \
  pkg-config \
  python3-pip \
  python-is-python3 \
  rxvt-unicode \
  sense-hat \
  socat \
  sqlite3 \
  tk-dev \
  tmux \
  tree \
  unzip \
  uuid-dev \
  vim \
  wget \
  xfonts-terminus \
  xterm \
  zlib1g-dev

# Setup sudo to allow no-password sudo for "$USERNAME"
sudo useradd -m -s /bin/bash $USERNAME || true
sudo cp /etc/sudoers /etc/sudoers.orig
echo "$USERNAME  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USERNAME

# other stuff for this box:
if ! [[ -x /home/$USERNAME/.pyenv/bin/pyenv ]]; then
  sudo -H -u $USERNAME bash -c "curl https://pyenv.run | bash"
fi

# set hostname
sudo echo $HOST_NAME > /etc/hostname
sudo hostname $HOST_NAME
