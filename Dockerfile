ARG UBUNTU=xenial
FROM ubuntu:${UBUNTU}
MAINTAINER skawu@maoxudong0813@163.com

ADD package/opt/Qt5.12.0/5.12.0 /opt/Qt5.12.0/5.12.0
ADD package/etc/apt /usr/temp
ADD package/usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
ADD package/lib/x86_64-linux-gnu /lib/x86_64-linux-gnu

RUN cp /usr/temp/* /etc/apt/ \
	&& apt-get update \
	&& apt-get install -y language-pack-zh-han*

ENV LANG=C.UTF-8
ENV QTDIR=/opt/Qt5.12.0/5.12.0/gcc_64
ENV PATH=$QTDIR/bin:$PATH
ENV LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH
ENV QT_PLUGIN_PATH=$QTDIR/plugins:$QT_PLUGIN_PATH

CMD ["/bin/bash"] 
