FROM jjeffcaii/java:8u102

MAINTAINER jjeffcaii@outlook.com

ENV \
MESOS_PACKAGE_VERSION="0.28.1-2.0.20.debian81" \
MESOS_NATIVE_LIBRARY="/usr/lib/libmesos.so" \
MESOS_NATIVE_JAVA_LIBRARY="/usr/lib/libmesos.so"

RUN \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF && \
echo "deb http://repos.mesosphere.com/debian jessie main" | tee /etc/apt/sources.list.d/mesosphere.list && \
apt-get update && \
apt-get install --no-install-recommends -y --force-yes mesos=${MESOS_PACKAGE_VERSION} && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
ln -snf /opt/jdk/bin/java /etc/alternatives/java

CMD [ "bash" ]
