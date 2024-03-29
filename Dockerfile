#Pull the base image
FROM amd64/alpine:latest

MAINTAINER <Benny.Flash>
#Image Info
LABEL Platform="DSM" \
      Name="Aria2" \
      Ver="1.37.0" \
      WebUI="Aria NG" \
      WebUIVer="1.3.7"

WORKDIR /

RUN apk add --no-cache aria2 darkhttpd wget unzip && \
    mkdir /conf /download /AriaNG && \
    wget -c https://github.com/mayswind/AriaNg/releases/download/1.3.7/AriaNg-1.3.7.zip -O ariaNG.zip && \
    unzip -o -d /AriaNG ariaNG.zip && \
    apk del wget unzip && \
    rm -rf ariaNG.zip

COPY aria2.conf /conf/aria2.conf
COPY aria2ui.sh /conf/aria2ui.sh

RUN chmod +x /conf/aria2ui.sh

VOLUME ["/conf", "/download", "/AriaNG"]

EXPOSE 6800 18800 6901

CMD ["/conf/aria2ui.sh"]
