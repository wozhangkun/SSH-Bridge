@echo off

::��ȡ����ԱȨ��
setlocal EnableDelayedExpansion

::�������������
color 3e
title ��������ж��
 
PUSHD %~DP0 & cd /d "%~dp0"
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas


schtasks /end /tn "YulianBridge"
schtasks /delete /tn "YulianBridge" /f
rd /s /q  C:\Windows\YulianBridge