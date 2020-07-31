#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git infinityfreedom https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git' feeds.conf.default
# sed -i '$a src-link custom /custom' feeds.conf.default
sed -i '$a src-git myfeeds https://github.com/kannychak/openwrt_feeds' feeds.conf.default

#git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
#git clone https://github.com/garypang13/openwrt-adguardhome package/openwrt-adguardhome
#git clone https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
#git clone https://github.com/pymumu/smartdns.git package/smartdns


cd feeds
mkdir custom
cd custom
git clone https://github.com/rufengsuixing/luci-app-adguardhome
git clone https://github.com/kannychak/openwrt-adguardhome
git clone https://github.com/pymumu/openwrt-smartdns
git clone https://github.com/pymumu/luci-app-smartdns -b lede
git clone https://github.com/kannychak/luci-app-syncthing

git clone https://github.com/jerrykuku/luci-theme-argon
