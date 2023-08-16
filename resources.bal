import ballerinax/healthcare.fhir.carinconsumerdirectedpayerdataexchange as crbb;
// import testabcd/healthcare.fhir.aubase as aubase;
// import ballerinax/healthcare.fhir.davincipayerdataexchange;

public type Patient record {
    string id?;
    string lastName?;
    string gender?;
};

isolated function transform(Patient patient) returns crbb:C4BBPatient => {
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

// isolated function transform2() returns davincipayerdataexchange:Provenance => {
//     id: "12323232",
//     recorded: "2020-07-09T15:26:23.217+00:00",
//     target: [
//         reference:"Bundle/1"
//     ],
//     agent: [
//         {
//             'type: {
//                 coding: [
//                     {
//                         system: "http://hl7.org/fhir/us/core/CodeSystem/us-core-provenance-participant-type",
//                         code: "transmitter",
//                         display: "Transmitter"
//                     }
//                 ]
//             },
//             who: {
//                 reference: "Organization/2"
//             }
//         }
//     ]

// };
