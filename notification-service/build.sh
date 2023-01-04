#!/bin/bash

docker login
docker build --tag rokiis1/notification:v1.0.0 . -f Dockerfile
docker push rokiis1/notification:v1.0.0
