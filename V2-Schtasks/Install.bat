@echo off

::��ȡ����ԱȨ��
setlocal EnableDelayedExpansion

::�������������
color 3e
title ����ͬ������װ
 
PUSHD %~DP0 & cd /d "%~dp0"
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas


::��ȡ�û��������
echo �����뱾��IP��ַ��
set /p LOCAL_ADDR=
echo �����뱾�ض˿ڣ�
set /p LOCAL_PORT=
echo ������Զ�̶˿ڣ�
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


::Ϊ���Լ��ر���
call Data\VARIABLE.bat

::����
start http://%SSH_HOST%:%REMOTE_PORT%