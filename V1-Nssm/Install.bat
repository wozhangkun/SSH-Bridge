@ECHO OFF

::获取管理员权限
setlocal EnableDelayedExpansion

::设置命令窗口属性
color 3e
title 智能网桥安装
 
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

::为测试加载变量
call Data\VARIABLE.bat

::创建/启动服务
Data\nssm install YulianBridge %~dp0\Data\YLB.bat %LOCAL_ADDR% %LOCAL_PORT% %REMOTE_PORT%
Data\nssm set YulianBridge AppDirectory %~dp0\Data
Data\nssm set YulianBridge Description 驭联智能网桥
Data\nssm start YulianBridge

::测试
start http://%SSH_HOST%:%REMOTE_PORT%