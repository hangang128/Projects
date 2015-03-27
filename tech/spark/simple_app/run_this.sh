sbt package
~/lib/spark-1.2.0-bin-hadoop2.3//bin/spark-submit   --class "SimpleApp"   --master local[4]   target/scala-2.10/simple-project_2.10-1.0.jar
# run example

# For Scala and Java, use run-example:
#./bin/run-example SparkPi

# For Python examples, use spark-submit directly:
cala and Java, use run-example:
./bin/run-example SparkPi

# For Python examples, use spark-submit directly:
./bin/spark-submit examples/src/main/python/pi.py
