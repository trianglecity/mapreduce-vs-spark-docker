##
## MapReduce vs Spark SQL Examples on Docker
##

Please refer to https://blog.cloudera.com/blog/2014/09/how-to-translate-from-mapreduce-to-apache-spark/


NOTICE1 : The NCDC MapReduce example is from https://github.com/tomwhite/hadoop-book/ (and Tim White's book)

NOTICE2 : NCDC data is obtained using (wget -r ftp://ftp.ncdc.noaa.gov:21/pub/data/noaa/1901/*)

NOTICE3 : The WordCount MapReduce example is from https://hadoop.apache.org/docs/stable/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html

NOTICE4 : The Google Books Ngram dataset is usef for the Spark example.

The instructions below are given to run the examples.

[1] git clone source-code-folder
 
[2] cd downloaded-source-code-folder

[3] sudo make BIND_DIR=.  shell

	wait ... wait ... wait ...


[4] root@1525a8a51474:/# cd /home/db

[5] root@1525a8a51474:/home/db# cd examples

[6 NCDC] root@1525a8a51474:/home/db/examples# cd ncdc

[7] root@6ff92bd20d8e:/home/db/examples/ncdc# hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar   -D mapred.reduce.tasks=0   -D mapred.map.tasks.speculative.execution=false   -D mapred.task.timeout=12000000   -input ncdc_files.txt   -inputformat org.apache.hadoop.mapred.lib.NLineInputFormat   -output output   -mapper load_ncdc_map.sh   -file load_ncdc_map.sh


	 WARN streaming.StreamJob: -file option is deprecated, please use generic option -files instead.
	packageJobJar: [load_ncdc_map.sh] [] /tmp/streamjob3141454243146732589.jar tmpDir=null
	 INFO Configuration.deprecation: session.id is deprecated. Instead, use dfs.metrics.session-id
	 INFO jvm.JvmMetrics: Initializing JVM Metrics with processName=JobTracker, sessionId=
	 INFO jvm.JvmMetrics: Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
	 INFO mapred.FileInputFormat: Total input paths to process : 1
	 INFO mapreduce.JobSubmitter: number of splits:2
	 INFO Configuration.deprecation: mapred.reduce.tasks is deprecated. Instead, use 	mapreduce.job.reduces
	 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
	 INFO Configuration.deprecation: mapred.task.timeout is deprecated. Instead, use mapreduce.task.timeout
	 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_local2041300855_0001
	 INFO mapred.LocalDistributedCacheManager: Localized file:/home/db/examples/mapreduce/load_ncdc_map.sh as file:/tmp/hadoop-root/mapred/local/1492748122379/load_ncdc_map.sh
	 INFO mapreduce.Job: The url to track the job: http://localhost:8080/
	 INFO mapred.LocalJobRunner: OutputCommitter set in config null
	 INFO mapred.LocalJobRunner: OutputCommitter is org.apache.hadoop.mapred.FileOutputCommitter
	 INFO mapreduce.Job: Running job: job_local2041300855_0001
	 INFO output.FileOutputCommitter: File Output Committer Algorithm version is 1
	 INFO mapred.LocalJobRunner: Waiting for map tasks
	 INFO mapred.LocalJobRunner: Starting task: attempt_local2041300855_0001_m_000000_0
	 INFO output.FileOutputCommitter: File Output Committer Algorithm version is 1
	 INFO mapred.Task:  Using ResourceCalculatorProcessTree : [ ]
	 INFO mapred.MapTask: Processing split: file:/home/db/examples/mapreduce/ncdc_files.txt:0+14
	 INFO mapred.MapTask: numReduceTasks: 0
	 INFO streaming.PipeMapRed: PipeMapRed exec [/home/db/examples/mapreduce/./load_ncdc_map.sh]
	 INFO Configuration.deprecation: mapred.work.output.dir is deprecated. Instead, use mapreduce.task.output.dir
	 INFO Configuration.deprecation: map.input.start is deprecated. Instead, use mapreduce.map.input.start
	 INFO Configuration.deprecation: mapred.task.is.map is deprecated. Instead, use mapreduce.task.ismap
	 INFO Configuration.deprecation: mapred.task.id is deprecated. Instead, use mapreduce.task.attempt.id
	 INFO Configuration.deprecation: mapred.tip.id is deprecated. Instead, use mapreduce.task.id
	 INFO Configuration.deprecation: mapred.local.dir is deprecated. Instead, use mapreduce.cluster.local.dir
	 INFO Configuration.deprecation: map.input.file is deprecated. Instead, use mapreduce.map.input.file
	 INFO Configuration.deprecation: mapred.skip.on is deprecated. Instead, use mapreduce.job.skiprecords
	 INFO Configuration.deprecation: map.input.length is deprecated. Instead, use mapreduce.map.input.length
	 INFO Configuration.deprecation: mapred.job.id is deprecated. Instead, use mapreduce.job.id
	 INFO Configuration.deprecation: user.name is deprecated. Instead, use mapreduce.job.user.name
	 INFO Configuration.deprecation: mapred.task.partition is deprecated. Instead, use mapreduce.task.partition
	 INFO streaming.PipeMapRed: R/W/S=1/0/0 in:NA [rec/s] out:NA [rec/s]
	 INFO mapreduce.Job: Job job_local2041300855_0001 running in uber mode : false
	 INFO mapreduce.Job:  map 0% reduce 0%
	get: `1901.tar.bz2': File exists
	 INFO mapred.LocalJobRunner: Gzipping 1901 and putting in HDFS > map
	  INFO streaming.PipeMapRed: MRErrorThread done
	 INFO streaming.PipeMapRed: mapRedFinished
	 INFO mapred.LocalJobRunner: Gzipping 1901 and putting in HDFS > map
	 INFO mapred.Task: Task:attempt_local2041300855_0001_m_000000_0 is done. And is in the process of committing
	 INFO mapred.LocalJobRunner: Gzipping 1901 and putting in HDFS > map
	INFO mapred.Task: Task attempt_local2041300855_0001_m_000000_0 is allowed to commit now
	INFO output.FileOutputCommitter: Saved output of task 'attempt_local2041300855_0001_m_000000_0' to file:/home/db/examples/mapreduce/output/_temporary/0/task_local2041300855_0001_m_000000
	 INFO mapred.LocalJobRunner: Gzipping 1901 and putting in HDFS
	 INFO mapred.Task: Task 'attempt_local2041300855_0001_m_000000_0' done.
	 INFO mapred.LocalJobRunner: Finishing task: attempt_local2041300855_0001_m_000000_0
	 INFO mapred.LocalJobRunner: Starting task: attempt_local2041300855_0001_m_000001_0
	 output.FileOutputCommitter: File Output Committer Algorithm version is 1
	 mapred.Task:  Using ResourceCalculatorProcessTree : [ ]
	 mapred.MapTask: Processing split: file:/home/db/examples/mapreduce/ncdc_files.txt:14+1
	 mapred.MapTask: numReduceTasks: 0
	 streaming.PipeMapRed: PipeMapRed exec [/home/db/examples/mapreduce/./load_ncdc_map.sh]
	 streaming.PipeMapRed: R/W/S=1/0/0 in:NA [rec/s] out:NA [rec/s]
	 mapreduce.Job:  map 100% reduce 0%
	get: `.' to `mapreduce': is a subdirectory of itself
	basename: missing operand
	Try 'basename --help' for more information.
	tar (child): -C: Cannot open: No such file or directory
	tar (child): Error is not recoverable: exiting now
	tar: Child returned status 2
	tar: Error is not recoverable: exiting now
	gzip: .tar.bz2/*.gz: No such file or directory
	 INFO streaming.PipeMapRed: MRErrorThread done
	 INFO streaming.PipeMapRed: mapRedFinished
	 INFO mapred.LocalJobRunner: 
	 INFO mapred.Task: Task:attempt_local2041300855_0001_m_000001_0 is done. And is in the process of committing
	 INFO mapred.LocalJobRunner: 
	 INFO mapred.Task: Task attempt_local2041300855_0001_m_000001_0 is allowed to commit now
	 INFO output.FileOutputCommitter: Saved output of task 'attempt_local2041300855_0001_m_000001_0' to file:/home/db/examples/mapreduce/output/_temporary/0/task_local2041300855_0001_m_000001
	 INFO mapred.LocalJobRunner: Gzipping .tar.bz2 and putting in HDFS
	 INFO mapred.Task: Task 'attempt_local2041300855_0001_m_000001_0' done.
	 INFO mapred.LocalJobRunner: Finishing task: attempt_local2041300855_0001_m_000001_0
	 INFO mapred.LocalJobRunner: map task executor complete.
	 INFO mapreduce.Job: Job job_local2041300855_0001 completed successfully
	 INFO mapreduce.Job: Counters: 15
	File System Counters
		FILE: Number of bytes read=3493
		FILE: Number of bytes written=576898
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
	Map-Reduce Framework
		Map input records=2
		Map output records=0
		Input split bytes=198
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=0
		Total committed heap usage (bytes)=503316480
	File Input Format Counters 
		Bytes Read=18
	File Output Format Counters 
		Bytes Written=16
	 INFO streaming.StreamJob: Output directory: output

[8] to re-run the example, delete "1901", "gz", "output" and "1901.all".

[9] root@6ff92bd20d8e:/home/db/examples/ncdc# cd ..

[10 wordcount] root@8050585a938b:/home/db/examples# cd wordcount

[11] root@8050585a938b:/home/db/examples/wordcount# hadoop com.sun.tools.javac.Main WordCount.java
	
	WordCount$IntSumReducer.class  WordCount$TokenizerMapper.class  WordCount.class

[12] root@8050585a938b:/home/db/examples/wordcount# jar cf wc.jar WordCount*.class

	wc.jar

[13] root@8050585a938b:/home/db/examples/wordcount# hadoop fs -ls ./input/ ./input/file01 ./input/file02

	
	Found 2 items
	-rw-rw-r--   1 1000 1000         22 2017-04-21 15:43 input/file01
	-rw-rw-r--   1 1000 1000         22 2017-04-21 15:43 input/file02
	-rw-rw-r--   1 1000 1000         22 2017-04-21 15:43 input/file01
	-rw-rw-r--   1 1000 1000         22 2017-04-21 15:43 input/file02

[14] root@8050585a938b:/home/db/examples/wordcount# hadoop fs -cat ./input/file01

	Hello World Bye World	

[15] root@8050585a938b:/home/db/examples/wordcount# hadoop fs -cat ./input/file02

	Hello World Bye World

[16] root@8050585a938b:/home/db/examples/wordcount# hadoop jar wc.jar WordCount ./input ./output

 	DEBUG util.NativeCodeLoader: Trying to load the custom-built native-hadoop library...
	DEBUG util.NativeCodeLoader: Loaded the native-hadoop library
 	INFO Configuration.deprecation: session.id is deprecated. Instead, use dfs.metrics.session-id
 	INFO jvm.JvmMetrics: Initializing JVM Metrics with processName=JobTracker, sessionId=
 	WARN mapreduce.JobResourceUploader: Hadoop command-line option parsing not performed. Implement the Tool interface and execute your application with ToolRunner to remedy this.
 	INFO input.FileInputFormat: Total input paths to process : 2
 	INFO mapreduce.JobSubmitter: number of splits:2
 	INFO mapreduce.JobSubmitter: Submitting tokens for job: job_local1523381591_0001
 	INFO mapreduce.Job: The url to track the job: http://localhost:8080/
 	INFO mapreduce.Job: Running job: job_local1523381591_0001
 	INFO mapred.LocalJobRunner: OutputCommitter set in config null
 	INFO output.FileOutputCommitter: File Output Committer Algorithm version is 1
 	INFO mapred.LocalJobRunner: OutputCommitter is org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter
 	INFO mapred.LocalJobRunner: Waiting for map tasks
 	INFO mapred.LocalJobRunner: Starting task: attempt_local1523381591_0001_m_000000_0
 	INFO output.FileOutputCommitter: File Output Committer Algorithm version is 1
 	INFO mapred.Task:  Using ResourceCalculatorProcessTree : [ ]
 	INFO mapred.MapTask: Processing split: file:/home/db/examples/wordcount/input/file01:0+22
 	INFO mapred.MapTask: (EQUATOR) 0 kvi 26214396(104857584)
 	INFO mapred.MapTask: mapreduce.task.io.sort.mb: 100
 	INFO mapred.MapTask: soft limit at 83886080
 	INFO mapred.MapTask: bufstart = 0; bufvoid = 104857600
 	INFO mapred.MapTask: kvstart = 26214396; length = 6553600
 	INFO mapred.MapTask: Map output collector class = org.apache.hadoop.mapred.MapTask$MapOutputBuffer
 	INFO mapred.LocalJobRunner: 
 	INFO mapred.MapTask: Starting flush of map output
 	INFO mapred.MapTask: Spilling map output
 	INFO mapred.MapTask: bufstart = 0; bufend = 38; bufvoid = 104857600
 	INFO mapred.MapTask: kvstart = 26214396(104857584); kvend = 26214384(104857536); length = 13/6553600
 	INFO mapred.MapTask: Finished spill 0
	INFO mapred.Task: Task:attempt_local1523381591_0001_m_000000_0 is done. And is in the process of committing
 	INFO mapred.LocalJobRunner: map
 	INFO mapred.Task: Task 'attempt_local1523381591_0001_m_000000_0' done.
 	INFO mapred.LocalJobRunner: Finishing task: attempt_local1523381591_0001_m_000000_0
	INFO mapred.LocalJobRunner: Starting task: attempt_local1523381591_0001_m_000001_0
 	INFO output.FileOutputCommitter: File Output Committer Algorithm version is 1
 	INFO mapred.Task:  Using ResourceCalculatorProcessTree : [ ]
 	INFO mapred.MapTask: Processing split: file:/home/db/examples/wordcount/input/file02:0+22
 	INFO mapred.MapTask: (EQUATOR) 0 kvi 26214396(104857584)
 	INFO mapred.MapTask: mapreduce.task.io.sort.mb: 100
 	INFO mapred.MapTask: soft limit at 83886080
 	INFO mapred.MapTask: bufstart = 0; bufvoid = 104857600
 	INFO mapred.MapTask: kvstart = 26214396; length = 6553600
 	INFO mapred.MapTask: Map output collector class = org.apache.hadoop.mapred.MapTask$MapOutputBuffer
 	INFO mapred.LocalJobRunner: 
 	INFO mapred.MapTask: Starting flush of map output
 	INFO mapred.MapTask: Spilling map output
 	INFO mapred.MapTask: bufstart = 0; bufend = 38; bufvoid = 104857600
 	INFO mapred.MapTask: kvstart = 26214396(104857584); kvend = 26214384(104857536); length = 13/6553600
 	INFO mapred.MapTask: Finished spill 0
 	INFO mapred.Task: Task:attempt_local1523381591_0001_m_000001_0 is done. And is in the process of committing
 	INFO mapred.LocalJobRunner: map
 	INFO mapred.Task: Task 'attempt_local1523381591_0001_m_000001_0' done.
 	INFO mapred.LocalJobRunner: Finishing task: attempt_local1523381591_0001_m_000001_0
 	INFO mapred.LocalJobRunner: map task executor complete.
 	INFO mapred.LocalJobRunner: Waiting for reduce tasks
	INFO mapred.LocalJobRunner: Starting task: attempt_local1523381591_0001_r_000000_0
 	INFO output.FileOutputCommitter: File Output Committer Algorithm version is 1
 	INFO mapred.Task:  Using ResourceCalculatorProcessTree : [ ]
 	INFO mapred.ReduceTask: Using ShuffleConsumerPlugin: org.apache.hadoop.mapreduce.task.reduce.Shuffle@5197be5b
 	INFO reduce.MergeManagerImpl: MergerManager: memoryLimit=334338464, maxSingleShuffleLimit=83584616, mergeThreshold=220663392, ioSortFactor=10, memToMemMergeOutputsThreshold=10
 	INFO reduce.EventFetcher: attempt_local1523381591_0001_r_000000_0 Thread started: EventFetcher for fetching Map Completion Events
 	INFO reduce.LocalFetcher: localfetcher#1 about to shuffle output of map attempt_local1523381591_0001_m_000000_0 decomp: 36 len: 40 to MEMORY
 	INFO reduce.InMemoryMapOutput: Read 36 bytes from map-output for attempt_local1523381591_0001_m_000000_0
 	INFO reduce.MergeManagerImpl: closeInMemoryFile -> map-output of size: 36, inMemoryMapOutputs.size() -> 1, commitMemory -> 0, usedMemory ->36
 	INFO reduce.LocalFetcher: localfetcher#1 about to shuffle output of map attempt_local1523381591_0001_m_000001_0 decomp: 36 len: 40 to MEMORY
 	INFO reduce.InMemoryMapOutput: Read 36 bytes from map-output for attempt_local1523381591_0001_m_000001_0
 	INFO reduce.MergeManagerImpl: closeInMemoryFile -> map-output of size: 36, inMemoryMapOutputs.size() -> 2, commitMemory -> 36, usedMemory ->72
 	INFO reduce.EventFetcher: EventFetcher is interrupted.. Returning
 	INFO mapred.LocalJobRunner: 2 / 2 copied.
 	INFO reduce.MergeManagerImpl: finalMerge called with 2 in-memory map-outputs and 0 on-disk map-outputs
 	INFO mapred.Merger: Merging 2 sorted segments
 	INFO mapred.Merger: Down to the last merge-pass, with 2 segments left of total size: 60 bytes
 	INFO reduce.MergeManagerImpl: Merged 2 segments, 72 bytes to disk to satisfy reduce memory limit
 	INFO reduce.MergeManagerImpl: Merging 1 files, 74 bytes from disk
 	INFO reduce.MergeManagerImpl: Merging 0 segments, 0 bytes from memory into reduce
 	INFO mapred.Merger: Merging 1 sorted segments
 	INFO mapred.Merger: Down to the last merge-pass, with 1 segments left of total size: 64 bytes
 	INFO mapred.LocalJobRunner: 2 / 2 copied.
 	INFO Configuration.deprecation: mapred.skip.on is deprecated. Instead, use mapreduce.job.skiprecords
 	INFO mapred.Task: Task:attempt_local1523381591_0001_r_000000_0 is done. And is in the process of committing
 	INFO mapred.LocalJobRunner: 2 / 2 copied.
 	INFO mapred.Task: Task attempt_local1523381591_0001_r_000000_0 is allowed to commit now
 	INFO output.FileOutputCommitter: Saved output of task 'attempt_local1523381591_0001_r_000000_0' to file:/home/db/examples/wordcount/output/_temporary/0/task_local1523381591_0001_r_000000
 	INFO mapred.LocalJobRunner: reduce > reduce
 	INFO mapred.Task: Task 'attempt_local1523381591_0001_r_000000_0' done.
 	INFO mapred.LocalJobRunner: Finishing task: attempt_local1523381591_0001_r_000000_0
 	INFO mapred.LocalJobRunner: reduce task executor complete.
 	INFO mapreduce.Job: Job job_local1523381591_0001 running in uber mode : false
 	INFO mapreduce.Job:  map 100% reduce 100%
 	INFO mapreduce.Job: Job job_local1523381591_0001 completed successfully
 	INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=11147
		FILE: Number of bytes written=852591
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
	Map-Reduce Framework
		Map input records=2
		Map output records=8
		Map output bytes=76
		Map output materialized bytes=80
		Input split bytes=220
		Combine input records=8
		Combine output records=6
		Reduce input groups=3
		Reduce shuffle bytes=80
		Reduce input records=6
		Reduce output records=3
		Spilled Records=12
		Shuffled Maps =2
		Failed Shuffles=0
		Merged Map outputs=2
		GC time elapsed (ms)=0
		Total committed heap usage (bytes)=965738496
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=44
	File Output Format Counters 
		Bytes Written=34

[17] to re-run, delelte ./output directory

[18] root@8050585a938b:/home/db/examples/wordcount# cd ..

[19 Spark] root@8050585a938b:/home/db/examples# cd spark_mapreduce

[20] root@cd6ffa4c23fa:/home/db/examples/spark_mapreduce# sbt sbt-version

[21] root@cd6ffa4c23fa:/home/db/examples/spark_mapreduce# sbt clean compile

[22] root@cd6ffa4c23fa:/home/db/examples/spark_mapreduce# /spark/bin/spark-submit --driver-memory 1g ./target/scala-2.11/spark_mapreduce_2.11-1.0.jar

	+-----------+-----+
	|       word|count|
	+-----------+-----+
	|M'Afee_NOUN|    3|
	|M'Afee_NOUN|    1|
	|M'Afee_NOUN|    8|
	|M'Afee_NOUN|    5|
	|M'Afee_NOUN|    2|
	+-----------+-----+

	+--------------+----------+
	|          word|sum(count)|
	+--------------+----------+
	|    M.DCCC.LVI|        77|
	|       M'Gavin|      2677|
	|M.DCC.XXV_NOUN|        60|
	|M'Connell_NOUN|      4721|
	|   M'Afee_NOUN|       206|
	|     M'Whorter|       297|
	|          M'em|       153|
	|         M.Art|        54|
	|   M'ords_NOUN|        86|
	|    M.DCC.XXXI|        50|
	|M.Boudart_NOUN|       123|
	|     M.IX_NOUN|       117|
	| M.G.W.J._NOUN|        86|
	|   M.Alexander|       380|
	|   M'Cola_NOUN|      3823|
	|  M.D.XLV_NOUN|        92|
	+--------------+----------+



