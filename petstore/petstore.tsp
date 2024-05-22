import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "@my-typespec-monorepo/common";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.OpenAPI;
using MyApiCommon;

@service({
  title: "Pet store",
})
@server("https://api.example.com", "Example endpoint")
namespace MyApi;

@discriminator("kind")
@oneOf
union Pet {
  dog: Dog,
  cat: Cat,
}

enum Category {
  Domestic: "domestic",
  Wild: "wild",
}

model BasePet {
  id: string;
  category: Category;
  name?: string;
}

model Dog is BasePet {
  kind: "dog";
  breed?: string;
  address?: string = "wild";
}

model Cat is BasePet {
  kind: "cat";
  color?: string;
  address?: string = "street";
}

@route("/pets")
interface Pets {
  @doc("Get all pets")
  @get
  getPets(): Pet[] | ErrorObject;

  @doc("Get a pet by ID")
  @get
  getPetById(@path id: string): Pet | ErrorObject;
}
