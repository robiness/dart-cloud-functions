#!/bin/zsh
# Load env files temporarily for the scripts runtime
set -a
source ./deploy.env
set +a

DOCKER_IMAGE="gcr.io/${PROJECT_ID}/${CLOUD_FUNCTION_NAME}:latest"

echo "🔨 Building and pushing Docker image via Cloud Build..."
gcloud builds submit \
  --config cloudbuild.yaml \
  --substitutions=_DOCKER_IMAGE="$DOCKER_IMAGE" \
  --project="$PROJECT_ID" \
  --region="$REGION"

echo "🚀 Deploying to Cloud Run: $CLOUD_FUNCTION_NAME"
gcloud run deploy "$CLOUD_FUNCTION_NAME" \
  --image "$DOCKER_IMAGE" \
  --platform managed \
  --region "$REGION" \
  --allow-unauthenticated \
  --port "$PORT" \
  --project "$PROJECT_ID"
