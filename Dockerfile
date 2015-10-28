
# This Dockerfile builds Centos6.6 with Elasticsearch/Kibanae
FROM eXploit-Jenkins:5000/exploit:latest

# Install JRE 1.7
RUN yum -y install java-1.7.0-openjdk.x86_64

ENV JAVA_HOME /usr/

# Install wget and tar
RUN yum -y install wget \
                   tar
WORKDIR /
 
###### install LogstashForwarder #######################################################
ENV LF_PKG_NAME logstash-forwarder-0.4.0-1.x86_64.rpm

WORKDIR / 
RUN rpm -i https://download.elastic.co/logstash-forwarder/binaries/$LF_PKG_NAME
ADD config/logstash-forwarder.conf  /opt/logstash-forwarder/bin/logstash-forwarder.conf
EXPOSE 6782
#ADD start_forwarder.sh /usr/local/bin/start_forwarder.sh
#RUN chmod 755 /usr/local/bin/start_forwarder.sh

RUN /opt/logstash-forwarder/bin/logstash-forwarder -config /bin/logstash-forwarder.conf


 
