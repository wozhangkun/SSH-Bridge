@ECHO OFF

::��ȡ����ԱȨ��
setlocal EnableDelayedExpansion

::�������������
color 3e
title �������Ű�װ
 
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

::Ϊ���Լ��ر���
call Data\VARIABLE.bat

::����/��������
Data\nssm install YulianBridge %~dp0\Data\YLB.bat %LOCAL_ADDR% %LOCAL_PORT% %REMOTE_PORT%
Data\nssm set YulianBridge AppDirectory %~dp0\Data
Data\nssm set YulianBridge Description Ԧ����������
Data\nssm start YulianBridge

::����
start http://%SSH_HOST%:%REMOTE_PORT%