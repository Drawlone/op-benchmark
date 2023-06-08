# op-benchmark
## 简介
利用miracl测试密码学中基本运算单元的运行时间，无需编译miracl库，一键编译运行，支持win、linux和arm平台。  
项目包含`op-ecc`，`op-pairing`，前者用于测试无Pairing的运行时间，后者测试有Pairing的运行时间。  
## 安装依赖
1. Xmake
## Linux
安装gcc等编译程序所需要的环境
1. 复制程序使用的椭圆曲线参数，这里选取NIST中的P-192，即`param/common.ecs`，pairng参数情况参考该[paper](https://ieeexplore.ieee.org/abstract/document/10121784)。
```bash
cp param/common.ecs .
```
2. 执行`xmake`，编译
3. 运行
```bash
xmake run -w .  op-ecc common.ecs
```
## Win平台
在Win下编译运行
1. 安装xmake
2. 安装Mingw
```bash
xmake clean
xmake f --mingw="D:\MinGW\mingw64" -p windows -a x86_64
xmake run -w . op-ecc common.ecs
```
## Arm
Linux平台交叉编译  
安装arm工具链，这里以`arm-none-linux-gnueabihf`
```bash
xmake clean
xmake f --toolchain=arm_toolchain -p cross -a arm-none-linux-gnueabihf
```
此时，编译好的文件在`build/cross/arm-none-linux-gnueabihf/release/`，移植即可。
