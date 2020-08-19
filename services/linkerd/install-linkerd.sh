#!/bin/bash

# Quick a dirty script to install linkerd.
cat <<EOT >> /tmp/grafana-values.yaml
grafana:
  enabled: false
EOT

linkerd install --addon-config /tmp/grafana-values.yaml | kubectl apply -f -

rm -rf /tmp/grafana-values.yaml
