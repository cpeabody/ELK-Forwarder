
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
ENV LF_PKG_NAME logstash-forwarder_linux_amd64

WORKDIR / 
RUN wget https://download.elastic.co/logstash-forwarder/binaries/$LF_PKG_NAME
RUN rpm -q $LF_PKG_NAME
RUN mv /$LF_PKG_NAME /logstash-forwarder
#ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml
#EXPOSE 5601
########## run Kibana
WORKDIR /                    
 
