#!/bin/bash

docker login
docker build --tag worldbosskafka/orders:v1.0.0 . -f Dockerfile
docker push worldbosskafka/orders:v1.0.0