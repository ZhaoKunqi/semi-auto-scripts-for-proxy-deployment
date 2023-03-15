# 用来半自动部署各种类型Proxy服务器的Shell脚本，有许多选项，自动化了复杂的设置过程。

## 请使用 xray-deploy-english.sh

简单使用例：

```
wget https://github.com/ZhaoKunqi/semi-auto-scripts-for-proxy-deployment/raw/main/xray-deploy-english.sh
chmod +x xray-deploy-english.sh
sh xray-deploy-english.sh
```
#### 修改日志:

2023-03-09 已经修复：安装时版本错误和更新时版本错误的问题

#### 功能说明:

用来部署xray服务端, 可以自动化设置SSL/WebSocket的功能.

和原版最大的差别就是更改了一些需要原作者网站API的地方, 转用Shell方式或者公用API来解决.

原版脚本里加了很多自己私有API, 有潜在的安全风险, 而且原版脚本中使用的大部分私有API都失效了，原版脚本也失效无法使用,所以才有了这个修改版.

#### 推荐使用的服务器操作系统:

1. CentOS 7 / CentOS Stream 8 / CentOS Stream 9(推荐)
 
2. Alma Linux 8 / Alma Linux 9(推荐)

3. Rocky Linux 8 / Rocky Linux 9(推荐)

##### 原版脚本支援Debian系服务器操作系统，但是由于本人不会使用这个发行版分支，所以也没有在Debian系操作系统下做测试
