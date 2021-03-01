cd /workdir/openwrt/package/lean
git clone --depth=1 https://github.com/fw876/helloworld
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall
svn co https://github.com/pymumu/smartdns/trunk/package/openwrt smartdns
svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns

mkdir /workdir/openwrt/package/lean/redsocks2 
cd /workdir/openwrt/package/lean/redsocks2 
wget https://github.com/coolsnowwolf/lede/blob/master/package/lean/redsocks2/Makefile

