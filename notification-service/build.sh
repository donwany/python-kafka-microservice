#!/bin/bash

docker login
docker build --tag worldbosskafka/notification:v1.0.0 . -f Dockerfile
docker push worldbosskafka/notification:v1.0.0