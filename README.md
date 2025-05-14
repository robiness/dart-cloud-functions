# Dart Cloud Functions

Easily deploy Dart functions as Cloud Run services on Google Cloud Platform.

## Prerequisites

- [gcloud CLI](https://cloud.google.com/sdk/docs/install) installed and configured
- Access to a Google Cloud project with billing enabled (billing must be enabled for deployment)

## Quick Start

1. Clone the repository:
   ```sh
   git clone https://github.com/robiness/dart-cloud-functions.git
   cd dart-cloud-functions
   ```
2. Authenticate and set your Google Cloud project if not already done:
   ```sh
   gcloud auth login
   ```
3. Copy the example environment file and adjust it to your needs:
   ```sh
   cp deploy.env.example deploy.env
   # Edit deploy.env and fill in your values
   ```
   Each variable in `deploy.env` is explained in the file and in the section below.

   - **CLOUD_FUNCTION_NAME**: The name for your Cloud Run service (e.g. `my-dart-function`).
   - **PROJECT_ID**: Your Google Cloud project ID (e.g. `my-gcp-project`).
   - **REGION**: The deployment region. Choose one of the following recommended defaults:
     - Europe: `europe-west1` (Belgium), `europe-west4` (Netherlands)
     - USA: `us-central1` (Iowa), `us-east1` (South Carolina), `us-west1` (Oregon)
     - Asia: `asia-northeast1` (Tokyo), `asia-southeast1` (Singapore)
   - **PORT**: The port your function listens on (default: `8080`).

4. Deploy to Cloud Run:
   ```sh
   ./deploy.sh
   ```
   After deployment, you will find the service URL in the build output.

## Example

You can find an example function in `lib/functions.dart`. Adapt it to your needs.

## License

This project is licensed under the [MIT License](LICENSE).

---

Made with ❤️ to make Dart in the cloud easy to use.

