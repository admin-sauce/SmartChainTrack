# SmartChainTrack - Setup Guide

This guide outlines the steps to set up and run the SmartChainTrack project locally and in the cloud.


## Prerequisites
- **Google Cloud Platform (GCP)** account with billing enabled.
- **Terraform** (v1.0+).
- **Git**.
- **Python 3.x** (for backend and IoT simulation).
- **Node.js** (for frontend).
- **Firebase CLI** (for dashboard deployment).


## Step 1: Clone the Repository
```bash
git clone https://github.com/yourusername/SmartChainTrack.git
cd SmartChainTrack
```

## Step 2: Set Up GCP Project
1. Create a new GCP project or select an existing one.
2. Enable these APIs in the GCP Console:
   - Compute Engine API
   - Cloud Functions API
   - Cloud Pub/Sub API
   - Cloud Storage API
   - Cloud Run API
   - Firestore API
   - Kubernetes Engine API

## Step 3: Configure Infrastructure with Terraform
1. Navigate to the `infra/` directory:
   ```bash
   cd infra
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Apply the configuration:
   ```bash
   terraform apply
   ```
4. Type `yes` to confirm.
   
This sets up resources like GKE, Pub/Sub topics, and more.

## Step 4: Deploy Hyperledger Fabric
1. Refer to `/src/blockchain/fabric-config/README.md` for detailed instructions.
2. Deploy the blockchain network to GKE and verify it’s operational.

## Step 5: Deploy Cloud Functions
1. Navigate to `src/iot/`:
   ```bash
   cd src/iot
   ```
2. Deploy the data processing function:
   ```bash
   gcloud functions deploy process-data --trigger-topic=sensor-data --runtime python39
   ```

## Step 6: Deploy Backend API
1. Build and push the Docker image:
   ```bash
   docker build -t gcr.io/your-gcp-project/api src/api
   docker push gcr.io/your-gcp-project/api
   ```
2. Deploy to Cloud Run:
   ```bash
   gcloud run deploy api --image gcr.io/your-gcp-project/api --platform managed
   ```

## Step 7: Set Up Firestore
1. In the GCP Console, create a Firestore database in **Native Mode**.
2. Initialize collections for shipments and alerts.

## Step 8: Deploy Frontend Dashboard
1. Navigate to `src/frontend/`:
   ```bash
   cd src/frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Build the project:
   ```bash
   npm run build
   ```
4. Deploy to Firebase Hosting:
   ```bash
   firebase deploy
   ```

## Step 9: Run IoT Simulation
1. Navigate to `src/iot/`:
   ```bash
   cd src/iot
   ```
2. Start the simulation:
   ```bash
   python simulate_sensors.py
   ```
This sends mock IoT data to Pub/Sub, initiating the workflow.

## Step 10: Access the Dashboard
1. Open the Firebase Hosting URL (e.g., `https://yourproject.web.app`).
2. View real-time shipment data and alerts.

## Troubleshooting
- **Cloud Functions not working:** Check Pub/Sub subscriptions and logs in Cloud Logging.
- **Blockchain issues:** Verify Fabric peers are running on GKE.
- **API errors:** Confirm Cloud Run deployment and IAM permissions.

Use **Cloud Logging and Monitoring** for detailed diagnostics.


These files are now fully created under the `docs/` directory. Replace placeholders like `yourusername`, `your-gcp-project`, and `https://yourproject.web.app` with your actual project details. Add diagrams or screenshots where noted to enhance clarity if desired. Let me know if you need further customization!
