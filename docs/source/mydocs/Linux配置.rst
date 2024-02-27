Linux一般配置
==================

.. contents:: 

软件源配置
-------------

1. 阿里云软件源的配置方法

   将 `/etc/apt/sources.list` 中的相关url修改为阿里云的源：

   .. code:: python

    #deb https://mirrors.aliyun.com/kali kali-rolling main non-free contrib
    #deb-src https://mirrors.aliyun.com/kali kali-rolling main non-free contrib

浏览器配置
-----------

firefox登录帐号即可

输入法配置
---------------

ibus框架，安装 `ibus-rime` ，然后打开 `ibus-setting` 添加 rime到那个框架下。
然后复制rime的配置文件到 `.local/ibus/rime/` 文件下。

桌面配置
------------

1. 下载主题，放置到指定的文件夹，再通过Tweak程序启用
2. 扩展在浏览器插件中启用，也可以通过Extension程序快捷关闭

clash配置
-------------

1. clash为绿色软件
2. clash输入url开启订阅
3. 开机自启动clash: 通过配置systemd守护进程，进程名为clash.service。可以在kali的 `/etc/systemd/system/clash.service`查看，并通过 `systemctl enable clash.service` 允许其自动启用,但是运行的环境似乎与终端不同，难以配置，所以转而使用crontab命令解决。
4. 手动代理配置: HTTP 、HTTPS Proxy 和 Socks Host 地址都设置为 127.0.0.1 : 7890 。忽视 localhost, 127.0.0.0/8,::1
5. 设置开启代理快捷键脚本: 
   
   1. 在设置的键盘中自定义快捷键，将预定写好的脚本路径添加到目标即可。
   2. 脚本利用了 gsetting 命令


软件配置
------------

python和conda
*****************

vscode
**************



