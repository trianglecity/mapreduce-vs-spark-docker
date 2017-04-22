
import org.apache.spark
import org.apache.spark._
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._

import org.apache.spark.sql.SQLContext
import org.apache.spark.sql.SparkSession

import org.apache.spark.sql.functions.{lit, col, coalesce}
import org.apache.spark.sql.Column 

object spark_mapreduce {


	def main(args: Array[String]):Unit = {
		
		println("... Spark MapReduce...")
		
		//val spark = SparkSession
      		//	.builder
      		//	.appName(s"${this.getClass.getSimpleName}").master("local")
      		//	.getOrCreate()

		// Loads data.
		val conf = new SparkConf(true)
		val sc = new SparkContext("local","test", conf)

		val sqlContext = new org.apache.spark.sql.SQLContext(sc)
		import sqlContext.implicits._
    		val refRDD = sc.textFile("src/main/resources/google_ngram_sample.txt")
      			.map(_.split("\t+"))
			.map(refRDD => References(refRDD(0),  refRDD(2).trim.toInt))
      			.toDF()

		refRDD.registerTempTable("GoogleNgram")
		val df = sqlContext.sql("SELECT * FROM GoogleNgram")
		df.show(5)

		val groupeddf = df.groupBy($"word").sum("count")
		groupeddf.show()

		println("... task is done ...")

		//spark.stop()
	}
	case class References(word: String, count: Int)
}
