FROM alpine:edge
MAINTAINER Jarod Watkins <jwatkins@jarodw.com>

#RUN apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community add openjdk8-jre mongodb curl unzip libressl-dev
RUN apk --no-cache add openjdk8-jre mongodb curl unzip

RUN mkdir /opt \
  && curl http://dl.ubnt.com/unifi/5.4.15/UniFi.unix.zip --output /opt/unifi.zip \
  && cd /opt \
  && unzip unifi.zip \
  && mv UniFi unifi \
  && rm /opt/unifi/lib/native/Linux/amd64/libubnt_webrtc_jni.so

WORKDIR /opt/unifi
VOLUME ["/opt/unifi/data", "/opt/unifi/logs"]

EXPOSE 8080 8443 8880 8843
ENTRYPOINT ["/usr/bin/java", "-Xmx1024M", "-jar", "/opt/unifi/lib/ace.jar"]
CMD ["start"]
