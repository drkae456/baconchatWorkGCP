#!/bin/bash

# Exit on any error
set -e

# Build the Docker image
docker compose build

# Configure docker to use gcloud as a credential helper
gcloud auth configure-docker gcr.io

# Push the image to Google Container Registry
docker push gcr.io/baconchat-work-portfolio1996/baconchatportfolio:latest

# Apply Kubernetes configurations
kubectl apply -f k8s/ 