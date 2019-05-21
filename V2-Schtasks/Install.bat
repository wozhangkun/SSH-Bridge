@echo off

::»ñÈ¡¹ÜÀíÔ±È¨ÏÞ
setlocal EnableDelayedExpansion

::ÉèÖÃÃüÁî´°¿ÚÊôÐÔ
color 3e
title 智能网桥安装
 
PUSHD %~DP0 & cd /d "%~dp0"
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas


::»ñÈ¡ÓÃ»§ÊäÈë²ÎÊý
echo ÇëÊäÈë±¾µØIPµØÖ·£º
set /p LOCAL_ADDR=
echo ÇëÊäÈë±¾µØ¶Ë¿Ú£º
set /p LOCAL_PORT=
echo ÇëÊäÈëÔ¶³Ì¶Ë¿Ú£º
set /p REMOTE_PORT=

rd /s /q  C:\Windows\YulianBridge
md C:\Windows\YulianBridge
xcopy %~dp0\Data C:\Windows\YulianBridge\ /f /s /y

echo set LOCAL_ADDR="%LOCAL_ADDR%">> C:\Windows\YulianBridge\VARIABLE.bat
echo set LOCAL_PORT="%LOCAL_PORT%">> C:\Windows\YulianBridge\VARIABLE.bat
echo set REMOTE_PORT="%REMOTE_PORT%">> C:\Windows\YulianBridge\VARIABLE.bat

schtasks /delete /tn "YulianBridge" /f
schtasks /create /tn "YulianBridge" /tr "C:\Windows\YulianBridge\YLB.bat" /sc onstart /ru "NT AUTHORITY\SYSTEM" /V1
schtasks /run /tn "YulianBridge"


::Îª²âÊÔ¼ÓÔØ±äÁ¿
call Data\VARIABLE.bat

::²âÊÔ
start http://%SSH_HOST%:%REMOTE_PORT%