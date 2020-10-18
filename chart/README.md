# Flowers

This example shows how to leverage Okteto to deploy and develop a Django + React application in Kubernetes.

This chart creates:
- A postgres database
- A deployment to serve the frontend
- A deployment to run the API
- An ingress to serve requests, leveraging Okteto automatic SSL endpoints for public access.
