FROM alpine

RUN apk update && apk add --no-cache xz tar bash

COPY backup.sh /
COPY restore.sh /

ENTRYPOINT [ "bash" ]