
FROM ubuntu:22.04

RUN apt update && apt upgrade -y && \
	DEBIAN_FORNTEND=noninteractive TZ=Europe/Berlin apt install -y wget curl tzdata

RUN wget https://github.com/ankitrohatgi/WebPlotDigitizer/archive/refs/tags/v4.6.tar.gz && \
    tar -zxvf v4.6.tar.gz && \
    rm -rf v4.6.tar.gz

RUN	apt install -y \
	python3-jinja2 \
	python3-babel \
	python3-distutils \
	wine-stable \
	npm \
	golang

WORKDIR /WebPlotDigitizer-4.6/

RUN cd electron && npm install

RUN cd app && npm install && npm run build 

RUN cd webserver && \
    cp settings.json.example settings.json && \
    go build

CMD cd webserver && ./webserver
