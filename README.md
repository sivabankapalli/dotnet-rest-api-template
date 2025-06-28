# .NET REST API Template

This project is a template for building RESTful APIs using .NET 8/9. It includes best practices for project structure, health checks, and testing.

## Features
- Modular project structure (Core, Application, Adapters, WebApi)
- Health checks (Readiness & Liveness endpoints)
- Integration and unit testing projects
- .gitignore for common unwanted files and extensions

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
