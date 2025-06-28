using Microsoft.Extensions.Hosting;

namespace Diagnostics.HealthChecks;

public class StartupHostedService(ReadinessHealthCheck readinessHealthCheck) : IHostedService
{
    public Task StartAsync(CancellationToken cancellationToken)
    {
        readinessHealthCheck.MarkAsReady();
        return Task.CompletedTask;
    }

    public Task StopAsync(CancellationToken cancellationToken) => Task.CompletedTask;
}
