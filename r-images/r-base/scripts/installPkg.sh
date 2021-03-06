#!/usr/bin/env bash

set -eo pipefail

[ -f /etc/apt/apt.conf.d/01proxy ] && (
    ping -c 3 -i 0 -w 2 $APT_PROXY_HOST || rm -f /etc/apt/apt.conf.d/01proxy
)

apt-get update
apt-get install -t unstable -y --no-install-recommends \
        build-essential \
		r-base-dev=${R_BASE_VERSION}*

R CMD install $@

apt-get purge -y build-essential cpp cpp-5 dpkg-dev \
	g++ g++-5 gcc gcc-5 gfortran gfortran-5 perl-modules fonts-dejavu-core

rm -rf /tmp/downloaded_packages/ /tmp/*.rds

/usr/local/bin/apt-cleanup.sh
