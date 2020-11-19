#!/bin/bash
#
# Library for managing Bitnami components

# Constants
CACHE_ROOT="/tmp/bitnami/pkg/cache"

# Functions

########################
# Download and unpack a Bitnami package
# Globals:
#   OS_NAME
#   OS_ARCH
#   OS_FLAVOUR
# Arguments:
#   $1 - component's name
#   $2 - component's version
# Returns:
#   None
#########################
commercial_component_unpack() {
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
    echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list
    echo "deb http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
    echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
    apt-get update && apt-get install elasticsearch
}
