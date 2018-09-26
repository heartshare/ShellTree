#!/bin/bash
export JAVA_HOME=/usr/local/JDK8
export JRE_HOME=$JRE_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin

JAR_APP='bonaparte.jar'
JAR_PID=`ps -ef | grep "\b${JAR_APP}\b" | grep -v "\bgrep\b" | awk '{print $2}'`
[ ${JAR_PID}] && kill -9 ${JAR_PID}
cd `dirname $0`
nohup java -jar -Dfile.encoding=utf-8 ${JAR_APP}
echo OK