import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace MyApiCommon;

model ErrorObject {
    status: string;
    id?: string;
    code?: string;
    title?: string;
}
