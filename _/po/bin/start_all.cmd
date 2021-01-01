echo off
REM startup with number of seconds you want to wait between admin and managed servers
REM Usage: start_all seconds

IF [%1] EQU [] GOTO USAGE

set MW_HOME=C:\Oracle\Middleware\home_11gR1
set JDEV_HOME=C:\Oracle\Middleware\jdev_11gR1
set JAVA_HOME=%MW_HOME%\jdk160_11
set DOMAIN_HOME=%MW_HOME%\user_projects\domains\domain1

pushd %DOMAIN_HOME%

echo Starting admin server....
start startWebLogic.cmd

echo ...waiting %1 seconds before starting managed server
ping -n %1 127.0.0.1 > NUL 2>&1

echo Starting managed server....
start bin\startManagedWebLogic.cmd soa_server1 

REM echo ....waiting %1 seconds before starting JDeveloper
REM ping -n %1 127.0.0.1 > NUL 2>&1

REM echo Starting JDeveloper 
REM start %JDEV_HOME%\jdeveloper\jdev\bin\jdev.exe

popd
GOTO EOF

:USAGE
echo Usage: start_all seconds
echo seconds: seconds to wait between admin and managed servers startup
GOTO EOF

:EOF