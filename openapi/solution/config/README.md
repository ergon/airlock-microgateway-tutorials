# OpenAPI
When deploying the Docker image `openapitools/openapi-petstore`, the `openapi.json` file can be
downloaded from the frontpage of the website (top left corner).

For this exercise, the original openapi spec is being used with a small adaption.

```code
jq '.components.schemas.body_1={}' openapi-petstore-orig.json > openapi-petstore.json
```