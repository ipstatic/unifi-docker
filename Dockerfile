FROM alpine:3.4
MAINTAINER Jarod Watkins <jwatkins@jarodw.com>

RUN apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add openjdk7-jre mongodb curl unzip

RUN mkdir /opt \
  && curl http://dl.ubnt.com/unifi/5.0.7/UniFi.unix.zip --output /opt/unifi.zip \
  && cd /opt \
  && unzip unifi.zip \
  && mv UniFi unifi

WORKDIR /opt/unifi
VOLUME /opt/unifi/data

EXPOSE 8080 8443 8880 8843
ENTRYPOINT ["/usr/bin/java", "-Xmx1024M", "-jar", "/opt/unifi/lib/ace.jar"]
CMD ["start"]
