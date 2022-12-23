### Install kafka
```shell
helm repo add bitnami https://charts.bitnami.com/bitnami

helm install kafka-local bitnami/kafka \
--set persistence.enabled=false,zookeeper.persistence.enabled=false

kubectl run kafka-local-client \
    --restart='Never' \
    --image docker.io/bitnami/kafka:3.3.1-debian-11-r19 \
    --namespace orders-microservice \
    --command \
    -- sleep infinity

kubectl exec --tty -i kafka-local-client --namespace orders-microservice -- bash
```
### Commands
```shell
# order service
kubectl run order-svc --rm --tty -i \
    --image worldbosskafka/orders:v1.0.0 \
    --restart Never \
    --namespace orders-microservice \
    --command \
    -- python3 -u ./order_svc.py
    
# transaction service
kubectl run transaction-svc --rm --tty -i \
    --image worldbosskafka/transactions:v1.0.0 \
    --restart Never \
    --namespace orders-microservice \
    --command \
    -- python3 -u ./transaction.py
    
# notification service
kubectl run notification-svc --rm --tty -i \
    --image worldbosskafka/notification:v1.0.0 \
    --restart Never \
    --namespace orders-microservice \
    --command \
    -- python3 -u ./notification.py
    
# analytics service
kubectl run analytics-svc --rm --tty -i \
    --image worldbosskafka/analytics:v1.0.0 \
    --restart Never \
    --namespace orders-microservice \
    --command \
    -- python3 -u ./analytics.py
```
### Kafka UI
```shell
helm repo add kafka-ui https://provectus.github.io/kafka-ui
helm install kafka-ui kafka-ui/kafka-ui \
--set envs.config.KAFKA_CLUSTERS_0_NAME=kafka-local \
--set envs.config.KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS=kafka-local.orders-microservice.svc.cluster.local:9092

kubectl port-forward svc/kafka-ui 8080:8080
```