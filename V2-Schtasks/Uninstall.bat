@echo off

::获取管理员权限
setlocal EnableDelayedExpansion

::设置命令窗口属性
color 3e
title 数据同步服务卸载
 
PUSHD %~DP0 & cd /d "%~dp0"
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas


schtasks /end /tn "YulianRsync"
schtasks /delete /tn "YulianRsync" /f
taskkill /F /IM ssh.exe
rd /s /q  C:\Windows\YulianRsync