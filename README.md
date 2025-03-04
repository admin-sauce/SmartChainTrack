# SmartChainTrack

A decentralized supply chain tracking system using IoT and blockchain for real-time, secure, and automated logistics management.

![Architecture Diagram]()

## Key Features

- **Real-time Tracking**: Monitor shipment conditions (GPS, temperature, humidity) using IoT sensors.
- **Blockchain Security**: Ensure data integrity with an immutable ledger using Hyperledger Fabric.
- **Automated Alerts**: Receive notifications if shipment conditions exceed predefined thresholds.
- **Web Dashboard**: Visualize and manage shipments through a user-friendly interface.
- **DevOps Automation**: Streamline deployment and management with CI/CD pipelines and Infrastructure-as-Code.

## Technology Stack

- **Cloud Provider**: Google Cloud Platform (GCP)
- **Blockchain**: Hyperledger Fabric
- **Infrastructure**: Terraform
- **Services**: Cloud Functions, Pub/Sub, Cloud Storage, Cloud Run, Firestore, Firebase Hosting
- **Languages**: Python, JavaScript

## Setup Instructions

### Prerequisites

- Google Cloud Platform account
- Terraform installed
- Git installed
- Python 3.x

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/SmartChainTrack.git
   cd SmartChainTrack
   ```

2. **Configure GCP Project**:
   - Create a new GCP project or use an existing one.
   - Enable required APIs (Pub/Sub, Cloud Functions, etc.).

3. **Deploy Infrastructure**:
   - Initialize Terraform:
     ```bash
     terraform init
     ```
   - Apply the configuration:
     ```bash
     terraform apply
     ```

4. **Set up Hyperledger Fabric**:
   - Follow the instructions in `/fabric-setup/README.md` to deploy on GKE.

5. **Deploy Services**:
   - Deploy Cloud Functions:
     ```bash
     gcloud functions deploy process-data --trigger-topic=sensor-data
     ```
   - Deploy Cloud Run services:
     ```bash
     gcloud run deploy api --image gcr.io/yourproject/api
     ```

6. **Configure Dashboard**:
   - Set up Firestore collections.
   - Deploy the frontend to Firebase Hosting:
     ```bash
     firebase deploy
     ```

## Usage

1. **Run IoT Simulation**:
   - Execute the Python script to simulate sensor data:
     ```bash
     python iot_simulation.py
     ```

2. **Monitor Shipments**:
   - Access the dashboard at `https://yourproject.web.app`.
   - View real-time shipment data and statuses.

3. **Check Blockchain Transactions**:
   - Use Fabric CLI or a blockchain explorer to inspect the ledger.

4. **View Alerts and Logs**:
   - Check Cloud Logging for system logs and alert notifications.

## Demo

Check out our live demo or watch the walkthrough video to see SmartChainTrack in action.

## Contributing

Contributions are welcome! Please read our contributing guidelines for more details.

## Team

- Thomas Albert Iwin
- Jayanthi Claret

## License

This project is licensed under the MIT License - see the LICENSE file for details.
