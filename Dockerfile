# hadolint global ignore=DL3059

ARG PROD_ECR_HOST_NAME

FROM $PROD_ECR_HOST_NAME/infrastructure/images/dotnet-9-builder:delivered AS build
WORKDIR /app
COPY ./rest-api-template/src/ ./src/
COPY ./rest-api-template/rest-api-template.sln ./
RUN dotnet publish ./src/RestApiTemplate.WebApi/RestApiTemplate.WebApi.csproj -c Release -o /publish

FROM $PROD_ECR_HOST_NAME/infrastructure/images/dotnet-9-aspnet-runtime:delivered
ENV ASPNETCORE_URLS=http://*:5000
EXPOSE 5000
WORKDIR /app
COPY --from=build /publish .
ENTRYPOINT ["dotnet", "aspnetapp.dll"]
