# .NET REST API Template

A production-grade .NET 8 Web API starter template that helps you scaffold new microservices with:
- Clean architecture (Core, Application, Inbound, Outbound)
- Built-in health, readiness, and liveness probes
- Kubernetes deployment via Kustomize
- CLI-based scaffolding script
- Pre-configured test projects (unit, integration, system integration)
- Serilog structured logging.

## Why Use This Template?
When spinning up microservices, teams often waste hours repeating boilerplate steps:
- Project scaffolding
- Health endpoints
- Docker setup
- Kubernetes manifests
- CI/CD hooks

This template eliminates the friction. Whether you're a senior engineer or someone just getting started, this gives you a reliable, scalable, and testable foundation in one command.

## Architecture Overview
``` graphql
src/
├── RestApiTemplate.Application/             # Business logic layer
├── RestApiTemplate.WebApi/                  # ASP.NET Core Web API (HTTP layer)
└── RestApiTemplate.Domain/                  # Domain interfaces and models

Testings/
├── RestApiTemplate.UnitTests/               # Unit tests
├── RestApiTemplate.ApplicationIntegrationTests/  # App-layer integration
└── RestApiTemplate.SystemIntegrationTests/  # End-to-end/system tests
```
Health checks, logging, and DI are wired using best practices. K8s deployments use overlays and are ready for deployment.

## CLI Bootstrap Tool
Use the CLI script to scaffold a new microservice:
```bash
./new-service.sh <service-name> <namespace> [port]
```
Example:
```bash
./new-service.sh orders-api dev 8081
```

This:
- Copies the template
- Replaces all token placeholders (```{{SERVICE_NAME}}, {{NAMESPACE}}, {{PORT}}```)
- Prepares Dockerfile and Kubernetes overlays

## Docker Setup
Your scaffolded API comes with:
- A minimal ```Dockerfile``` for .NET 8
- K8s manifests for Deployment, Service, HPA, Authorization Policy, and VirtualService

To build and run:
```bash
docker build -t my-api .
docker run -p 8080:80 my-api
```

## Kustomize-Based Kubernetes Deployment
Deployment structure:
```bash
kustomization/
├── base/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── authorization-policy.yaml
│   ├── virtual-service.yaml
│   └── horizontal-pod-autoscaler.yaml
├── resources/
│   ├── envsubst/
│   └── sit/
└── overlays/
    └── dev/
        └── kustomization.yaml
```

To deploy:
```bash
kubectl apply -k kustomization/overlays/dev
```
## Test Project Setup
Three types of test projects are included:
- Unit Tests — validate pure logic
- Application Integration Tests — test service + business logic
- System Integration Tests — test full API endpoint with infra (via mocks/test containers)
  
Run tests:
```bash
dotnet test
```

## Health Checks
Health check endpoints are provided via the Diagnostics.HealthChecks library:
- **Readiness:** `/health/readiness` — Indicates if the service is ready to receive traffic
- **Liveness:** `/health/liveness` — Indicates if the service is running

Health checks are registered in `Program.cs`:
```csharp
builder.Services.AddHealthChecksWithReadinessAndLiveness();
```

## Project Structure
- `src/` — Main application code
- `Testings/` — Test projects (integration and unit tests)
- `libraries/` — Shared libraries (e.g., Diagnostics.HealthChecks)

## Getting Started
1. Clone the repository
2. Restore dependencies: `dotnet restore`
3. Build the solution: `dotnet build`
4. Run the API: `dotnet run --project src/RestApiTemplate.WebApi`

## .gitignore
A `.gitignore` file is included to ignore build outputs, user-specific files, logs, and other unwanted extensions.

## Requirements
- .NET 8 or .NET 9 SDK

---
Feel free to customize this template to fit your needs!
