import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "@my-typespec-monorepo/common";

using TypeSpec.Http;
using TypeSpec.Rest;
using MyApiCommon;


@service({
  title: "Pet store"
})
@server("https://api.example.com", "Example endpoint")
namespace MyApi;

model Pet {
    id: string;
}

@autoRoute
interface PetOperations {
  @get
  getPet(): Pet[] | ErrorObject;
}