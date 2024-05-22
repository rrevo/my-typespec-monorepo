import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace MyApiCommon;

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
