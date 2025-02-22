# Docker Build & Push Action

A GitHub Action for building Docker images and pushing them to a container registry. This action simplifies the process of building and publishing Docker images as part of your GitHub Actions workflow.

## Features

- Builds Docker images using specified Dockerfile and context
- Supports custom registry authentication
- Pushes built images to the specified container registry

## Usage

Here's a basic example of how to use this action in your workflow:

```yaml
name: Build and Push

on:
  push:
    branches:
      - main

jobs:
  build:
    steps:
      - uses: packhelp/build@v2
        runs-on: [self-hosted, deploy-blue]
        with:
          app: myapp
          registry_address: ${{ vars.DOCKER_REGISTRY_ADDRESS }}
          registry_username: ${{ secrets.DOCKER_REGISTRY_USERNAME }}
          registry_password: ${{ secrets.DOCKER_REGISTRY_PASSWORD }}
```

## Inputs

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `app` | Application name for the Docker image | Yes | - |
| `dockerfile` | Path to the Dockerfile | No | `Dockerfile` |
| `context` | Docker build context | No | `.` |
| `tag` | Tag for the Docker image | No | `${{ github.sha }}` |
| `registry_address` | Container registry address | Yes | - |
| `registry_username` | Registry username for authentication | Yes | - |
| `registry_password` | Registry password for authentication | Yes | - |
| `build_args` | Build arguments for Docker build command | No | - |
| `cache_from` | Images to use as cache sources | No | - |
| `target` | Target build stage to build | No | - |
| `platforms` | Platforms to build for (e.g., linux/amd64,linux/arm64) | No | - |
| `push` | Whether to push the image after building | No | `true` |
