using Diagnostics.HealthChecks;
using Diagnostics.HealthChecks.Extensions;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllers();
builder.Services.AddHealthChecksWithReadinessAndLiveness();

var app = builder.Build();

app.UseRouting();
app.MapControllers();
app.Run();
