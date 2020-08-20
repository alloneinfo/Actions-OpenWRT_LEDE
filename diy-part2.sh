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
git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06 ./package/lean/luci-theme-argon

# rm -rf ./feeds/packages/net/smartdns
# rm -rf ./feeds/luci/luci-app-syncthing
# rm -rf ./feeds/packages/utils/syncthing
# rm -rf ./feeds/packages/utils/adguardhome

# 更新部份插件的版本
sed -i '/PKG_VERSION:=/{s/.*/PKG_VERSION:=5.2020.04/g};/PKG_SOURCE_VERSION:=/{s/.*/PKG_SOURCE_VERSION:=Release31/g}' ./feeds/packages/net/smartdns/Makefile

# rm -rf ./feeds/packages/utils/syncthing
svn co https://github.com/kannychak/openwrt_feeds/trunk/syncthing ./feeds/packages/utils/syncthing
sed -i '/PKG_VERSION:=/{s/.*/PKG_VERSION:=v1.8.0/g}' ./feeds/packages/utils/syncthing/Makefile

date=`date +%m.%d.%Y`
sed -i "s/DISTRIB_DESCRIPTION.*/DISTRIB_DESCRIPTION='%D %V %C by Kenny'/g" package/base-files/files/etc/openwrt_release
sed -i "s/# REVISION:=x/REVISION:= $date/g" include/version.mk