FROM linuxserver/qbittorrent

# environment variables
ARG FILEBOT_VERSION="4.7.9"
ARG FILEBOT_PACKAGE="filebot_${FILEBOT_VERSION}_amd64.deb"

# copy sources
#COPY sources.list /etc/apt/

RUN \
 apt-get update && \
 apt-get -y install --no-install-recommends mediainfo libchromaprint-tools inotify-tools openjdk-8-jre-headless && \
 curl -L -O https://downloads.sourceforge.net/project/filebot/filebot/FileBot_${FILEBOT_VERSION}/${FILEBOT_PACKAGE} && \
 dpkg -i ${FILEBOT_PACKAGE} && \
 rm ${FILEBOT_PACKAGE} && \
 apt-get clean && \
 rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# init
ENTRYPOINT ["/init"]
