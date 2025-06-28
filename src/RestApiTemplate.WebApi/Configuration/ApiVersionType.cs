namespace RestApiTemplate.WebApi.Configuration;

/// <summary>
/// Defines the formatting style for API version group names used in Swagger documentation and URL generation.
/// </summary>
public enum ApiVersionType
{
    /// <summary>
    /// Use only the major version in the group name.
    /// Example: v1, v2, v3
    /// </summary>
    MajorOnly,

    /// <summary>
    /// Use both major and minor version in the group name.
    /// Example: v1.0, v2.1, v3.0
    /// </summary>
    MajorMinor
}
