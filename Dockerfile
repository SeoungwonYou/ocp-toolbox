FROM centos:centos7

EXPOSE 8080

COPY index.html /var/run/web/index.html

RUN yum install -y epel-release
RUN yum install -y  wget curl net-tools java-1.8.0-openjdk telnet bind-utils lsof jq

# ADD files/3.11/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz /tmp
RUN mkdir /tmp/ocp3.11 && \
	cd /tmp/ocp3.11 && \
	wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz && \
	tar zxf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz

RUN mkdir /tmp/ocp4 && \
	cd /tmp/ocp4 && \
	wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.6.32/openshift-client-linux-4.6.32.tar.gz && \
	tar zxf openshift-client-linux-4.6.32.tar.gz

RUN echo "ln -s /tmp/ocp3.11/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/local/bin/oc" > /tmp/README.txt && \
	echo "ln -s /tmp/ocp4/oc /usr/local/bin/oc"  >> /tmp/README.txt && \
   ln -s /tmp/ocp3.11/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/local/bin/oc

USER 0

CMD cd /var/run/web && python -m SimpleHTTPServer 8080

#FROM image-registry.openshift-image-registry.svc:5000/openshift/httpd:2.4

#USER 0

