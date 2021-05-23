此项目专门为 GL-iNet MT1300 打造，感谢P3TERX的GitHub Actions项目。

感谢Lienol和Lean两位大神所提供的插件。

默认设置：

主机名：MT1300

IP 地址：192.168.8.1 或 192.168.1.1

WIFI SSID：MT1300

WIFI 密码：password


使用 GL-iNet 官方19.07.7源码，添加了Lienol和Lean两位大神的部分插件。
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
1. 有两路WIFI，但是需要两路相同频段和频道，否则不工作


最佳建议:

使用Lienol版本，建议将wlan-0禁用，只使用wlan-1。如果需要设置两路WIFI，建议设置相同频道。
通过一段时间使用，目前比较稳定，建议使用OpenClash。

或:

使用GL-iNet官方MT1300固件，然后使用这里基于GL官方源码编译的固件内部的酸酸乳插件。之前汇报的插件安装问题已于2021-05-05修复。


