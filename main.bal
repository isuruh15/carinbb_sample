import ballerina/http;

listener http:Listener httpListener = new (9595);

type IdNotFound record {|
    *http:NotFound;
    record {
        string message;
    } body;
|};


service / on httpListener {

    isolated resource function get [string fhirType]/[string id]() returns json|error {
        http:Client clientEndpoint = check new("https://run.mocky.io/v3");

    // Send the GET request
    http:Response httpResponse = check clientEndpoint->get("/bb0fd117-9430-4062-a588-fb88d71f97c3");

    // Get the response as a string
    json responseStr = check httpResponse.getJsonPayload();
    Patient patient = check responseStr.cloneWithType();

    return patient is Patient ? (transform(patient)).toJson() : error http:ResourceNotFoundError("Patient not found");
}
}

