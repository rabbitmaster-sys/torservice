FROM alpine:latest

RUN apk update && \
    apk add --no-cache nodejs tor

WORKDIR /service
COPY . /service
EXPOSE 80

CMD ./main.sh
