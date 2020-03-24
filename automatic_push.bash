#!/bin/bash

# Author
# Purpose
# Date_creation
# Date_modification

cd /home/pi/corona-stat-lt/
data=$(date +"%m-%d-%Y %H:%M");
echo "started $data">> /home/pi/list_log.txt;
echo $(pwd) >>/home/pi/list_log.txt;

git pull;
Rscript -e "rmarkdown::render('index.Rmd')";
git add .;
git commit -m "automatic update $data";
git push origin master;

echo "finished $(date)">> /ome/pi/list_log.txt
