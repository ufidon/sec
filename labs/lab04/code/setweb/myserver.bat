@echo off
cd C:\WebServer\nginx


IF "%1" == "stop" (
	GOTO STOPSERVER
)else IF "%1" == "start" (
	GOTO STARTSERVER
)else (
	echo Use these commands:
	echo.
	echo myserver start
	echo myserver stop
)
GOTO END

:STARTSERVER
QPROCESS * | find /I /N "mysqld.exe">NUL
IF "%ERRORLEVEL%"=="0" (
	echo MYSQLD is already running.
)else (
	RunHiddenConsole.exe mysqld --console
	echo MYSQLD is now running.
)

QPROCESS * | find /I /N "nginx.exe">NUL
IF "%ERRORLEVEL%"=="0" (
	echo NGINX is already running.
)else (
	RunHiddenConsole.exe nginx
	echo NGINX is now running.
)

QPROCESS * | find /I /N "php-cgi.exe">NUL
IF "%ERRORLEVEL%"=="0" (
	echo PHP-CGI is already running.
)else (
	RunHiddenConsole.exe php-cgi -b 127.0.0.1:9000
	echo PHP-CGI is now running.
)

echo.
echo To stop, type "myserver stop"

GOTO END

:STOPSERVER

QPROCESS * | find /I /N "mysqld.exe">NUL
IF "%ERRORLEVEL%"=="0" (
	taskkill /F /IM mysqld.exe>NUL
	echo MYSQLD ended successfully.
)else (
	echo MYSQLD is not running
)

QPROCESS * | find /I /N "nginx.exe">NUL
IF "%ERRORLEVEL%"=="0" (
	::nginx -s stop
	taskkill /F /IM nginx.exe>NUL
	echo NGINX ended successfully.
)else (
	echo NGINX is not running
)

QPROCESS * | find /I /N "php-cgi.exe">NUL
IF "%ERRORLEVEL%"=="0" (
	taskkill /F /IM php-cgi.exe>NUL
	echo PHP-CGI ended successfully.
)else (
	echo PHP-CGI is not running
)

:END