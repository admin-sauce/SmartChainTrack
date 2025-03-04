#!/bin/bash

# deploy.sh - Automates deployment of SmartChainTrack components

# Exit on error
set -e

# Variables (customize these as needed)
PROJECT_ID="your-gcp-project-id"  # Replace with your GCP project ID
GCP_REGION="us-central1"          # Replace with your preferred region
TERRAFORM_DIR="../infra"          # Path to Terraform files
FUNCTION_NAME="process-data"      # Cloud Function name
SOURCE_DIR="../src"               # Source code directory

# Ensure gcloud and terraform are installed
command -v gcloud >/dev/null 2>&1 || { echo "gcloud is required but not installed. Aborting."; exit 1; }
command -v terraform >/dev/null 2>&1 || { echo "terraform is required but not installed. Aborting."; exit 1; }

echo "Starting deployment process..."

# Set GCP project
gcloud config set project "$PROJECT_ID"

# Deploy infrastructure with Terraform
echo "Deploying infrastructure with Terraform..."
cd "$TERRAFORM_DIR"
terraform init
terraform apply -auto-approve

# Deploy Cloud Function (example)
echo "Deploying Cloud Function: $FUNCTION_NAME..."
gcloud functions deploy "$FUNCTION_NAME" \
  --region "$GCP_REGION" \
  --source "$SOURCE_DIR/iot" \
  --trigger-topic "sensor-data" \
  --runtime python39

echo "Deployment completed successfully!"
