#!/bin/bash

docker login
docker build --tag rokiis1/transactions:v1.0.0 . -f Dockerfile
docker push rokiis1/transactions:v1.0.0
