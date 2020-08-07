#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script (after Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

rm -rf ./feeds/packages/utils/syncthing
svn co https://github.com/kannychak/openwrt_feeds/trunk/syncthing ./feeds/packages/utils/syncthing
git clone https://github.com/kannychak/openwrt-adguardhome ./feeds/packages/utils/adguardhome

rm -rf ./feeds/packages/net/smartdns
git clone https://github.com/pymumu/openwrt-smartdns ./feeds/packages/net/smartdns

rm -rf ./package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06 ./package/lean/luci-theme-argon

cd feeds
mkdir custom
cd custom
git clone https://github.com/rufengsuixing/luci-app-adguardhome
git clone https://github.com/pymumu/luci-app-smartdns -b lede luci-app-smartdns
git clone https://github.com/kannychak/luci-app-syncthing
