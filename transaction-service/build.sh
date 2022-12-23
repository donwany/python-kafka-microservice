#!/bin/bash

docker login
docker build --tag worldbosskafka/transactions:v1.0.0 . -f Dockerfile
docker push worldbosskafka/transactions:v1.0.0