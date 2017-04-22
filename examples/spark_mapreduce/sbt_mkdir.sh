#!/bin/sh

mkdir -p src/main/java
mkdir -p src/main/resources
mkdir -p src/main/scala

mkdir -p src/test/java
mkdir -p src/test/resources
mkdir -p src/test/scala

mkdir lib project target

echo 'name := "spark_mapreduce"
version := "1.0"
scalaVersion := "2.11.8"

javacOptions ++= Seq("-source", "1.8", "-target", "1.8")

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core" % "2.1.2-SNAPSHOT",
  "org.apache.spark" %% "spark-sql" % "2.1.2-SNAPSHOT",
  "org.apache.spark" %% "spark-mllib" % "2.1.2-SNAPSHOT" ,
  "org.apache.spark" %% "spark-streaming" % "2.1.2-SNAPSHOT"
)' > build.sbt
