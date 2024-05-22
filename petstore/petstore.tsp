import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "@typespec/versioning";
import "@my-typespec-monorepo/common";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.OpenAPI;
using TypeSpec.Versioning;
using MyApiCommon;

@service({
  title: "Pet store",
})
@server("https://api.example.com", "Example endpoint")
@versioned(Versions)
namespace MyApi;

enum Versions {
  v1,
}

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
  getPets(@query cursor?: PageCursor, @query size?: PageSize): {
    @statusCode statusCode: 200;
    @body pets: Page<Pet>;
  } | ErrorObject;

  @doc("Get a pet by ID")
  @get
  getPetById(@path id: string): Pet | ErrorObject;
}
