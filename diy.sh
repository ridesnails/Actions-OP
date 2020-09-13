#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: digitcloud
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.10.254/g' package/base-files/files/bin/config_generate

# Deassociate bootstrap as default theme
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# Delete default password
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/default-settings/files/zzz-default-settings

# Change sipmle-obfs package to lean's source
cd feeds/diy1/package/
rm -rf simple-obfs
svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/simple-obfs
