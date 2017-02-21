FROM node:4.3.2

RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json $HOME/tech/
RUN chown -R app:app $HOME/*

USER root

WORKDIR $HOME/tech

RUN npm install


CMD ["node", "index.js"]
