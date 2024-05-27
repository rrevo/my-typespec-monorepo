# About

[Typespec](https://typespec.io) is a modern API definition language that enables API first tooling. To get started with typespec, see [docs](https://typespec.io/docs)

This project is a sample project for with advanced examples. It includes-
- common project with base models and versioning
- petstore project with openapi oneOf, custom status codes and more.


Inputs

- [common.tsp](common/common.tsp)
- [petstore.tsp](petstore/petstore.tsp)

Outputs

- [Version v1 Online on editor.swagger.io](https://editor.swagger.io/?url=https://raw.githubusercontent.com/rrevo/my-typespec-monorepo/main/petstore/tsp-output/%40typespec/openapi3/openapi.v1.yaml)
- [Version v2 Online on editor.swagger.io](https://editor.swagger.io/?url=https://raw.githubusercontent.com/rrevo/my-typespec-monorepo/main/petstore/tsp-output/%40typespec/openapi3/openapi.v2.yaml)

## Developer commands

### Initial setup

- Install node v20 LTS
- run `npm install`

### Build

Build once
`npm run build`

Build continuously
`npm run build:watch`

### Node tips

Install packages in a workspace
`npm install $package -w $workspace`
