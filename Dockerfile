ARG UBUNTU=xenial
FROM ubuntu:${UBUNTU}
MAINTAINER skawu@maoxudong0813@163.com

ADD package/opt/Qt5.12.0/5.12.0 /opt/Qt5.12.0/5.12.0
ADD package/etc/apt /usr/temp
ADD package/usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
ADD package/lib/x86_64-linux-gnu /lib/x86_64-linux-gnu

RUN apt-get update \
	&& cp /usr/temp/* /etc/apt/

ENV QTDIR=/opt/Qt5.12.0/5.12.0/gcc_64
ENV PATH=$QTDIR/bin:$PATH
ENV LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH

CMD ["/bin/bash"] 
