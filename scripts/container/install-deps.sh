#!/usr/bin/env bash
# Install container dependencies for Ubuntu 18.04, used in container build
set -e
set -x

apt-get update
apt-get install -y texlive-full curl

export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt-get -qq update
apt-get install -y google-cloud-sdk
