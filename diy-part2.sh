#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# 标识固件文件名称
sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' ./include/image.mk
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk

# 标识固件方便识别
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt'/DISTRIB_DESCRIPTION='OpenWrt Mod by Kanny'/g" ./package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='OpenWrt_K'/g" ./package/base-files/files/bin/config_generate
sed -i '/REVISION:=/{s/.*/REVISION:= $(shell date +'%F')/g}' ./include/version.mk
sed -i "s/%D %V, %C.*/%D %V, %C Mod By Kanny/g" ./package/base-files/files/etc/banner

cp -f ./files/zzz-default-settings ./package/lean/default-settings/files/zzz-default-settings

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 替换 luci-theme-argon
rm -rf ./package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06 ./package/lean/luci-theme-argon

# 修改默认主题为 luci-theme-argon
sed -i "s/option mediaurlbase.*/option mediaurlbase '\/luci-static\/argon'/g" ./feeds/luci/modules/luci-base/root/etc/config/luci

# 替换 SmartDNS 并更新版本
rm -rf ./feeds/packages/net/smartdns
git clone https://github.com/alloneinfo/openwrt-smartdns ./feeds/packages/net/smartdns
#sed -i '/PKG_VERSION:=/{s/.*/PKG_VERSION:=8.2020.24/g};/PKG_SOURCE_VERSION:=/{s/.*/PKG_SOURCE_VERSION:=Release32/g}' ./feeds/packages/net/smartdns/Makefile
sed -i '/PKG_VERSION:=/{s/.*/PKG_VERSION:=8.2020.27/g}' ./feeds/packages/net/smartdns/Makefile
sed -i '/PKG_SOURCE_VERSION:=/{s/.*/PKG_SOURCE_VERSION:=7af6f475da372842c48f570f44b52f48616b11d6/g}' ./feeds/packages/net/smartdns/Makefile

# 替换 luci-app-zerotier
rm -rf ./package/lean/luci-app-zerotier
git clone https://github.com/alloneinfo/luci-app-zerotier ./package/lean/luci-app-zerotier

# 替换 Syncthing 并更新版本
# rm -rf ./feeds/packages/utils/syncthing
# svn co https://github.com/alloneinfo/openwrt_feeds/trunk/syncthing ./feeds/packages/utils/syncthing
# sed -i '/PKG_HASH:=/{s/.*/PKG_HASH:=skip/g}' ./feeds/packages/utils/syncthing/Makefile
sed -i '/PKG_VERSION:=/{s/.*/PKG_VERSION:=1.8.0/g}' ./feeds/packages/utils/syncthing/Makefile
sed -i '/PKG_HASH:=/{s/.*/PKG_HASH:=04d78fbe6015334c284bf46ffcf8feb6b2b690ef810f2f0c5732cdee5cd8142a/g}' ./feeds/packages/utils/syncthing/Makefile