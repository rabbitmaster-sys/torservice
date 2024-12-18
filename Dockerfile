FROM alpine:latest

RUN apk update && \
    apk add --no-cache nodejs npm tor bash
WORKDIR /service
COPY . /service
RUN if [ -f "./package.json" ]; then npm install; fi
RUN mkdir ./tor 2>/dev/null && chmod +x domain.sh
EXPOSE 80
CMD tor -f ./.torrc & ./domain.sh & npm start 
