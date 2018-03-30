#Pull the base image
FROM amd64/alpine:latest

MAINTAINER <Benny.Flash>
#Image Info
LABEL Platform = "DSM" \
      Name = "Aria2" \
      Ver = "1.33.1-r0" \
      WebUI = "Aria NG" \
      WebUIVer = "0.4.0"

WORKDIR /

RUN apk add --no-cache aria2 darkhttpd wget unzip && \
    mkdir  /conf /download /AriaNG && \ 
    wget -c https://github.com/mayswind/AriaNg/releases/download/0.4.0/aria-ng-0.4.0.zip -O ariaNG.zip && \
    unzip ariaNG.zip /AriaNG && \
    apk del wget unzip && \
    rm -rf ariaNG.zip 

COPY init/ /conf

VOLUME /conf/ /download/

EXPOSE 6800
EXPOSE 18800

CMD ["/conf/aria2ui.sh"]
