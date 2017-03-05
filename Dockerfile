FROM node
MAINTAINER Robert Hawksley <robert.s.hawksley@team.telstra.com>
RUN adduser --disabled-password --gecos "" sinopia
RUN adduser sinopia sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir -p /opt/sinopia/storage
WORKDIR /opt/sinopia
RUN npm install js-yaml sinopia
RUN chown -R sinopia:sinopia /opt/sinopia
USER sinopia
ADD /config.yaml /tmp/config.yaml
ADD /start /tmp/start
RUN cp /tmp/start /opt/sinopia/start.sh
CMD ["/opt/sinopia/start.sh"]
EXPOSE 4873
VOLUME /opt/sinopia
