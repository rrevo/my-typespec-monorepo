# About

Test project for experimenting with typespec

Inputs

- [common.tsp](common/common.tsp)
- [petstore.tsp](petstore/petstore.tsp)

Outputs

- [openapi.yaml](petstore/tsp-output/@typespec/openapi3/openapi.yaml)

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
