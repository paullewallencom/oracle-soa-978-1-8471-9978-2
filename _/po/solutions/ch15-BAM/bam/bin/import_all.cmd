echo Setting the bam environment

call bam_env.cmd

echo ** Import Data Objects **

call icommand -cmd import -file ..\data_objects\exported_data_objects.xml 
call icommand -cmd import -file ..\reports\exported_reports.xml 

echo END 

