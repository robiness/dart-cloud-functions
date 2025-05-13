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
2. Authenticate and set your Google Cloud project:
   ```sh
   gcloud auth login
   gcloud config set project <YOUR_PROJECT_ID>
   ```
3. Adjust deployment settings in `cloudbuild.yaml` under `substitutions`:
   ```yaml
   substitutions:
     _CLOUD_FUNCTION_NAME: 'dart-cloud-function'
     _REGION: 'europe-west1'
     _PORT: '8080'
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

