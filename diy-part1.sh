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
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git infinityfreedom https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git' feeds.conf.default


# cd openwrt
# cd feeds/luci/applications
git clone https://github.com/kannychak/luci-app-syncthing
git clone https://github.com/rufengsuixing/luci-app-adguardhome
git clone https://github.com/garypang13/openwrt-adguardhome
git clone https://github.com/pymumu/luci-app-smartdns
