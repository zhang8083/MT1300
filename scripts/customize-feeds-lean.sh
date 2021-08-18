cd /workdir
mkdir -p /workdir/openwrt/package/lean

# Add luci-app-ssr-plus
cd /workdir/openwrt/package/lean
git clone --depth=1 https://github.com/fw876/helloworld
cd /workdir/openwrt

# Clone community packages to package/community
mkdir package/community
cd /workdir/openwrt/package/community

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add gotop
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/gotop

# Add smartdns
#svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns ../luci-app-smartdns

cd /workdir/openwrt/package/lean
# Add openclash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash
ARCH=mipsle-softfloat
cd /workdir/openwrt
mkdir -p files/etc/openclash/core
cd files/etc/openclash/core

clash_main_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-$ARCH | sed 's/.*url\": \"//g' | sed 's/\"//g')
#clash_tun_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-$ARCH | sed 's/.*url\": \"//g' | sed 's/\"//g')
#clash_game_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN | grep /clash-linux-$ARCH | sed 's/.*url\": \"//g' | sed 's/\"//g')

wget $clash_main_url && tar zxvf clash-linux-*.gz && rm -f clash-linux-*.gz
#wget -qO- $clash_main_url | gunzip -c > clash
#wget -qO- $clash_tun_url  | gunzip -c > clash_tun
#wget -qO- $clash_game_url | tar xOvz > clash_game

chmod +x clash*


# Fix mt76 wireless driver
#cd  /workdir/openwrt/package/kernel/mt76
#rm -f Makefile
#wget https://raw.githubusercontent.com/openwrt/openwrt/master/package/kernel/mt76/Makefile
#sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
