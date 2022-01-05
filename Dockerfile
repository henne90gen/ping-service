FROM golang:1.17.5-alpine3.15 AS builder

COPY . /app
WORKDIR /app
RUN go get && go build

FROM alpine:3.15.0

RUN mkdir /app
WORKDIR /app

COPY --from=builder /app/ping-service /app/ping-service

ENTRYPOINT [ "./ping-service" ]
EXPOSE 3000
