import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "@typespec/versioning";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.Versioning;

@versioned(Versions)
namespace MyApiCommon;

enum Versions {
  v1,
  v2,
}

model Page<Data> {
  data: Data[];
  links?: PageLinks;
  meta?: PageMeta;
}

model PageLinks {
  self?: string;
  first?: string;
  prev?: string;
  next?: string;
  last?: string;
}

@added(Versions.v2)
model ObjectLink {
  self?: string;
  related?: {
    href?: string;
    title?: string;
  }
}

@doc("Metadata for pagination")
model PageMeta is Record<unknown>;

@doc("Cursor for pagination")
scalar PageCursor extends string;

@doc("Size for pagination")
scalar PageSize extends integer;

@error
@doc("Error object")
model ErrorObject {
  status: string;
  id?: string;
  code?: string;
  title?: string;
}
