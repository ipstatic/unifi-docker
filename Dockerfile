FROM alpine:3.4
MAINTAINER Jarod Watkins <jwatkins@jarodw.com>

RUN apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add openjdk7-jre mongodb

COPY unifi /opt/unifi
WORKDIR /opt/unifi
VOLUME /opt/unifi/data

EXPOSE 8080 8443 8880 8843
ENTRYPOINT ["/usr/bin/java", "-Xmx1024M", "-jar", "/opt/unifi/lib/ace.jar"]
CMD ["start"]
