@echo off
mode con lines=15 cols=70
color 27
echo off

echo ���ǩ��֤��
reg delete "HKLM\SOFTWARE\Microsoft\SystemCertificates\ROOT\Certificates\A1586ECB289E75CD938CD6A4026B74D93DAF08B7" /f
if ERRORLEVEL 1 echo ǩ��֤������ʧ��
if ERRORLEVEL 0 echo ǩ��֤������ɹ�

ping -n 3 127.1>nul
exit