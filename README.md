# Actions-OpenWrt
Build OpenWrt using GitHub Actions

[中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

## Usage

- Click the [Use this template](https://github.com/P3TERX/Actions-OpenWrt/generate) button to create a new repository.
- Generate `.config` files using [Lean's OpenWrt](https://github.com/coolsnowwolf/lede) source code. ( You can change it through environment variables in the workflow file. )
- Push `.config` file to the GitHub repository, and the build starts automatically.Progress can be viewed on the Actions page.
- When the build is complete, click the `Artifacts` button in the upper right corner of the Actions page to download the binaries.

### Tips

It may take a long time to create a `.config` file and build the OpenWrt firmware. Thus, before create repository to build your own firmware, you may check out if others have already built it which meet your needs by simply [search `Actions-Openwrt` in GitHub](https://github.com/search?q=Actions-openwrt).

Add some meta info of your built firmware (such as firmware architecture and installed packages) to your repository introduction, this will save others' time.

## 本地配置 .config

- make menuconfig 选好相关插件及配置
- 执行 ./scripts/diffconfig.sh > x86.config

## 基础插件 （X86_efi）
- 文件传输
- ShoadowSocksR Plus+
- 解锁网易云音乐
- SmartDNS
- 网络唤醒
- Frpc && Frps
- UPnp
- KMS
- MWAN3 分流助手
- Zerotier
- Syncthing 储存同步（MOD）
- qBittorrent
- Aria2
- Samba3
- 负载均衡
- TurboACC (SFE)

## 增加及替换的插件
git clone https://github.com/alloneinfo/openwrt-adguardhome ./myfeeds/adguardhome 

git clone https://github.com/rufengsuixing/luci-app-adguardhome ./myfeeds/luci-app-adguardhome

git clone https://github.com/pymumu/luci-app-smartdns -b lede ./myfeeds/luci-app-smartdns 

git clone https://github.com/alloneinfo/luci-app-syncthing ./myfeeds/luci-app-syncthing    (配合自己的习惯，简单修改增加 conf 路径定义 )


##### 替换 luci-theme-argon
rm -rf ./package/lean/luci-theme-argon

git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06 ./package/lean/luci-theme-argon


##### 替换 SmartDNS ( 更新为最新版本，查看最新版本  https://github.com/pymumu/smartdns/releases ）
rm -rf ./feeds/packages/net/smartdns

git clone https://github.com/alloneinfo/openwrt-smartdns ./feeds/packages/net/smartdns


##### 替换 luci-app-zerotier
rm -rf ./package/lean/luci-app-zerotier

git clone https://github.com/alloneinfo/luci-app-zerotier ./package/lean/luci-app-zerotier


## Acknowledgments

- [Microsoft](https://www.microsoft.com)
- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub](https://github.com)
- [GitHub Actions](https://github.com/features/actions)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cisco](https://www.cisco.com/)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [Cowtransfer](https://cowtransfer.com)
- [WeTransfer](https://wetransfer.com/)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/master/LICENSE) © P3TERX
