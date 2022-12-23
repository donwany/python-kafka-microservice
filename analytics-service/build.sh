#!/bin/bash

docker login
docker build --tag worldbosskafka/analytics:v1.0.0 . -f Dockerfile
docker push worldbosskafka/analytics:v1.0.0