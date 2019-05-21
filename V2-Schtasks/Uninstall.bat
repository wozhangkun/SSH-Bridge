@echo off

::获取管理员权限
setlocal EnableDelayedExpansion

::设置命令窗口属性
color 3e
title 智能网桥卸载
 
PUSHD %~DP0 & cd /d "%~dp0"
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas


schtasks /end /tn "YulianBridge"
schtasks /delete /tn "YulianBridge" /f
rd /s /q  C:\Windows\YulianBridge