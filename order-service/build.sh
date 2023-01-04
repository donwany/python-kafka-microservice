#!/bin/bash

docker login
docker build --tag rokiis1/orders:v1.0.0 . -f Dockerfile
docker push rokiis1/orders:v1.0.0
