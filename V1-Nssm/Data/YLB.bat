@echo off

:: 切换工作目录
cd /d %~dp0

:: 为SSL反向安全隧道加载变量
call %~dp0VARIABLE.bat

:: 开通SSL反向安全隧道
ssh.exe -p %SSH_PORT% %SSH_USER%@%SSH_HOST% -i %KEY_FILE% -f -C -N -R 0.0.0.0:%3:%1:%2 -o "PubkeyAuthentication=yes" -o "StrictHostKeyChecking=false" -o "PasswordAuthentication=no" -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3"

