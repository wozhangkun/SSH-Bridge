@echo off

::��ȡ����ԱȨ��
setlocal EnableDelayedExpansion

::�������������
color 3e
title ����ͬ������ж��
 
PUSHD %~DP0 & cd /d "%~dp0"
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas


schtasks /end /tn "YulianRsync"
schtasks /delete /tn "YulianRsync" /f
taskkill /F /IM ssh.exe
rd /s /q  C:\Windows\YulianRsync