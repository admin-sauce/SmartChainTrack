# Architecture Overview

SmartChainTrack is a decentralized, secure, and real-time supply chain tracking system leveraging IoT and blockchain technology. The architecture is designed for scalability, reliability, and automation, utilizing cloud services and DevOps practices.

## High-Level Architecture

The system comprises four core components:
1. **IoT Data Collection**: Captures or simulates real-time shipment data (e.g., GPS coordinates, temperature).
2. **Blockchain Ledger**: Secures and validates shipment data using Hyperledger Fabric.
3. **Backend API**: Exposes shipment data and blockchain records to external applications.
4. **Frontend Dashboard**: Visualizes real-time shipment details and alerts for users.

These components communicate via cloud-based services such as message queues, serverless functions, and managed databases.

## Component Breakdown

### 1. IoT Data Collection
- **Purpose**: Collect or simulate real-time shipment conditions.
- **Technology**: Python scripts simulate IoT sensors, publishing data to Google Cloud Pub/Sub.
- **Flow**:
  - Sensors (real or simulated) send data to a Pub/Sub topic.
  - Cloud Functions process this data and detect condition breaches (e.g., temperature exceeding thresholds).

### 2. Blockchain Ledger
- **Purpose**: Ensure data integrity and transparency for all shipment records.
- **Technology**: Hyperledger Fabric hosted on Google Kubernetes Engine (GKE).
- **Flow**:
  - Processed IoT data is submitted to the blockchain through smart contracts.
  - Smart contracts validate conditions and log transactions in an immutable ledger.

### 3. Backend API
- **Purpose**: Provide programmatic access to shipment and blockchain data.
- **Technology**: Flask (Python) deployed on Cloud Run.
- **Flow**:
  - APIs retrieve real-time data from Firestore and blockchain queries.
  - Key endpoints include `/shipments` (list all shipments) and `/status` (specific shipment details).

### 4. Frontend Dashboard
- **Purpose**: Offer an intuitive interface for monitoring shipments.
- **Technology**: React hosted on Firebase Hosting.
- **Flow**:
  - The dashboard fetches data from the backend API.
  - Displays shipment locations, conditions, and alerts in real time.

## Cloud Services Used
- **Google Cloud Pub/Sub**: Handles messaging for IoT data.
- **Cloud Functions**: Processes IoT data and triggers alerts serverlessly.
- **Cloud Storage**: Archives logs and historical data.
- **Google Kubernetes Engine (GKE)**: Runs the Hyperledger Fabric network.
- **Firestore**: Stores real-time data for the dashboard.
- **Cloud Run**: Hosts the backend API.
- **Firebase Hosting**: Serves the frontend dashboard.

## Architecture Diagram
YET TO BE ADDED

## Design Choices
- **Decentralization**: Blockchain ensures trust and auditability.
- **Scalability**: Cloud Run and GKE scale automatically with demand.
- **Automation**: Terraform and CI/CD pipelines simplify infrastructure management.
- **Security**: IAM roles and Secret Manager safeguard access and credentials.

This architecture strikes a balance between complexity and functionality, making it suitable for both prototyping and real-world use cases.
