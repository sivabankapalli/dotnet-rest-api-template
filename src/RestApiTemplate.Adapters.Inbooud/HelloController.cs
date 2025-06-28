using Microsoft.AspNetCore.Mvc;
using RestApiTemplate.Core.Greetings;

namespace RestApiTemplate.Adapters.Inbound;

[ApiController]
[ApiVersion("1.0")]
[Route("v{version:apiVersion}/[controller]")]
public class HelloController(IGreetingService greetingService) : ControllerBase
{
    [HttpGet]
    public IActionResult Get() => Ok(greetingService.SayHello());
}
