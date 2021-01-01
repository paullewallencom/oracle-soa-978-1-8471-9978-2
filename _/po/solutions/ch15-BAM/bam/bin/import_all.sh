#!/bin/bash

source demo_env.sh

echo "Importing all data objects"

icommand -cmd import -file ../data_objects/exported_data_objects.xml

echo "Importing Enterprise Message Sources"

icommand -cmd import -file ../data/exported_ems.xml 

echo "Importing reports"

icommand -cmd import -file ../reports/exported_reports.xml

echo "Finished Importing All Objects."
