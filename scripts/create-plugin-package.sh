cd openwrt/bin/targets/*/*
mkdir plugin

# plugin list in ../../../packages/mipsel_24kc
pkglist="base/shadowsocksr-libev-*.ipk base/pdnsd-alt_*.ipk base/chinadns-ng_*.ipk base/microsocks_*.ipk base/dns2socks_*.ipk base/simple-obfs*.ipk base/tcping_*.ipk base/v2ray-plugin_*.ipk base/xray_*.ipk base/trojan_*.ipk base/ipt2socks_*.ipk base/redsocks2_*.ipk base/luci-*-passwall*.ipk base/luci-*-ssr-plus*.ipk luci/luci-compat_*.ipk base/xray-core_*.ipk gli_pub/shadowsocks-libev-ss-*.ipk base/shadowsocksr-libev-ssr-*.ipk"

for pkg in $pkglist
do
    file=../../../packages/mipsel_24kc/$pkg
    ls=`ls $file 2>/dev/null`
    if [ -z $ls ]
    then
        echo "$pkg does not exists."
    else
        echo "Copying $pkg to plugin..."
        cp -f $file ./plugin/
    fi
done


echo "Creating installation script for passwall"
cat << EOF > ./plugin/install-passwall.sh
opkg update
opkg install luci luci-i18n-base-zh-cn ttyd luci-app-ttyd luci-i18n-ttyd-zh-cn luci-compat luci-lib-ipkg wget htop

opkg install ./chinadns-ng_1.0-beta.25-1_mipsel_24kc.ipk 
opkg install ./dns2socks_2.1-2_mipsel_24kc.ipk
opkg install ./ipt2socks_1.1.3-2_mipsel_24kc.ipk
opkg install ./microsocks_1.0.2-2_mipsel_24kc.ipk 
opkg install ./pdnsd-alt_1.2.9b-par-3_mipsel_24kc.ipk 
opkg install ./shadowsocks-libev-ss-local_3.3.5-1_mipsel_24kc.ip
opkg install ./shadowsocks-libev-ss-redir_3.3.5-1_mipsel_24kc.ipk
opkg install ./shadowsocksr-libev-ssr-local_2.5.6-9_mipsel_24kc.ipk 
opkg install ./shadowsocksr-libev-ssr-redir_2.5.6-9_mipsel_24kc.ipk 
opkg install ./simple-obfs-client_0.0.5_mipsel_24kc.ipk 
opkg install ./tcping_0.3_mipsel_24kc.ipk 
opkg install ./trojan-plus_10.0.3-2_mipsel_24kc.ipk 
opkg install ./xray-core_1.4.2-1_mipsel_24kc.ip
opkg install ./luci-app-passwall_4-32_all.ipk 
opkg install ./luci-i18n-passwall-zh-cn_4-32_all.ipk
EOF

chmod +x ./plugin/install-passwall.sh

echo "Creating installation script for ssr plus"
cat << EOF > ./plugin/install-ssrp.sh
opkg update
opkg install luci luci-i18n-base-zh-cn ttyd luci-app-ttyd luci-i18n-ttyd-zh-cn luci-compat luci-lib-ipkg wget htop

opkg install ./shadowsocksr-libev-alt_*.ipk
opkg install ./pdnsd-alt_*.ipk 
opkg install ./microsocks_*.ipk 
opkg install ./dns2socks_*.ipk 
opkg install ./shadowsocksr-libev-ssr-local_*.ipk 
opkg install ./simple-obfs*.ipk
opkg install ./tcping_*.ipk 
#opkg install ./v2ray-plugin_*.ipk 
#opkg install ./xray_*.ipk 
#opkg install ./trojan_*.ipk 
opkg install ./ipt2socks_*.ipk
#opkg install ./redsocks2_*.ipk 
opkg install ./xray-core_*.ipk
opkg install ./shadowsocks-libev-ss-local_*.ipk
opkg install ./shadowsocks-libev-ss-server_*.ipk
opkg install ./shadowsocks-libev-ss-redir_*.ipk
opkg install ./shadowsocks-libev-ss-local_*.ipk
opkg install ./shadowsocks-libev-ss-redir_*.ipk
opkg install ./shadowsocks-libev-ss-check_*.ipk
opkg install ./luci-app-ssr-plus_*.ipk
opkg install ./luci-i18n-ssr-plus-zh-cn_*.ipk
EOF

chmod +x ./plugin/install-ssrp.sh


tar czvf mt1300-plugin.tar.gz ./plugin
rm -rf ./plugin
