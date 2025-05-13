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
3. Create a `deploy.env` file in the project root with the following content:
   ```env
   CLOUD_FUNCTION_NAME=
   PROJECT_ID=
   REGION=europe-west1
   PORT=8080
   ```
   - **CLOUD_FUNCTION_NAME**: The name for your Cloud Run service (e.g. `my-dart-function`).
   - **PROJECT_ID**: Your Google Cloud project ID (e.g. `my-gcp-project`).
   - **REGION**: The deployment region. Choose one of the following recommended defaults:
     - Europe: `europe-west1` (Belgium), `europe-west4` (Netherlands)
     - USA: `us-central1` (Iowa), `us-east1` (South Carolina), `us-west1` (Oregon)
     - Asia: `asia-northeast1` (Tokyo), `asia-southeast1` (Singapore)
   - **PORT**: The port your function listens on (default: `8080`).

   Example for Europe:
   ```env
   CLOUD_FUNCTION_NAME=my-dart-function
   PROJECT_ID=my-gcp-project
   REGION=europe-west1
   PORT=8080
   ```

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

