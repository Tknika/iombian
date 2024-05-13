#!/bin/bash -e

echo '{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}' >> /etc/docker/daemon.json