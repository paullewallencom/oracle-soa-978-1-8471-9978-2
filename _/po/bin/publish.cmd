@ECHO ON

REM Change the following according to you installation setup
REM ========================================================
set DB_USER=sh_soainfra
set DB_PASSWD=welcome1
set DB_CONN=localhost:1521:XE
REM ========================================================


IF "%ORACLE_HOME%"== "" GOTO NO_OH
IF %1x==x GOTO USAGE
SET EVENTFILE=%1
IF NOT EXIST %EVENTFILE% GOTO FILE_ERROR
SET CLASSPATH=%ORACLE_HOME%\soa\modules\user-patch.jar;%ORACLE_HOME%\soa\modules\soa-startup.jar;%ORACLE_HOME%\..\patch_wls1031\profiles\default\sys_manifest_classpath\weblogic_patch.jar;%ORACLE_HOME%\..\patch_jdev1111\profiles\default\sys_manifest_classpath\weblogic_patch.jar;%ORACLE_HOME%\..\patch_cie680\profiles\default\sys_manifest_classpath\weblogic_patch.jar;\usr\lib64\jvm\java-1.6.0-sun-1.6.0.u11\lib\tools.jar;%ORACLE_HOME%\..\utils\config\10.3.1.0\config-launch.jar;%ORACLE_HOME%\..\wlserver_10.3\server\lib\weblogic_sp.jar;%ORACLE_HOME%\..\wlserver_10.3\server\lib\weblogic.jar;%ORACLE_HOME%\..\modules\features\weblogic.server.modules_10.3.1.0.jar;%ORACLE_HOME%\..\wlserver_10.3\server\lib\webservices.jar;%ORACLE_HOME%\..\modules\org.apache.ant_1.7.0\lib\ant-all.jar;%ORACLE_HOME%\..\modules\net.sf.antcontrib_1.0.0.0_1-0b2\lib\ant-contrib.jar;%ORACLE_HOME%\modules\oracle.jrf_11.1.1\jrf.jar;%ORACLE_HOME%\..\modules\features\weblogic.server.modules.xquery_10.3.1.0.jar;%ORACLE_HOME%\soa\modules\commons-cli-1.1.jar;%ORACLE_HOME%\soa\modules\oracle.soa.mgmt_11.1.1\soa-infra-mgmt.jar;%ORACLE_HOME%\soa\modules\oracle.soa.thirdparty.jar;%ORACLE_HOME%\soa\modules\oracle.soa.fabric_11.1.1\oracle.soa.fabric.jar;%ORACLE_HOME%\soa\modules\oracle.soa.adapter_11.1.1\oracle.soa.adapter.jar;%ORACLE_HOME%\soa\thirdparty\edifecs\XEngine\bin\xengine.jar;%ORACLE_HOME%\soa\thirdparty\edifecs\XEngine\bin\xe_extensions.jar;%ORACLE_HOME%\soa\modules\oracle.soa.b2b_11.1.1\oracle.soa.b2b.jar;%ORACLE_HOME%\uddi\lib\oracle.soa.uddi.jar;%ORACLE_HOME%\..\modules\junit_1.0.0.0_3-8-1\junit.jar;;%ORACLE_HOME%\..\wlserver_10.3\common\eval\pointbase\lib\pbclient57.jar;%ORACLE_HOME%\..\wlserver_10.3\server\lib\xqrl.jar;;%ORACLE_HOME%\modules\oracle.http_client_11.1.1.jar;%ORACLE_HOME%\soa\modules\oracle.soa.mgmt_11.1.1\soa-infra-mgmt.jar;%ORACLE_HOME%\..\modules\javax.xml.bind_2.1.1.jar;%ORACLE_HOME%\..\modules\javax.activation_1.1.jar;%ORACLE_HOME%\..\modules\javax.xml.stream_1.1.1.0.jar;%ORACLE_HOME%\soa\modules\commons-cli-1.1.jar;%ORACLE_HOME%\modules\oracle.xdk_11.1.1\xmlparserv2.jar;%ORACLE_HOME%\modules\org.apache.commons.digester_1.7.jar;%ORACLE_HOME%\modules\oracle.fabriccommon_11.1.1\fabric-common.jar;%ORACLE_HOME%\modules\oracle.webservices_11.1.1\orawsdl.jar;%ORACLE_HOME%\soa\modules\oracle.soa.fabric_11.1.1\fabric-runtime.jar;%ORACLE_HOME%\soa\modules\oracle.soa.fabric_11.1.1\soa-infra-tools.jar;%ORACLE_HOME%\soa\modules\oracle.soa.workflow_11.1.1\bpm-services.jar

:RUN_JAVA
java oracle.integration.platform.blocks.event.SendEvent -dbconn %DB_CONN% -dbuser %DB_USER% -dbpass %DB_PASSWD% -event %EVENTFILE%
GOTO THE_END

:NO_OH
ECHO Please set ORACLE_HOME environment variable and try again
GOTO THE_END

:USAGE
ECHO USAGE: publish event-file-name
GOTO THE_END

:FILE_ERROR
ECHO %EVENTFILE%: No such file
GOTO THE_END

:THE_END

