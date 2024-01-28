FROM ubuntu:22.04
RUN apt-get -y update
RUN apt-get -y install curl xz-utils file sed

# setup environment
ENV DATA_LOCATION=/gamedata
ENV SAVEGAME_NAME=savegame
ENV CONFIG_NAME=server-settings.json
ENV SERVER_DEF_NAME=MyServer
ENV SERVER_DEF_PASSWORD=MyPassword

EXPOSE 34197/udp

WORKDIR /app
COPY server-settings.example.json .
COPY startup.sh .
RUN chmod +x startup.sh
CMD /app/startup.sh

# download and install latest factorio
WORKDIR /opt
RUN curl -L "https://factorio.com/get-download/stable/headless/linux64" -o "factorio.tar.xz"
RUN tar -xJf factorio.tar.xz
RUN rm factorio.tar.xz

RUN useradd factoriouser
RUN chown -R factoriouser:factoriouser /opt/factorio
