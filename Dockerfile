ARG IMAGE=store/intersystems/iris-community:2020.1.0.204.0
ARG IMAGE=intersystemsdc/iris-community:2020.1.0.209.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.2.0.204.0-zpm
ARG IMAGE=intersystemsdc/irishealth-community:2020.3.0.200.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.3.0.200.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.3.0.221.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.4.0.521.0-zpm
ARG IMAGE=intersystemsdc/iris-community:latest
FROM $IMAGE

USER root   
        
WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
USER ${ISC_PACKAGE_MGRUSER}

COPY  Installer.cls .
COPY  src src

COPY iris.script /tmp/iris.script

RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly


USER root   

# Install Java 8 using apt-get from ubuntu repository
RUN apt-get update && \
	apt-get install -y openjdk-8-jdk && \
	apt-get install -y ant && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;
	
# Fix certificate issues, found as of 
# https://bugs.launchpad.net/ubuntu/+source/ca-certificates-java/+bug/983302
RUN apt-get install -y ca-certificates-java && \
	apt-get clean && \
	update-ca-certificates -f && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;

# Setup JAVA_HOME, to enable apps to know 
# where the Java was installed
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
ENV JRE_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JRE_HOME

# Setup classpath, to enable apps to know 
# where java classes and java jar libraries was installed
ENV classpath .:/usr/irissys/dev/java/lib/JDK18/*:/opt/irisapp/*:/usr/irissys/dev/java/lib/gson/*:/usr/irissys/dev/java/lib/jackson/*:/jgw/*
RUN export classpath
ENV CLASSPATH .:/usr/irissys/dev/java/lib/JDK18/*:/opt/irisapp/*:/usr/irissys/dev/java/lib/gson/*:/usr/irissys/dev/java/lib/jackson/*:/jgw/*
RUN export CLASSPATH

USER root

ARG APP_HOME=/tmp/app

COPY src $APP_HOME/src

# Crawler4J and another java libraries used, 
# are into jgw folder and jgw folder is in the classpath
COPY jgw /jgw

# Copy our Java Crawler to WebAnalyzer program, packaged into a jar, to the jgw
COPY target/website-analyzer-1.0.0.jar /jgw/website-analyzer-1.0.0.jar  

COPY jgw/* /usr/irissys/dev/java/lib/JDK18/

RUN mkdir -p /var/crawler/

RUN mkdir -p /var/crawler/nlp

RUN mkdir -p /var/crawler/storage

RUN chmod -R 777 /var/crawler/
