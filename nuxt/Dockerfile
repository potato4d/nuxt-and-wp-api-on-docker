FROM node:9.4.0-alpine
WORKDIR /myapp
COPY . /myapp

RUN [ -s 'node_modules' ] || npm install

CMD ["npm", "run", "dev"]
