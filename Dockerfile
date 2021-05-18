FROM ubuntu:latest
MAINTAINER Rudolph Coetzee <support@contact.co.za>

RUN apt-get update \
 && apt-get install -y --no-install-recommends vlc \
 && rm -rf /var/lib/apt/lists/*

RUN useradd -G video -m -s /bin/bash vlc

EXPOSE 8089/tcp

ENTRYPOINT cvlc -v rtsp://admin:Chern0byl@172.16.25.22:554/live.sdp \
--sout '#transcode{vcodec=theo,vb=800,scale=Auto,acodec=none,$=none,scodec=none}:http{mux=ogg,dst=:8089/}'
