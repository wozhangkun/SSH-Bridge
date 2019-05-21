::获取管理员权限
@ECHO OFF
setlocal EnableDelayedExpansion
color 3e
title 智能网桥卸载
 
PUSHD %~DP0 & cd /d "%~dp0"
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas
 
::下面写执行的命令
Data\nssm stop YulianBridge
Data\nssm remove YulianBridge confirm