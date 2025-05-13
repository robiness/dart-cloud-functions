#!/bin/zsh
# Read the variables from the deploy.env file
set -a
source ./deploy.env
set +a

gcloud builds submit --config cloudbuild.yaml \
  --region=$REGION \
  --project=$PROJECT_ID \
  --substitutions=_PROJECT_ID=$PROJECT_ID,_CLOUD_FUNCTION_NAME=$CLOUD_FUNCTION_NAME,_REGION=$REGION,_PORT=$PORT
