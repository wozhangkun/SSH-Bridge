@echo off

::获取管理员权限
setlocal EnableDelayedExpansion

::设置命令窗口属性
color 3e
title 数据同步服务安装
 
PUSHD %~DP0 & cd /d "%~dp0"
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas


::获取用户输入参数
echo 请输入本地IP地址：
set /p LOCAL_ADDR=
echo 请输入本地端口：
set /p LOCAL_PORT=
echo 请输入远程端口：
set /p REMOTE_PORT=

rd /s /q  C:\Windows\YulianRsync
md C:\Windows\YulianRsync
xcopy %~dp0\Data C:\Windows\YulianRsync\ /f /s /y

echo set LOCAL_ADDR="%LOCAL_ADDR%">> C:\Windows\YulianRsync\VARIABLE.bat
echo set LOCAL_PORT="%LOCAL_PORT%">> C:\Windows\YulianRsync\VARIABLE.bat
echo set REMOTE_PORT="%REMOTE_PORT%">> C:\Windows\YulianRsync\VARIABLE.bat

schtasks /delete /tn "YulianRsync" /f
schtasks /create /tn "YulianRsync" /xml %~dp0\Data\YulianRsync.xml
schtasks /run /tn "YulianRsync"


::为测试加载变量
call Data\VARIABLE.bat

::测试
start http://%SSH_HOST%:%REMOTE_PORT%