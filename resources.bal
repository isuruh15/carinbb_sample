import ballerinax/healthcare.fhir.carinbb;

public type Patient record {
    string id?;
    string lastName?;
    string gender?;
};



isolated function transform(Patient patient) returns carinbb:C4BBPatient => {
    id: patient.id,
    identifier: [
        {
            system: "http://hl7.org/fhir/sid/us-ssn",
            value: patient.id
        }
    ],
    name: [
        {
            family: patient.lastName
        }
    ],
    gender: "male"
    
};
