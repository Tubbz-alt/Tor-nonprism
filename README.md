# Tor-nonprism
Tor hardened configurations (e.g. use chroot)

Please run it as root, and run under the package's directory.

这套加强的Tor 配置包括了让 Tor 以chroot形式运行。

请用 root运行此脚本，并在本包目录下运行。

（本脚本不自动安装 Tor本身，请先安装 Tor）

### Usage

启动：

`/opt/tor-hardened-scripts/tor-hardened.sh`


停止：

`killall -HUP tor-hardened.sh`


更新：

每次Tor升级后其会自动更新 `/opt/torchroot/` 下的 Tor执行文件（也可手动执行更新，见 `To-do-after-install-upgrade.install` 并引用其中的函数。） 


删除：

`rm -rf /opt/torchroot/ /opt/tor-hardened-scripts/`
