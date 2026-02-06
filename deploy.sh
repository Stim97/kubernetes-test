set -e

NAME="kubernetes-api"
USERNAME="timur97"
IMAGE="$USERNAME/$NAME:latest"

echo="Building docker image..."
docker build -t $IMAGE .

echo="Pushing image to Docker Hub..."
docker push $IMAGE

echo="Applying Kubernetes manifests..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo="Getting pods..."
kubectl get pods

echo="Getting services..."
kubectl get services

echo="Fetching the main services"
kubectl get services $NAME-service