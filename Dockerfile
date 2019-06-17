#Pull the base image
FROM amd64/alpine:latest

MAINTAINER <Benny.Flash>
#Image Info
LABEL Platform="DSM" \
      Name="Aria2" \
      Ver="1.34.0" \
      WebUI="Aria NG" \
      WebUIVer="1.1.1"

WORKDIR /

RUN apk add --no-cache aria2 darkhttpd wget unzip && \
    mkdir /conf /download /AriaNG && \ 
    wget -c https://github.com/mayswind/AriaNg/releases/download/1.1.1/AriaNg-1.1.1.zip -O ariaNG.zip && \
    unzip -o -d /AriaNG ariaNG.zip && \
    apk del wget unzip && \
    rm -rf ariaNG.zip

COPY aria2* /conf/

RUN chmod +x /conf/aria2ui.sh

VOLUME ["/conf", "/download","/AriaNG"]

EXPOSE 6800 18800

CMD ["/conf/aria2ui.sh"]
