@echo off

:: �л�����Ŀ¼
cd /d %~dp0

:: ΪSSL����ȫ������ر���
call %~dp0VARIABLE.bat

:: ��ͨSSL����ȫ���
ssh.exe -p %SSH_PORT% %SSH_USER%@%SSH_HOST% -i %KEY_FILE% -f -C -N -R 0.0.0.0:%3:%1:%2 -o "PubkeyAuthentication=yes" -o "StrictHostKeyChecking=false" -o "PasswordAuthentication=no" -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3"

