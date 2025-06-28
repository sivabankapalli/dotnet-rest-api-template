using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.Extensions.DependencyInjection;

namespace Diagnostics.HealthChecks.Extensions;

public static class HealthCheckExtensions
{
    public static IServiceCollection AddHealthChecksWithReadinessAndLiveness(this IServiceCollection services)
    {
        services.AddHealthChecks()
            .AddCheck<ReadinessHealthCheck>("Readiness")
            .AddCheck<LivenessHealthCheck>("Liveness");

        services.AddSingleton<ReadinessHealthCheck>();
        services.AddHostedService<StartupHostedService>();

        return services;
    }
}
