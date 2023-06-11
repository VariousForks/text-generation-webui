#!/bin/bash
set -x
./download-example-models.sh
docker build -t text-generation .
#docker compose up -d #daemon mode
docker compose up #interactive mode to see output in terminal

