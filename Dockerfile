FROM centos:centos7


RUN yum install -y epel-release
RUN yum install -y  wget curl net-tools java-1.8.0-openjdk telnet bind-utils lsof jq

RUN yum install -y traceroute openssh-server openssh-clients

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
    ln -s /tmp/ocp4/oc /usr/local/bin/oc

RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key && \
	ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

RUN echo root:root | chpasswd && \
    mkdir /root/.ssh && \
	chmod 600 /root/.ssh

RUN mkdir /workspace

COPY index.html /workspace

EXPOSE 8000-9000

USER 0

# /usr/sbin/sshd -D
WORKDIR /workspace
CMD  python -m SimpleHTTPServer 8080

#FROM image-registry.openshift-image-registry.svc:5000/openshift/httpd:2.4

#USER 0

