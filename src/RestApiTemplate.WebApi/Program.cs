using Diagnostics.HealthChecks;
using Diagnostics.HealthChecks.Extensions;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllers();
builder.Services.AddHealthChecksWithReadinessAndLiveness();

var app = builder.Build();

app.UseRouting();
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllers();
    endpoints.MapHealthChecks(HealthCheck.Endpoint.Readiness, new Microsoft.AspNetCore.Diagnostics.HealthChecks.HealthCheckOptions
    {
        Predicate = (check) => check.Name == "Readiness"
    });
    endpoints.MapHealthChecks(HealthCheck.Endpoint.Liveness, new Microsoft.AspNetCore.Diagnostics.HealthChecks.HealthCheckOptions
    {
        Predicate = (check) => check.Name == "Liveness"
    });
});
app.Run();
