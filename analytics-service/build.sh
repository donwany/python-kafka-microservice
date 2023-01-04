#!/bin/bash

docker login
docker build --tag rokiis1/analytics:v1.0.0 . -f Dockerfile
docker push rokiis1/analytics:v1.0.0
