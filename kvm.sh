#!/bin/bash
#
# 安装脚本
#
# Copyright (c) 2020.

echo "开始安装CPU限制程序"
yum install epel-release cpulimit
echo "开始下载CPU限制脚本"
wget https://raw.githubusercontent.com/54665/cpulimit-vm/master/cpulimit.sh
chmod +x /root/cpulimit.sh
echo "写入自启"
chmod +x /etc/rc.d/rc.local
echo "/root/cpulimit-vm.sh >/root/cpulimit-vm.sh/cpulimit.sh.log 2>&1" >> /etc/rc.d/rc.local
echo "后台运行中"
nohup /root/cpulimit.sh >> /dev/null 2>&1 &
echo "脚本执行完毕，默认基准20%，突发值40%后开始限制"