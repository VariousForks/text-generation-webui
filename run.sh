#!/bin/bash
set -x
docker build -t text-generation .
docker compose up -d
