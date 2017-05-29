name := "ngram"
version := "1.0"
scalaVersion := "2.11.8"
javacOptions ++= Seq("-source", "1.8", "-target", "1.8")
libraryDependencies ++= Seq(
		"junit" % "junit" % "3.8.1",
		"org.apache.hadoop" % "hadoop-common" % "2.7.3",
  		"org.apache.hadoop" % "hadoop-client" % "2.7.3",
  		"com.google.guava" % "guava" % "19.0" ,
  		"org.apache.crunch" % "crunch-core" % "0.14.0" 
		)
resolvers += "Local Maven Repository" at "file:///root/.m2/repository"

autoScalaLibrary := false
