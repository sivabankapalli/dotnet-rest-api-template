
namespace Diagnostics.HealthChecks;

public class HealthCheck
{
    public class Endpoint
    {
        public const string Base = "/health";
        public const string Readiness = $"{Base}/readiness";
        public const string Liveness = $"{Base}/liveness";
    }
}
