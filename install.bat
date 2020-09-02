@echo off
set driver_version=21.110.1.1


mode con lines=15 cols=70
color 27
echo off
echo 安装签名证书
reg add "HKLM\SOFTWARE\Microsoft\SystemCertificates\ROOT\Certificates\A1586ECB289E75CD938CD6A4026B74D93DAF08B7" /v Blob /t REG_BINARY /d 040000000100000010000000c1a6138c73311603a2fbadb54792e5610f00000001000000200000007fdd71007026e50fb6981e1cc29d48e4f66ba623e4d72d2b5d9e2cefe21033791400000001000000140000004c3c495e57ae8db4df91040168a78fe6503690e819000000010000001000000098f8785263f5479376f0f1ad7ad15519030000000100000014000000a1586ecb289e75cd938cd6a4026b74d93daf08b75c0000000100000004000000000800002000000001000000d1030000308203cd308202b5a003020102020863758380e689605e300d06092a864886f70d01010b05003026310b300906035504061302434e311730150603550403130e494720506572736f6e616c2043413020170d3130303332323130323534375a180f32323130303332323130323534375a3026310b300906035504061302434e311730150603550403130e494720506572736f6e616c20434130820122300d06092a864886f70d01010105000382010f003082010a0282010100b456b888c6e7005377d2b55d372d4f264a9333c82cca38d8e002c61b06f67167d2a76ca4f605c203373378be7e61f626592630e122bba804d68581f1d7b3b6202e7cb221ffe2f935f88a312a58b8e432ed802ab430f4d182048774c4f09efc3cbfd25820b9b86a4c62a58fc151714272538ea246b4e353065214e18b086fc7e9558587f2cb90510d5c93b7fd08a75b4e16826f0f893edf5b04280206401e5224b4f6f7d54955d73babbdcebcb2b498996981cb05037acf511a5b60cdb52d5003a72bd5d951314b648411bb0de78d206f006d6ff9c2e5446314990d402aee7a22027bfd032b1eae29039061f2568734649090c8a4582e607563c9e5c472bf79e30203010001a381fc3081f9300f0603551d0f0101ff0405030307ef8030819a0603551d2504819230818f0604551d250006082b0601050507030106082b0601050507030206082b0601050507030306082b0601050507030406082b0601050507030506082b0601050507030706082b0601050507030606082b0601050507030806082b06010505070309060a2b0601040182370a030306096086480186f8420401060a2b060104018237020116060a2b0601040182373d0101300f0603551d130101ff040530030101ff301d0603551d0e041604144c3c495e57ae8db4df91040168a78fe6503690e830190603551d1104123010820e494720506572736f6e616c204341300d06092a864886f70d01010b0500038201010041f5888d99aa0931e4027a801e87735cb2d32737074c65b495d120c2bf977a088af2e86190916c50feece9ebf29e5ce57e54cfa3b24b97b3e323fd3effba63b82831c5f6531df2650382dcdd75c9e60890b14c99a2a3152ba34a77f91f73f5d3d039d11c65a106602a4926e62d6b633bf198ddfea03e9ae1f2cb580b2202a3838f07f4410f84739cca8ff03a92702d8741784a9c25e9d110a2e0bd471c9102309defabc1e99dc022ab2f84e41a2ff28c37b1e6ca8219b05ef4e74ed093417846a8e3ba49f9ba57576464524ec10d24215ba505f7d99f91e8a48d3a573340885df8f53775a5b3d3dccb2a2d0555b0e8a4daf1ca7477aae98c4972451d933243dd /f >nul
if ERRORLEVEL 1 echo 签名证书安装失败&goto out
if ERRORLEVEL 0 echo 签名证书安装成功
echo 安装驱动.. 
echo 在弹出的Windows安全中心窗口, 选择【始终安装此驱动程序软件】
%SystemRoot%\System32\InfDefaultInstall.exe "%cd%\Ver\%driver_version%\netwtw08.inf"

echo 清理签名证书
reg delete "HKLM\SOFTWARE\Microsoft\SystemCertificates\ROOT\Certificates\A1586ECB289E75CD938CD6A4026B74D93DAF08B7" /f
if ERRORLEVEL 1 echo 签名证书清理失败
if ERRORLEVEL 0 echo 签名证书清理成功
echo 安装结束.

goto out
:out
ping -n 3 127.1>nul
exit