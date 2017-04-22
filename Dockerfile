FROM ubuntu:17.04

RUN	apt-get update

RUN	apt-get install -y software-properties-common && \
	apt-get update && \
	apt-get install -y default-jdk 



RUN	apt-get install -y maven
	
RUN	apt-get install -y libssl-dev && \
	apt-get install -y libffi-dev && \
	apt-get install -y python3-dev && \
	apt-get install -y python3-venv 

RUN	apt-get install -y curl && \
	apt-get install -y git && \
	apt-get install -y iptables && \
	apt-get install -y less && \
	apt-get install -y vim && \
	apt-get install -y vim-common && \
	apt-get install -y tar && \
	apt-get install -y zip && \
	apt-get install -y unzip

RUN	apt-get install -y build-essential && \
 	apt-get install -y apt-utils && \
	apt-get install -y automake && \
	apt-get install -y cmake && \
	apt-get install -y gcc && \
	apt-get install -y gcc-4.9 && \
	apt-get install -y g++ && \
	apt-get install -y g++-4.9 && \
	apt-get install -y gcc-multilib && \
	apt-get install -y libgomp1 && \
	apt-get install -y pkg-config && \
	apt-get install -y sphinx-common && \
	apt-get install -y gfortran && \
	apt-get install -y maven && \
	apt-get install -y libtool 

RUN	apt-get install -y wget && \
	mkdir protobuf_source && \
	cd protobuf_source && \
	wget https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz && \
	tar -zxvf ./protobuf-2.5.0.tar.gz && \
	cd protobuf-2.5.0 && \
        ./autogen.sh && \
	./configure && \
	make && \
	make install && \
	ldconfig && \
	cd .. && \
	cd ..
	

RUN	mkdir scala-2.11.8 && \ 	
	wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz && \
	tar -zxvf ./scala-2.11.8.tgz && \
	mkdir /usr/lib/scala && \
	cp -rp ./scala-2.11.8 /usr/lib/scala/ && \
	ln -s /usr/lib/scala/scala-2.11.8/bin/scala /usr/bin/scala && \
	ln -s /usr/lib/scala/scala-2.11.8/bin/scalac /usr/bin/scalac && \
	scala -version && \
	cd ..

RUN	apt-get install -y openssl && \
	apt-get install -y zlib1g-dev && \
	apt-get install -y linux-headers-generic
	
ENV 	JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV 	PATH="/usr/lib/jvm/java-8-openjdk-amd64/bin:${PATH}"

RUN 	apt-get install -y apt-transport-https && \
	echo "deb https://dl.bintray.com/sbt/debian /" |  tee -a /etc/apt/sources.list.d/sbt.list && \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
	apt-get update && \
	apt-get install -y sbt

RUN 	apt-get install -y eclipse

ENV     eclipsePlugin.dir  /usr/share/eclipse/plugins/

RUN	mkdir findbugs_source && \
	cd findbugs_source && \
	wget https://sourceforge.net/projects/findbugs/files/findbugs/3.0.1/findbugs-3.0.1.tar.gz && \
	tar -zxvf findbugs-3.0.1.tar.gz && \
	cp -rp ./findbugs-3.0.1  /usr/share && \
	cd ..


USER root

RUN	apt-get install -y ssh && \
	apt-get install -y rsync

# passwordless ssh
RUN 	ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
#RUN 	ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN 	ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN 	cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys


RUN	git clone https://github.com/apache/hadoop.git --branch branch-2.7.3 && \
	cd hadoop && \
	mvn install package -Pdist -Pnative -Dtar -DskipTests=true -Dmaven.site.skip=true -Dmaven.javadoc.skip=true && \
	cd ..

RUN	apt-get install -y nmap && \
	apt-get install -y telnet 

ENV 	HADOOP_HOME	/hadoop/hadoop-dist/target/hadoop-2.7.3
ENV 	PATH="${HADOOP_HOME}/bin:${PATH}"


RUN	rm -rf /tmp
RUN	mkdir /user && \
	cd /usr && \
	mkdir hive && \
	cd ..

RUN	${HADOOP_HOME}/bin/hadoop fs -mkdir       /tmp
RUN  	${HADOOP_HOME}/bin/hadoop fs -chmod g+w   /tmp

ENV 	HADOOP_INSTALL	/hadoop/hadoop-dist/target/hadoop-2.7.3
ENV	HADOOP_CLASSPATH  ${JAVA_HOME}/lib/tools.jar
ENV	HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native" 

RUN 	echo "log4j.logger.org.apache.hadoop.util.NativeCodeLoader=DEBUG" >> ${HADOOP_HOME}/etc/hadoop/log4j.properties

RUN	git clone https://github.com/apache/spark.git --branch branch-2.1 && \
	cd spark && \
	sbt sbt-version && \
	./dev/change-scala-version.sh 2.11 && \
	sbt -Dscala-2.11 -Pyarn -Phadoop-2.7 -Dhadoop.version=2.7.3 -DskipTests clean package && \
	sbt -mem 4096  publish-local
	
	

