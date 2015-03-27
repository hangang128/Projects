# current path
#exit
pwd
. ~/.bash_profile
rsync --itemize-changes --checksum --delete -r /Users/paul.han/github/Projects/tech/oozie/HelloOozie/src/main/dr_coord_simple aws-nn1:oozie_files
echo 'workflow deployment completed successfully!'
# deploy
# hdfs dfs -copyFromLocal -f ../dr_coord_simple/ .
# run
# oozie job -run -config ./coord.properties
 