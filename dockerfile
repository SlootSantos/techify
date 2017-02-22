FROM node:boron

RUN apt-get update

USER root
RUN groupadd -r nodeuser -g 433 && \
useradd -u 431 -r -g nodeuser -d $HOME -s /sbin/nologin -c "Docker image user" nodeuser && \
chown -R nodeuser:nodeuser $HOME


USER nodeuser

ENV HOME /home/nodeuser

COPY package.json npm-shrinkwrap.json $HOME/tech/

WORKDIR $HOME/tech



USER root
RUN npm install


USER nodeuser

CMD ["node", "index.js"]

MAINTAINER 'sloot@slootdev.com'
