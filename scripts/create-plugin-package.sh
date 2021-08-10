cd openwrt/bin/targets/*/*
mkdir ssrp

# plugin list in ../../../packages/mipsel_24kc
pkglist="base/shadowsocksr-libev-*.ipk base/pdnsd-alt_*.ipk base/microsocks_*.ipk base/dns2socks_*.ipk base/simple-obfs*.ipk base/tcping_*.ipk base/v2ray-plugin_*.ipk base/xray_*.ipk base/trojan_*.ipk base/ipt2socks_*.ipk base/redsocks2_*.ipk base/luci-app-ssr-plus_*.ipk base/luci-i18n-ssr-plus-zh-cn_*.ipk luci/luci-compat_*.ipk base/xray-core_*.ipk gli_pub/shadowsocks-libev-ss-*.ipk base/shadowsocks-libev-ss-*.ipk"

for pkg in $pkglist
do
    file=../../../packages/mipsel_24kc/$pkg
    ls=`ls $file 2>/dev/null`
    if [ -z $ls ]
    then
        echo "$pkg does not exists."
    else
        echo "Copying $pkg to ssrp..."
        cp -f $file ./ssrp/
    fi
done

cat << EOF > ./ssrp/install-ssrp.sh
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

chmod +x ./ssrp/install-ssrp.sh

tar czvf mt1300-ssrp.tar.gz ./ssrp
rm -rf ./ssrp
