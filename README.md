此项目专门为 GL-iNet MT1300 打造，感谢P3TERX的GitHub Actions项目。

感谢Lienol和Lean两位大神所提供的插件。

默认设置：

主机名：MT1300

IP 地址：192.168.8.1

WIFI SSID：MT1300

WIFI 密码：password


使用 GL-iNet 官方19.07.2源码，添加了Lienol和Lean两位大神的部分插件。
修改对应 .config.gl 文件触发自动编译

2021-01-21 新增从Lean源码编译的固件，修改 .config.lean 触发编译
2021-03-01 新增从Lienol源码编译的固件，修改 .config.lienol 触发编译

已知问题：
目前GL源码的MT1300 profile不带WIFI驱动，如果需要，可以自己选择7615驱动，但是此驱动好像还有些问题：
1. 不能2.4G和5G两路WIFI，只能有1路。
2. 另外从WIFI连接不知道为什么DHCP拿不到地址。

Lean源码
1. 有两路WIFI，但是需要两路相同频段和频道，否则不工作

Lienol源码
1. Travelmate不正常，已去除


最佳建议:

使用GL官方的固件，然后搭配这里的ipk插件包。
此编译的固件 OpenWrt_firmware_gl-mt1300_yyyymmddhhmm 中已经包含插件包 mt1300-酸酸乳片.tar.gz。
ssh上传mt1300-酸酸乳片.tar.gz到GL官方固件下，然后执行install-酸酸乳片.sh即可。

或者使用Lienol版本，WIFI设置建议2.4G和5G使用相同SSID，相同频道。

