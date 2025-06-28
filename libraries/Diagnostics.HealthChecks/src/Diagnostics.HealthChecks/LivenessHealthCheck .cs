using Microsoft.Extensions.Diagnostics.HealthChecks;

namespace Diagnostics.HealthChecks;

public class LivenessHealthCheck : IHealthCheck
{
    public Task<HealthCheckResult> CheckHealthAsync(HealthCheckContext context, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(HealthCheckResult.Healthy("The service is running."));
    }
}
