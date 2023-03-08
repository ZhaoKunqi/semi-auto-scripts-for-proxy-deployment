# A collection of scripts used for proxy deployment, working in progress !

## 请使用 xray-deploy-english.sh

```
wget https://github.com/ZhaoKunqi/semi-auto-scripts-for-proxy-deployment/raw/main/xray-deploy-english.sh 
sh xray-deploy-english.sh
```

2023-03-09 已经修复：安装时版本错误和更新时版本错误的问题

#### 功能说明:

用来部署xray服务端, 可以自动处理一些SSL/WebSocket的花活, 目前只提供简体中文版.

和原版最大的差别就是更改了一些需要原作者网站API的地方, 转用Shell方式或者公用API来解决.

说实话我不太懂为啥原作者要在脚本里加那么多自己网站的API, 对脚本使用者带来了潜在的安全隐患, 而且自己网站关了以后脚本直接失效, 不是很懂.

#### Tested and Supported Linux distributions

1. CentOS 7/8，CentOS Stream 8/9
  
2. Rocky Linux and Alma Linux 8/9
  

this works, but only simplified chinese version currently available, translation still work in progress(very slowly)
