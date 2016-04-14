FROM debian:8
MAINTAINER QAware OSS <qaware-oss@qaware.de>

ENV JAVA_VERSION 8u77
ENV BUILD_VERSION b03

WORKDIR /tmp

RUN apt-get update; apt-get install -y wget; wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/server-jre-$JAVA_VERSION-linux-x64.tar.gz" -O server-jre-8-linux-x64.tar.gz
RUN tar xzf server-jre-8-linux-x64.tar.gz; mkdir -p /usr/java; mv jdk1.8.0_77 /usr/java; ln -s /usr/java/jdk1.8.0_77 /usr/java/latest; ln -s /usr/java/latest /usr/java/default

#ENV JAVA_HOME /usr/java/latest
#ENV PATH $PATH:$JAVA_HOME/bin

RUN rm -f server-jre-8-linux-x64.tar.gz; apt-get remove -y wget alien; apt-get autoremove -y; apt-get clean -y; apt-get autoclean -y
WORKDIR /
