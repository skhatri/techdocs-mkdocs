FROM node:19.2-alpine3.15
RUN apk add python3 py3-pip
RUN pip install mkdocs-techdocs-core mkdocs
RUN npm install -g npm@9.1.3 && npm install -g @techdocs/cli 
CMD ["sleep", "1d"]


