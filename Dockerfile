FROM centos:centos7

EXPOSE 8080

COPY index.html /var/run/web/index.html

RUN yum install -y wget curl net-tools java-1.8.0-openjdk telnet bind-utils lsof

USER 0

CMD cd /var/run/web && python -m SimpleHTTPServer 8080

#FROM image-registry.openshift-image-registry.svc:5000/openshift/httpd:2.4

#USER 0

