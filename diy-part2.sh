#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

rm -rf ./package/lean/luci-theme-argon
# rm -rf ./feeds/packages/net/smartdns
rm -rf ./feeds/luci/luci-app-syncthing
# rm -rf ./feeds/packages/utils/syncthing
# rm -rf ./feeds/packages/utils/adguardhome

# 更新部份插件的版本
sed -i '/PKG_VERSION:=/{s/.*/PKG_VERSION:=5.2020.04/g};/PKG_SOURCE_VERSION:=/{s/.*/PKG_SOURCE_VERSION:=Release31/g}' ./feeds/packages/net/smartdns/Makefile
sed -i '/PKG_VERSION:=/{s/.*/PKG_VERSION:=v1.7.1/g}' ./feeds/packages/utils/syncthing/Makefile
