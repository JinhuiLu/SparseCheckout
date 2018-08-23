# SparseCheckout
下载指定git文件到指定路径

使用说明：

isUpdate：true 或者 false \n
localPath: 要下载到的路径
remotePath: 远程地址，可以是http,可以是git等
master/branch: 主线或者分支
checkout-List: 要checkout的路径列表，可以传多个，支持通配符 "*"

$ sh SparseCheckout.sh isUpdate localPath remotePath master/branch checkout-List

例子:
```
$ sh SparseCheckout.sh true /User/lujh/MobProducts/SMSSDK https://github.com/MobClub/SMSSDK-for-iOS.git master SDK/SMSSDK/SMS_SDK.framework SDK/Required/*
```
