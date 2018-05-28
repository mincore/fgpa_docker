FROM centos
MAINTAINER mincore mincore@163.com
USER root 

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum makecache
RUN yum update -y
RUN yum -y install epel-release
RUN yum install -y --setopt=tsflags=nodocs \
                            which\
                            net-tools\
                            tigervnc-server \
                            openbox \
                            xterm\
                            gtk2\
                            lapack

RUN yum clean all && rm -rf /var/cache/yum

ADD files.txz /
ADD Qt5.10.0_lib.tar.bz2 /

RUN mkdir -p /workspace
WORKDIR /workspace

CMD ["/usr/local/bin/startup.sh"]
