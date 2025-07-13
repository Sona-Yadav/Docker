# FROM ubuntu:latest
# WORKDIR /app
# COPY . /app
# RUN apt-get update && apt-get install -y python3 python3-pip
# ENV NAME World
# CMD ["python3", "app.py"]

###########################################
# BASE IMAGE
###########################################

FROM ubuntu AS build

RUN apt-get update && apt-get install -y golang-go

ENV GO111MODULE=off

COPY . .

RUN CGO_ENABLED=0 go build -o /app .

ENTRYPOINT ["/app"]
