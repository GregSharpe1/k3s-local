#!/bin/bash

# Quick and dirty flux installation.

# Make sure your kubernetes config is set to the desired cluster.

# https://docs.fluxcd.io/en/1.17.1/tutorials/get-started-helm.html

kubectl create namespace flux

helm repo add fluxcd https://charts.fluxcd.io
helm upgrade -i flux \
--set git.url=git@github.com:GregSharpe1/k3s-local \
--set syncGarbageCollection.enabled=true \
--set registry.excludeImage=quay.io \
--namespace flux \
fluxcd/flux

helm upgrade -i helm-operator fluxcd/helm-operator \
    --namespace flux \
    --set helm.versions=v3
