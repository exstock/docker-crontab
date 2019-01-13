FROM centos:latest

MAINTAINER exstock <ab19890824@126.com>

USER root

WORKDIR /root

ADD crontab/crontabfile /etc/cron.d/hello

RUN yum -y update && \
    yum -y install rsyslog && \
    yum install -y crontabs && \
    chmod 0644 /etc/cron.d/hello && \
    touch /var/log/cron.log && \
    crontab /etc/cron.d/hello && \
    yum clean all

CMD ["sh","-c","systemctl restart rsyslog ;systemctl enable rsyslog ;systemctl restart crond ;systemctl enable crond"]
