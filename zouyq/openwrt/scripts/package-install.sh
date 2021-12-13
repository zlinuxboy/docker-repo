#!/bin/bash

mkdir -p /scripts/opkgs && cd "$_"
#github repo
repo_path=vernesong/OpenClash

repo_releases_path=https://api.github.com/repos/$repo_path/releases
repo_release_version=$(curl -s $repo_releases_path | grep -m1 '"tag_name":' |  sed -E 's/.*"([^"]+)".*/\1/')
repo_download_path=$(curl -s $repo_releases_path | grep -m1 '"browser_download_url":' |  sed -E 's/.*"([^"]+)".*/\1/')
echo start to download version is $repo_release_version
echo start to download url is $repo_download_path

# install file
wget -qO openclash_$repo_release_version.ipk $repo_download_path && opkg install openclash_$repo_release_version.ipk

