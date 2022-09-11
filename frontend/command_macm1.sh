#!/bin/sh

gcloud config set project gcloud-project-358506

gcloud auth configure-docker

docker buildx build --platform linux/amd64 -t "gcr.io/gcloud-project-358506/zenn-preview" .

docker push "gcr.io/gcloud-project-358506/zenn-preview"

DATE=`date '+%Y%m%d'`

service_name=autumn-frontend-$DATE

gcloud run deploy "$service_name" \
  --image "gcr.io/gcloud-project-358506/zenn-preview" \
  --port 8000 \
  --platform managed \
  --allow-unauthenticated \
  --region asia-northeast1
