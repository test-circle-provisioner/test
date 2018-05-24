FROM golang:alpine
ENV SRC github.com/segmentio/test
ARG VERSION
COPY . /go/src/${SRC}

RUN apk --update add git gcc \
  && go install \
  -ldflags="-X main.version=$VERSION" \
  ${SRC}/cmd/test \
  && apk del git gcc

ENTRYPOINT ["test"]
