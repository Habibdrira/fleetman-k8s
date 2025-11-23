# Fleetman Kubernetes

Application de tracking de flotte de véhicules.

## Déploiement

minikube start --driver=docker --memory=2048 --cpus=2
kubectl apply -f storage/
kubectl apply -f database/
kubectl apply -f queue/
kubectl apply -f position-tracker/
kubectl apply -f position-simulator/
kubectl apply -f api-gateway/
kubectl apply -f webapp/

## Accès

minikube ip
# Ouvrir http://IP:30080
