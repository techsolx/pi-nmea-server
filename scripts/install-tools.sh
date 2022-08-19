#!/bin/sh
set -e
USERNAME=navigator

sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get update
sudo apt-get -y install \
  apt-transport-https \
  build-essential \
  ca-certificates \
  cmake \
  curl \
  fail2ban \
  fldigi \
  gdb \
  git \
  gpsd \
  gpsd-clients \
  htop \
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
  libreadline6-dev \
  libsqlite3-dev \
  libssl-dev \
  lm-sensors \
  lzma \
  lzma-dev \
  mtr \
  net-tools \
  nmap \
  opencpn \
  pkg-config \
  python3-pip \
  python-is-python3 \
  socat \
  sqlite3 \
  tk-dev \
  tmux \
  tree \
  unzip \
  uuid-dev \
  vim \
  wget \
  zlib1g-dev

# Setup sudo to allow no-password sudo for "$USERNAME"
#sudo useradd -m -s /bin/bash $USERNAME
sudo cp /etc/sudoers /etc/sudoers.orig
echo "$USERNAME  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USERNAME

# other stuff for this box:
sudo -H -u $USER bash -c "curl https://pyenv.run | bash"
sudo -H -u $USER bash -c "curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash"
