using Microsoft.Extensions.Diagnostics.HealthChecks;

namespace Diagnostics.HealthChecks;

public class ReadinessHealthCheck : IHealthCheck
{
    private bool _isReady;

    public void MarkAsReady() => _isReady = true;

    public Task<HealthCheckResult> CheckHealthAsync(HealthCheckContext context, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(_isReady
            ? HealthCheckResult.Healthy("The service is ready.")
            : HealthCheckResult.Unhealthy("The service is not ready yet."));
    }
}
