echo Setting the bam environment

call bam_env.cmd

echo ** Export Data Objects **

call icommand -cmdfile export_all.xml

echo END 

