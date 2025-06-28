namespace RestApiTemplate.WebApi.Configuration;

public class SwaggerConfiguration
{
    public const string Section = "Swagger";

    /// <summary>
    /// Gets whether or not the swagger endpoint will be made available.
    /// </summary>
    public bool Enabled { get; set; }
}
