// FHIR Messages converted from the HL7 v2 examples on HL7v2.md (generated).
// Pattern follows the NW Genomics IG: Bundle type message, MessageHeader, urn:uuid fullUrls.

Instance:   HL7v2Msg-LAB1-Histopathology-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Order (LAB-1) - Histopathology - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event O21."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "690S0"
* destination.endpoint = "http://www.acme.org/Endpoint/690S0"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "R0A"
* source.endpoint = "http://www.acme.org/Endpoint/R0A"
* focus[+].reference = "urn:uuid:9f7f2dc8-92e5-5603-a8bf-1ff6c104a3ce"
* focus[=].type = #ServiceRequest


Instance:   HL7v2Msg-LAB1-Histopathology-Patient
InstanceOf: Patient
Title:      "Laboratory Order (LAB-1) - Histopathology - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383206"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[+].system = "http://www.acme.org/patient/R0A"
* identifier[+].value = "7742315"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "R0A"
* name.family = "LIVERPOOL"
* name.given = "Ned"
* birthDate = "1942-06-18"
* gender = #male
* address.line[+] = "20 Forthlin Road"
* address.city = "LIVERPOOL"
* address.postalCode = "L18 9TN"

Instance:   HL7v2Msg-LAB1-Histopathology-Encounter
InstanceOf: Encounter
Title:      "Laboratory Order (LAB-1) - Histopathology - Hospital Spell"
Description: "Fictitious example: the hospital spell (HL7 v2 PV1-19, Account Number)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#AN
* identifier[+].system = "http://www.acme.org/encounter/identifiers/R0A"
* identifier[+].value = "SP2308140915"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "R0A"
* status = #in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* subject.reference = "urn:uuid:9cd7128b-ad0c-5a39-aea1-3cb09521960c"

Instance:   HL7v2Msg-LAB1-Histopathology-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Order (LAB-1) - Histopathology - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/R0A"
* identifier[+].value = "1583320-A"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "R0A"
* status = #available
* type.coding[+] = http://snomed.info/sct#258415003 "Biopsy specimen"
* subject.reference = "urn:uuid:9cd7128b-ad0c-5a39-aea1-3cb09521960c"
* collection.method.coding[+] = http://snomed.info/sct#86273004 "Biopsy"
* collection.bodySite.coding[+] = http://snomed.info/sct#32713005 "Caecum structure"
* collection.collectedDateTime = "2023-08-14T10:00:00+00:00"
* note.text = "A: Caecal mass, colonoscopic biopsies"

Instance:   HL7v2Msg-LAB1-Histopathology-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Order (LAB-1) - Histopathology - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/R0A"
* identifier[+].value = "1583320"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "R0A"
* status = #active
* intent = #order
* code.coding[+] = http://www.acme.org/CodeSystem/690S0#HISTO "Histopathology"
* subject.reference = "urn:uuid:9cd7128b-ad0c-5a39-aea1-3cb09521960c"
* encounter.reference = "urn:uuid:166f1161-b412-51e2-9ef8-7348c79c0e67"
* occurrenceDateTime = "2023-08-14T10:00:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C3456789"
* requester.display = "Dr Samuel Darwin"
* specimen[+].reference = "urn:uuid:01b3a0f8-7f74-5fb0-9f7d-e58fd46067ff"
* note[+].text = "Change in bowel habit. Colonoscopy: ulcerated mass in the caecum."

Instance:   HL7v2Msg-LAB1-Histopathology
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Order (LAB-1) - Histopathology"
Description: "Fictitious example: Laboratory Order (LAB-1) - Histopathology as a FHIR Message, converted from the HL7 v2 OML^O21 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:7008d442-8311-523e-ad2a-1c2197c099f3"
* timestamp = "2023-08-14T10:15:00+00:00"
* entry[+].fullUrl = "urn:uuid:3984d511-3366-50a5-a664-268aa83b652b"
* entry[=].resource = HL7v2Msg-LAB1-Histopathology-MessageHeader
* entry[+].fullUrl = "urn:uuid:9cd7128b-ad0c-5a39-aea1-3cb09521960c"
* entry[=].resource = HL7v2Msg-LAB1-Histopathology-Patient
* entry[+].fullUrl = "urn:uuid:166f1161-b412-51e2-9ef8-7348c79c0e67"
* entry[=].resource = HL7v2Msg-LAB1-Histopathology-Encounter
* entry[+].fullUrl = "urn:uuid:01b3a0f8-7f74-5fb0-9f7d-e58fd46067ff"
* entry[=].resource = HL7v2Msg-LAB1-Histopathology-Specimen-1
* entry[+].fullUrl = "urn:uuid:9f7f2dc8-92e5-5603-a8bf-1ff6c104a3ce"
* entry[=].resource = HL7v2Msg-LAB1-Histopathology-ServiceRequest-1

Instance:   HL7v2Msg-LAB3-Histopathology-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - Histopathology - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "R0A"
* destination.endpoint = "http://www.acme.org/Endpoint/R0A"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "690S0"
* source.endpoint = "http://www.acme.org/Endpoint/690S0"
* focus[+].reference = "urn:uuid:6d21c153-a0a0-58c7-b9f3-d48ef67118d4"
* focus[=].type = #DiagnosticReport
* focus[+].reference = "urn:uuid:6234aba8-c5b0-5a70-99b5-c6a08c83a27f"
* focus[=].type = #DiagnosticReport
* focus[+].reference = "urn:uuid:cf469c13-d85d-525c-8389-2f7eed808f5d"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-LAB3-Histopathology-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - Histopathology - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383206"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[+].system = "http://www.acme.org/patient/R0A"
* identifier[+].value = "7742315"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "R0A"
* name.family = "LIVERPOOL"
* name.given = "Ned"
* birthDate = "1942-06-18"
* gender = #male
* address.line[+] = "20 Forthlin Road"
* address.city = "LIVERPOOL"
* address.postalCode = "L18 9TN"

Instance:   HL7v2Msg-LAB3-Histopathology-Encounter
InstanceOf: Encounter
Title:      "Laboratory Report (LAB-3) - Histopathology - Hospital Spell"
Description: "Fictitious example: the hospital spell (HL7 v2 PV1-19, Account Number)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#AN
* identifier[+].system = "http://www.acme.org/encounter/identifiers/R0A"
* identifier[+].value = "SP2308140915"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "R0A"
* status = #in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"

Instance:   HL7v2Msg-LAB3-Histopathology-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - Histopathology - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/690S0"
* identifier[+].value = "H23-41022-A"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "690S0"
* status = #available
* type.coding[+] = http://snomed.info/sct#258415003 "Biopsy specimen"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* collection.method.coding[+] = http://snomed.info/sct#86273004 "Biopsy"
* collection.bodySite.coding[+] = http://snomed.info/sct#32713005 "Caecum structure"
* collection.collectedDateTime = "2023-08-14T10:00:00+00:00"
* receivedTime = "2023-08-14T15:00:00+00:00"
* note.text = "A: Caecal mass, colonoscopic biopsies"

Instance:   HL7v2Msg-LAB3-Histopathology-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - Histopathology - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/R0A"
* identifier[+].value = "1583320"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "R0A"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/690S0"
* identifier[+].value = "H23-41022"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "690S0"
* status = #completed
* intent = #order
* code.coding[+] = http://www.acme.org/CodeSystem/690S0#HISTO "Histopathology"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* occurrenceDateTime = "2023-08-14T10:00:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C3456789"
* requester.display = "Dr Samuel Darwin"
* specimen[+].reference = "urn:uuid:7d507687-48b7-5f42-8400-b360087408d6"

Instance:   HL7v2Msg-LAB3-Histopathology-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Histopathology - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#21855-2 "Primary site Cancer"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR6410 "Topography (SNOMED)"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* valueCodeableConcept.coding[+] = http://terminology.hl7.org/CodeSystem/icd-o-3#C18.0 "Cecum"
* valueCodeableConcept.coding[+] = http://snomed.info/sct#32713005 "Caecum structure"
* specimen.reference = "urn:uuid:7d507687-48b7-5f42-8400-b360087408d6"

Instance:   HL7v2Msg-LAB3-Histopathology-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - Histopathology - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/690S0"
* identifier[+].value = "H23-41022"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "690S0"
* basedOn.reference = "urn:uuid:30133afa-d8b3-5dee-846e-02b244c68813"
* status = #final
* code.coding[+] = http://www.acme.org/CodeSystem/690S0#HISTO "Histopathology"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* issued = "2023-08-21T09:00:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "690S0"
* specimen[+].reference = "urn:uuid:7d507687-48b7-5f42-8400-b360087408d6"
* result[+].reference = "urn:uuid:44947fce-37d2-51eb-b506-8123d4ed69b0"
* presentedForm[+].contentType = #application/pdf
* presentedForm[=].data = "JVBERi0x"
* presentedForm[=].title = "Cellular pathology report"

Instance:   HL7v2Msg-LAB3-Histopathology-ServiceRequest-2
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - Histopathology - ServiceRequest 2"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/R0A"
* identifier[+].value = "1583320"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "R0A"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/690S0"
* identifier[+].value = "H23-41022"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "690S0"
* status = #completed
* intent = #order
* code.coding[+] = http://loinc.org#77753-2 "Tumor morphology panel Cancer"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* occurrenceDateTime = "2023-08-14T10:00:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C3456789"
* requester.display = "Dr Samuel Darwin"

Instance:   HL7v2Msg-LAB3-Histopathology-Observation-2
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Histopathology - Observation 2"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#31205-8 "Histology ICD-O-3 Cancer"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR6420 "Morphology (SNOMED)"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* valueCodeableConcept.coding[+] = http://terminology.hl7.org/CodeSystem/icd-o-3#8140 "Adenocarcinoma, NOS"
* valueCodeableConcept.coding[+] = http://snomed.info/sct#1187332001 "Adenocarcinoma"

Instance:   HL7v2Msg-LAB3-Histopathology-Observation-3
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Histopathology - Observation 3"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#31206-6 "Behavior ICD-O-3 Cancer"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* valueCodeableConcept.coding[+] = http://terminology.hl7.org/CodeSystem/icd-o-3#3 "Malignant, primary site"

Instance:   HL7v2Msg-LAB3-Histopathology-DiagnosticReport-2
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - Histopathology - DiagnosticReport 2"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/690S0"
* identifier[+].value = "H23-41022"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "690S0"
* basedOn.reference = "urn:uuid:2adcdb7a-8de9-57b6-938f-6f08a667a93e"
* status = #final
* code.coding[+] = http://loinc.org#77753-2 "Tumor morphology panel Cancer"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* issued = "2023-08-21T09:00:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "690S0"
* result[+].reference = "urn:uuid:44f4a121-0980-5161-adf6-8f73121ca0b6"
* result[+].reference = "urn:uuid:f110fa9b-e712-5716-909d-9b5e00e6e385"

Instance:   HL7v2Msg-LAB3-Histopathology-ServiceRequest-3
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - Histopathology - ServiceRequest 3"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/R0A"
* identifier[+].value = "1583320"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "R0A"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/690S0"
* identifier[+].value = "H23-41022"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "690S0"
* status = #completed
* intent = #order
* code.coding[+] = http://www.acme.org/CodeSystem/690S0#MMR "Mismatch repair immunohistochemistry"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* occurrenceDateTime = "2023-08-14T10:00:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C3456789"
* requester.display = "Dr Samuel Darwin"

Instance:   HL7v2Msg-LAB3-Histopathology-Observation-4
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Histopathology - Observation 4"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#81691-8 "MLH-1 Ag [Presence] in Cancer specimen by Immune stain"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR7020 "MLH1 Nuclear Expression Intact"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* valueCodeableConcept.coding[+] = http://loinc.org#LA9634-2 "Absent"

Instance:   HL7v2Msg-LAB3-Histopathology-Observation-5
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Histopathology - Observation 5"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#81694-2 "PMS2 Ag [Presence] in Cancer specimen by Immune stain"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR7030 "PMS2 Nuclear Expression Intact"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* valueCodeableConcept.coding[+] = http://loinc.org#LA9634-2 "Absent"

Instance:   HL7v2Msg-LAB3-Histopathology-Observation-6
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Histopathology - Observation 6"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#81692-6 "MSH-2 Ag [Presence] in Cancer specimen by Immune stain"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR7040 "MSH2 Nuclear Expression Intact"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* valueCodeableConcept.coding[+] = http://loinc.org#LA9633-4 "Present"

Instance:   HL7v2Msg-LAB3-Histopathology-Observation-7
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Histopathology - Observation 7"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#81693-4 "MSH-6 Ag [Presence] in Cancer specimen by Immune stain"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR7050 "MSH6 Nuclear Expression Intact"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* valueCodeableConcept.coding[+] = http://loinc.org#LA9633-4 "Present"

Instance:   HL7v2Msg-LAB3-Histopathology-DiagnosticReport-3
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - Histopathology - DiagnosticReport 3"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/690S0"
* identifier[+].value = "H23-41022"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "690S0"
* basedOn.reference = "urn:uuid:813deaff-6694-5e3c-ad59-1c1e4048af27"
* status = #final
* code.coding[+] = http://www.acme.org/CodeSystem/690S0#MMR "Mismatch repair immunohistochemistry"
* subject.reference = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* encounter.reference = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* issued = "2023-08-21T09:00:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "690S0"
* result[+].reference = "urn:uuid:4093effa-9221-5bf0-abb1-085a111155de"
* result[+].reference = "urn:uuid:904a310d-c4e9-5d67-8026-f35c3059dd7a"
* result[+].reference = "urn:uuid:2ca9632e-e460-52fc-9987-05847568c66c"
* result[+].reference = "urn:uuid:ed95eaac-84e2-54a9-93dd-59a918365f18"

Instance:   HL7v2Msg-LAB3-Histopathology
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - Histopathology"
Description: "Fictitious example: Laboratory Report (LAB-3) - Histopathology as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:c19779a7-6a49-5ff3-aeb1-0d525318966d"
* timestamp = "2023-08-21T09:05:00+00:00"
* entry[+].fullUrl = "urn:uuid:a8324371-ea63-5530-b8ec-f90564008a79"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-MessageHeader
* entry[+].fullUrl = "urn:uuid:406dc7d1-959e-5d55-a070-38a20c82edc0"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-Patient
* entry[+].fullUrl = "urn:uuid:5e9af4d6-ae43-5064-8bf2-7b8ae694fd86"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-Encounter
* entry[+].fullUrl = "urn:uuid:7d507687-48b7-5f42-8400-b360087408d6"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-Specimen-1
* entry[+].fullUrl = "urn:uuid:30133afa-d8b3-5dee-846e-02b244c68813"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:44947fce-37d2-51eb-b506-8123d4ed69b0"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-Observation-1
* entry[+].fullUrl = "urn:uuid:6d21c153-a0a0-58c7-b9f3-d48ef67118d4"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-DiagnosticReport-1
* entry[+].fullUrl = "urn:uuid:2adcdb7a-8de9-57b6-938f-6f08a667a93e"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-ServiceRequest-2
* entry[+].fullUrl = "urn:uuid:44f4a121-0980-5161-adf6-8f73121ca0b6"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-Observation-2
* entry[+].fullUrl = "urn:uuid:f110fa9b-e712-5716-909d-9b5e00e6e385"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-Observation-3
* entry[+].fullUrl = "urn:uuid:6234aba8-c5b0-5a70-99b5-c6a08c83a27f"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-DiagnosticReport-2
* entry[+].fullUrl = "urn:uuid:813deaff-6694-5e3c-ad59-1c1e4048af27"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-ServiceRequest-3
* entry[+].fullUrl = "urn:uuid:4093effa-9221-5bf0-abb1-085a111155de"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-Observation-4
* entry[+].fullUrl = "urn:uuid:904a310d-c4e9-5d67-8026-f35c3059dd7a"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-Observation-5
* entry[+].fullUrl = "urn:uuid:2ca9632e-e460-52fc-9987-05847568c66c"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-Observation-6
* entry[+].fullUrl = "urn:uuid:ed95eaac-84e2-54a9-93dd-59a918365f18"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-Observation-7
* entry[+].fullUrl = "urn:uuid:cf469c13-d85d-525c-8389-2f7eed808f5d"
* entry[=].resource = HL7v2Msg-LAB3-Histopathology-DiagnosticReport-3

Instance:   HL7v2Msg-LAB3-FBC-ResultCopy-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - Full Blood Count with Result Copy - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "POS01"
* destination.endpoint = "http://www.acme.org/Endpoint/POS01"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "POL01"
* source.endpoint = "http://www.acme.org/Endpoint/POL01"
* focus[+].reference = "urn:uuid:c386d848-e042-5e0e-90a8-a75fde981a24"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-LAB3-FBC-ResultCopy-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - Full Blood Count with Result Copy - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9991000011"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[+].system = "http://www.acme.org/patient/POS01"
* identifier[+].value = "P2219834"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "POS01"
* name.family = "PRESTON"
* name.given = "Lily"
* birthDate = "2016-03-02"
* gender = #female
* address.line[+] = "14 Fishergate"
* address.city = "PRESTON"
* address.postalCode = "PR1 2NJ"

Instance:   HL7v2Msg-LAB3-FBC-ResultCopy-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - Full Blood Count with Result Copy - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/POL01"
* identifier[+].value = "LB26-552901-1"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "POL01"
* status = #available
* type.coding[+] = http://snomed.info/sct#119297000 "Blood specimen"
* subject.reference = "urn:uuid:8abb28b0-4485-5207-9bb9-f89d3d88eb56"
* collection.collectedDateTime = "2026-11-18T09:00:00+00:00"
* receivedTime = "2026-11-18T10:05:00+00:00"

Instance:   HL7v2Msg-LAB3-FBC-ResultCopy-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - Full Blood Count with Result Copy - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/POS01"
* identifier[+].value = "PO-26-11873"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "POS01"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/POL01"
* identifier[+].value = "LB26-552901"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "POL01"
* status = #completed
* intent = #order
* code.coding[+] = http://loinc.org#58410-2 "CBC panel - Blood by Automated count"
* subject.reference = "urn:uuid:8abb28b0-4485-5207-9bb9-f89d3d88eb56"
* occurrenceDateTime = "2026-11-18T09:00:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C7654321"
* requester.display = "Dr Alex FICTITIOUS"
* specimen[+].reference = "urn:uuid:6e07c411-ce50-5861-8019-1e6329d2202e"

Instance:   HL7v2Msg-LAB3-FBC-ResultCopy-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Full Blood Count with Result Copy - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#718-7 "Hemoglobin [Mass/volume] in Blood"
* subject.reference = "urn:uuid:8abb28b0-4485-5207-9bb9-f89d3d88eb56"
* effectiveDateTime = "2026-11-18T11:25:00+00:00"
* valueQuantity.value = 98
* valueQuantity.unit = "gram per litre"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #g/L
* referenceRange.text = "115-155"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* specimen.reference = "urn:uuid:6e07c411-ce50-5861-8019-1e6329d2202e"

Instance:   HL7v2Msg-LAB3-FBC-ResultCopy-Observation-2
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Full Blood Count with Result Copy - Observation 2"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#6690-2 "Leukocytes [#/volume] in Blood by Automated count"
* subject.reference = "urn:uuid:8abb28b0-4485-5207-9bb9-f89d3d88eb56"
* effectiveDateTime = "2026-11-18T11:25:00+00:00"
* valueQuantity.value = 2.1
* valueQuantity.unit = "billion per litre"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #10*9/L
* referenceRange.text = "4.5-13.5"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* specimen.reference = "urn:uuid:6e07c411-ce50-5861-8019-1e6329d2202e"

Instance:   HL7v2Msg-LAB3-FBC-ResultCopy-Observation-3
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Full Blood Count with Result Copy - Observation 3"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#751-8 "Neutrophils [#/volume] in Blood by Automated count"
* subject.reference = "urn:uuid:8abb28b0-4485-5207-9bb9-f89d3d88eb56"
* effectiveDateTime = "2026-11-18T11:25:00+00:00"
* valueQuantity.value = 0.6
* valueQuantity.unit = "billion per litre"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #10*9/L
* referenceRange.text = "1.5-8.0"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* specimen.reference = "urn:uuid:6e07c411-ce50-5861-8019-1e6329d2202e"

Instance:   HL7v2Msg-LAB3-FBC-ResultCopy-Observation-4
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Full Blood Count with Result Copy - Observation 4"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#777-3 "Platelets [#/volume] in Blood by Automated count"
* subject.reference = "urn:uuid:8abb28b0-4485-5207-9bb9-f89d3d88eb56"
* effectiveDateTime = "2026-11-18T11:25:00+00:00"
* valueQuantity.value = 85
* valueQuantity.unit = "billion per litre"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #10*9/L
* referenceRange.text = "150-450"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* specimen.reference = "urn:uuid:6e07c411-ce50-5861-8019-1e6329d2202e"

Instance:   HL7v2Msg-LAB3-FBC-ResultCopy-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - Full Blood Count with Result Copy - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/POL01"
* identifier[+].value = "LB26-552901"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "POL01"
* basedOn.reference = "urn:uuid:68702cdf-c6e1-5615-a43d-b7d58fa556fb"
* status = #final
* code.coding[+] = http://loinc.org#58410-2 "CBC panel - Blood by Automated count"
* subject.reference = "urn:uuid:8abb28b0-4485-5207-9bb9-f89d3d88eb56"
* effectiveDateTime = "2026-11-18T09:00:00+00:00"
* issued = "2026-11-18T11:25:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "POL01"
* specimen[+].reference = "urn:uuid:6e07c411-ce50-5861-8019-1e6329d2202e"
* result[+].reference = "urn:uuid:6f300b25-0e71-583d-8bb7-1a3f81351873"
* result[+].reference = "urn:uuid:f19ffa45-fbc4-5c89-88b1-506fa3d1832e"
* result[+].reference = "urn:uuid:8fc82b86-6ba4-56e0-a2c7-7628f4d6cf81"
* result[+].reference = "urn:uuid:b16a9bfe-ce4e-5e17-a101-de8643d3ca81"

Instance:   HL7v2Msg-LAB3-FBC-ResultCopy
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - Full Blood Count with Result Copy"
Description: "Fictitious example: Laboratory Report (LAB-3) - Full Blood Count with Result Copy as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:0c626612-96d3-581b-997d-d1b6166d6569"
* timestamp = "2026-11-18T11:30:00+00:00"
* entry[+].fullUrl = "urn:uuid:f3bdddee-2a86-5fcb-95ae-e859183f4ae5"
* entry[=].resource = HL7v2Msg-LAB3-FBC-ResultCopy-MessageHeader
* entry[+].fullUrl = "urn:uuid:8abb28b0-4485-5207-9bb9-f89d3d88eb56"
* entry[=].resource = HL7v2Msg-LAB3-FBC-ResultCopy-Patient
* entry[+].fullUrl = "urn:uuid:6e07c411-ce50-5861-8019-1e6329d2202e"
* entry[=].resource = HL7v2Msg-LAB3-FBC-ResultCopy-Specimen-1
* entry[+].fullUrl = "urn:uuid:68702cdf-c6e1-5615-a43d-b7d58fa556fb"
* entry[=].resource = HL7v2Msg-LAB3-FBC-ResultCopy-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:6f300b25-0e71-583d-8bb7-1a3f81351873"
* entry[=].resource = HL7v2Msg-LAB3-FBC-ResultCopy-Observation-1
* entry[+].fullUrl = "urn:uuid:f19ffa45-fbc4-5c89-88b1-506fa3d1832e"
* entry[=].resource = HL7v2Msg-LAB3-FBC-ResultCopy-Observation-2
* entry[+].fullUrl = "urn:uuid:8fc82b86-6ba4-56e0-a2c7-7628f4d6cf81"
* entry[=].resource = HL7v2Msg-LAB3-FBC-ResultCopy-Observation-3
* entry[+].fullUrl = "urn:uuid:b16a9bfe-ce4e-5e17-a101-de8643d3ca81"
* entry[=].resource = HL7v2Msg-LAB3-FBC-ResultCopy-Observation-4
* entry[+].fullUrl = "urn:uuid:c386d848-e042-5e0e-90a8-a75fde981a24"
* entry[=].resource = HL7v2Msg-LAB3-FBC-ResultCopy-DiagnosticReport-1

Instance:   HL7v2Msg-DHCW-PathologyResult-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "7A1"
* destination.endpoint = "http://www.acme.org/Endpoint/7A1"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "REM"
* source.endpoint = "http://www.acme.org/Endpoint/REM"
* focus[+].reference = "urn:uuid:8fcf1db2-20fb-5dfd-a3c2-940d58a56ad9"
* focus[=].type = #DiagnosticReport
* focus[+].reference = "urn:uuid:be917b3d-8147-53f1-a543-977ff5ad1252"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-DHCW-PathologyResult-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383257"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[+].system = "http://www.acme.org/patient/REM"
* identifier[+].value = "REM7676150"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "REM"
* name.family = "WREXHAM"
* name.given = "Myrcella"
* birthDate = "1999-10-13"
* gender = #female
* address.line[+] = "Ffordd, Mold Rd"
* address.line[+] = "Mold"
* address.city = "WREXHAM"
* address.postalCode = "LL11 2AH"

Instance:   HL7v2Msg-DHCW-PathologyResult-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/7A1"
* identifier[+].value = "880412"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "7A1"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/REM"
* identifier[+].value = "914694928301"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "REM"
* status = #completed
* intent = #order
* code.coding[+] = http://www.acme.org/CodeSystem/REM#B3051 "HbA1c (IFCC traceable)"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* occurrenceDateTime = "2018-03-09T15:00:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C9000115"
* requester.display = "Dr Andar FICTITIOUS"

Instance:   HL7v2Msg-DHCW-PathologyResult-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #corrected
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://www.acme.org/CodeSystem/REM#B3553 "HbA1c (IFCC traceable)"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* effectiveDateTime = "2018-03-09T15:00:00+00:00"
* valueQuantity.value = 49
* valueQuantity.unit = "millimole per mole"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mmol/mol
* referenceRange.text = "<48"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H

Instance:   HL7v2Msg-DHCW-PathologyResult-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/REM"
* identifier[+].value = "914694928301"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "REM"
* basedOn.reference = "urn:uuid:ad1c743f-b753-5bf6-8ec5-5c997d415e28"
* status = #corrected
* code.coding[+] = http://www.acme.org/CodeSystem/REM#B3051 "HbA1c (IFCC traceable)"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* effectiveDateTime = "2018-03-09T15:00:00+00:00"
* issued = "2018-03-09T15:00:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "REM"
* result[+].reference = "urn:uuid:34b556cf-6148-596d-a414-65376c072e9a"
* conclusion = "For monitoring known diabetic patients, please follow NICE guidelines. If not a known diabetic and the patient is asymptomatic, a second confirmatory sample is required within 2 weeks (WEDS Guidance). HbA1c is unreliable for diagnostic and monitoring purposes in the context of several conditions, including some haemoglobinopathies, abnormal haemoglobin levels, chronic renal failure, recent transfusion, pregnancy, or alcoholism."

Instance:   HL7v2Msg-DHCW-PathologyResult-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/REM"
* identifier[+].value = "9146949283"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "REM"
* status = #available
* type.coding[+] = http://snomed.info/sct#119297000 "Blood specimen"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* collection.collectedDateTime = "2018-03-09T14:00:00+00:00"
* receivedTime = "2018-03-09T15:00:00+00:00"

Instance:   HL7v2Msg-DHCW-PathologyResult-ServiceRequest-2
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - ServiceRequest 2"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/7A1"
* identifier[+].value = "880412"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "7A1"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/REM"
* identifier[+].value = "914694928301"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "REM"
* status = #completed
* intent = #order
* code.coding[+] = http://www.acme.org/CodeSystem/REM#B0001 "Full blood count"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* occurrenceDateTime = "2018-03-09T15:00:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C9000115"
* requester.display = "Dr Andar FICTITIOUS"
* specimen[+].reference = "urn:uuid:d8529bde-1fc8-5db2-ba2f-11fd0f83efd4"

Instance:   HL7v2Msg-DHCW-PathologyResult-Observation-2
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - Observation 2"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://www.acme.org/CodeSystem/REM#B0300 "White blood cell (WBC) count"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* effectiveDateTime = "2018-03-09T15:00:00+00:00"
* valueQuantity.value = 3.5
* valueQuantity.unit = "billion per litre"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #10*9/L
* referenceRange.text = "4.0-11.0"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* specimen.reference = "urn:uuid:d8529bde-1fc8-5db2-ba2f-11fd0f83efd4"

Instance:   HL7v2Msg-DHCW-PathologyResult-Observation-3
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - Observation 3"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://www.acme.org/CodeSystem/REM#B0307 "Haemoglobin (Hb)"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* effectiveDateTime = "2018-03-09T15:00:00+00:00"
* valueQuantity.value = 200
* valueQuantity.unit = "gram per litre"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #g/L
* referenceRange.text = "130-180"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H
* specimen.reference = "urn:uuid:d8529bde-1fc8-5db2-ba2f-11fd0f83efd4"

Instance:   HL7v2Msg-DHCW-PathologyResult-Observation-4
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - Observation 4"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://www.acme.org/CodeSystem/REM#B0314 "Platelet (PLT) count"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* effectiveDateTime = "2018-03-09T15:00:00+00:00"
* valueQuantity.value = 500
* valueQuantity.unit = "billion per litre"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #10*9/L
* referenceRange.text = "150-400"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H
* specimen.reference = "urn:uuid:d8529bde-1fc8-5db2-ba2f-11fd0f83efd4"

Instance:   HL7v2Msg-DHCW-PathologyResult-Observation-5
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - Observation 5"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://www.acme.org/CodeSystem/REM#B0306 "Red blood cell (RBC) count"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* effectiveDateTime = "2018-03-09T15:00:00+00:00"
* valueQuantity.value = 6.00
* valueQuantity.unit = "trillion per litre"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #10*12/L
* referenceRange.text = "4.50-6.00"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N
* specimen.reference = "urn:uuid:d8529bde-1fc8-5db2-ba2f-11fd0f83efd4"

Instance:   HL7v2Msg-DHCW-PathologyResult-Observation-6
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - Observation 6"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://www.acme.org/CodeSystem/REM#B0308 "Haematocrit (Hct)"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* effectiveDateTime = "2018-03-09T15:00:00+00:00"
* valueQuantity.value = 0.60
* valueQuantity.unit = "litre per litre"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #L/L
* referenceRange.text = "0.40-0.52"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H
* specimen.reference = "urn:uuid:d8529bde-1fc8-5db2-ba2f-11fd0f83efd4"

Instance:   HL7v2Msg-DHCW-PathologyResult-Observation-7
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - Observation 7"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://www.acme.org/CodeSystem/REM#B0309 "Mean cell volume (MCV)"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* effectiveDateTime = "2018-03-09T15:00:00+00:00"
* valueQuantity.value = 120
* valueQuantity.unit = "femtolitre"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #fL
* referenceRange.text = "80-100"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H
* specimen.reference = "urn:uuid:d8529bde-1fc8-5db2-ba2f-11fd0f83efd4"

Instance:   HL7v2Msg-DHCW-PathologyResult-Observation-8
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - Observation 8"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://www.acme.org/CodeSystem/REM#B0310 "Mean cell haemoglobin (MCH)"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* effectiveDateTime = "2018-03-09T15:00:00+00:00"
* valueQuantity.value = 34.0
* valueQuantity.unit = "picogram"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #pg
* referenceRange.text = "27.0-33.0"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H
* specimen.reference = "urn:uuid:d8529bde-1fc8-5db2-ba2f-11fd0f83efd4"

Instance:   HL7v2Msg-DHCW-PathologyResult-DiagnosticReport-2
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - DHCW Pathology Result, adapted - DiagnosticReport 2"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/REM"
* identifier[+].value = "914694928301"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "REM"
* basedOn.reference = "urn:uuid:bac29f07-7c89-5f54-bde0-bf310e425e23"
* status = #final
* code.coding[+] = http://www.acme.org/CodeSystem/REM#B0001 "Full blood count"
* subject.reference = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* effectiveDateTime = "2018-03-09T15:00:00+00:00"
* issued = "2018-03-09T15:00:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "REM"
* specimen[+].reference = "urn:uuid:d8529bde-1fc8-5db2-ba2f-11fd0f83efd4"
* result[+].reference = "urn:uuid:414fb48f-fd39-539e-8c9a-52d1f9dff485"
* result[+].reference = "urn:uuid:3b8c6e96-d451-500e-8869-8a79c401cd71"
* result[+].reference = "urn:uuid:d4cb017c-6233-5e8f-b3dc-348cae7d10fd"
* result[+].reference = "urn:uuid:76c94387-5d1f-5c03-9d00-9c8f286a33bc"
* result[+].reference = "urn:uuid:5910ff85-0071-5156-a1fd-a0dffe70a07b"
* result[+].reference = "urn:uuid:bb3d14d6-5c17-5163-aa74-c7c2f640dae1"
* result[+].reference = "urn:uuid:c36d4813-3db8-5667-8077-806e5b4b71ab"

Instance:   HL7v2Msg-DHCW-PathologyResult
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - DHCW Pathology Result, adapted"
Description: "Fictitious example: Laboratory Report (LAB-3) - DHCW Pathology Result, adapted as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:023f4626-1946-5610-a905-2bc92749d791"
* timestamp = "2018-03-09T16:00:00+00:00"
* entry[+].fullUrl = "urn:uuid:fcf2cfb6-061d-5d69-9885-2abbcd1c3bb6"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-MessageHeader
* entry[+].fullUrl = "urn:uuid:1afdc4ca-b4a4-5931-bad7-60a67126a20e"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-Patient
* entry[+].fullUrl = "urn:uuid:ad1c743f-b753-5bf6-8ec5-5c997d415e28"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:34b556cf-6148-596d-a414-65376c072e9a"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-Observation-1
* entry[+].fullUrl = "urn:uuid:8fcf1db2-20fb-5dfd-a3c2-940d58a56ad9"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-DiagnosticReport-1
* entry[+].fullUrl = "urn:uuid:d8529bde-1fc8-5db2-ba2f-11fd0f83efd4"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-Specimen-1
* entry[+].fullUrl = "urn:uuid:bac29f07-7c89-5f54-bde0-bf310e425e23"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-ServiceRequest-2
* entry[+].fullUrl = "urn:uuid:414fb48f-fd39-539e-8c9a-52d1f9dff485"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-Observation-2
* entry[+].fullUrl = "urn:uuid:3b8c6e96-d451-500e-8869-8a79c401cd71"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-Observation-3
* entry[+].fullUrl = "urn:uuid:d4cb017c-6233-5e8f-b3dc-348cae7d10fd"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-Observation-4
* entry[+].fullUrl = "urn:uuid:76c94387-5d1f-5c03-9d00-9c8f286a33bc"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-Observation-5
* entry[+].fullUrl = "urn:uuid:5910ff85-0071-5156-a1fd-a0dffe70a07b"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-Observation-6
* entry[+].fullUrl = "urn:uuid:bb3d14d6-5c17-5163-aa74-c7c2f640dae1"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-Observation-7
* entry[+].fullUrl = "urn:uuid:c36d4813-3db8-5667-8077-806e5b4b71ab"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-Observation-8
* entry[+].fullUrl = "urn:uuid:be917b3d-8147-53f1-a543-977ff5ad1252"
* entry[=].resource = HL7v2Msg-DHCW-PathologyResult-DiagnosticReport-2

Instance:   HL7v2Msg-DHCW-TextReport-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - DHCW Text Based Report, adapted - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "7A1"
* destination.endpoint = "http://www.acme.org/Endpoint/7A1"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "RBT"
* source.endpoint = "http://www.acme.org/Endpoint/RBT"
* focus[+].reference = "urn:uuid:fd948bb2-e7d2-5ea2-b6ec-cb4b5791eed2"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-DHCW-TextReport-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - DHCW Text Based Report, adapted - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9999999506"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[+].system = "http://www.acme.org/patient/RBT"
* identifier[+].value = "RBT4948902"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "RBT"
* name.family = "EDITESTPATIENT"
* name.given = "FIVE"
* birthDate = "1990-10-19"
* gender = #male
* address.postalCode = "ZZ99 3VZ"

Instance:   HL7v2Msg-DHCW-TextReport-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - DHCW Text Based Report, adapted - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/RBT"
* identifier[+].value = "8005372251"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "RBT"
* status = #available
* type.coding[+] = http://snomed.info/sct#258574006 "Mid-stream urine specimen"
* subject.reference = "urn:uuid:e6833d74-df72-53b5-ae7c-3fac2efc0cb4"
* collection.collectedDateTime = "2018-05-24T00:00:00+00:00"
* receivedTime = "2018-05-24T00:00:00+00:00"

Instance:   HL7v2Msg-DHCW-TextReport-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - DHCW Text Based Report, adapted - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/7A1"
* identifier[+].value = "880413"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "7A1"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/RBT"
* identifier[+].value = "8005372251-1-M0007"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "RBT"
* status = #completed
* intent = #order
* code.coding[+] = http://www.acme.org/CodeSystem/RBT#M0007 "Urine MC&S"
* subject.reference = "urn:uuid:e6833d74-df72-53b5-ae7c-3fac2efc0cb4"
* occurrenceDateTime = "2018-05-24T00:00:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C9000116"
* requester.display = "Dr Jane FICTITIOUS"
* specimen[+].reference = "urn:uuid:107364a0-53c4-5184-9463-05a765f85eb2"

Instance:   HL7v2Msg-DHCW-TextReport-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - DHCW Text Based Report, adapted - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://www.acme.org/CodeSystem/RBT#RPT "Report line"
* subject.reference = "urn:uuid:e6833d74-df72-53b5-ae7c-3fac2efc0cb4"
* effectiveDateTime = "2018-05-24T00:00:00+00:00"
* valueString = "Specimen received: Mid Stream Urine

Accession Number(s) U18S999001A
White Blood Cell Count 10-99 x10^6/L
Red Blood Cell Count >=100 x10^6/L

>= 10^8 cfu/L Escherichia coli (ECOL)

 Antibiotic/Culture: ECOL
 ------------------- ------
 Nitrofurantoin      S
 Trimethoprim        S
 Amoxicillin         R"
* specimen.reference = "urn:uuid:107364a0-53c4-5184-9463-05a765f85eb2"

Instance:   HL7v2Msg-DHCW-TextReport-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - DHCW Text Based Report, adapted - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/RBT"
* identifier[+].value = "8005372251-1-M0007"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "RBT"
* basedOn.reference = "urn:uuid:a268a2d3-bcd0-5dbc-acfe-12ff4df4b9cb"
* status = #final
* code.coding[+] = http://www.acme.org/CodeSystem/RBT#M0007 "Urine MC&S"
* subject.reference = "urn:uuid:e6833d74-df72-53b5-ae7c-3fac2efc0cb4"
* effectiveDateTime = "2018-05-24T00:00:00+00:00"
* issued = "2018-05-24T00:00:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "RBT"
* specimen[+].reference = "urn:uuid:107364a0-53c4-5184-9463-05a765f85eb2"
* result[+].reference = "urn:uuid:c5d5e1fd-b7b4-51b0-9a7f-cbd1eecf8b6e"

Instance:   HL7v2Msg-DHCW-TextReport
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - DHCW Text Based Report, adapted"
Description: "Fictitious example: Laboratory Report (LAB-3) - DHCW Text Based Report, adapted as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:82cfc985-0e53-5b98-9911-0caf3359c78e"
* timestamp = "2018-05-24T12:00:00+00:00"
* entry[+].fullUrl = "urn:uuid:85043028-cdac-57f6-9d04-0d62bee73bda"
* entry[=].resource = HL7v2Msg-DHCW-TextReport-MessageHeader
* entry[+].fullUrl = "urn:uuid:e6833d74-df72-53b5-ae7c-3fac2efc0cb4"
* entry[=].resource = HL7v2Msg-DHCW-TextReport-Patient
* entry[+].fullUrl = "urn:uuid:107364a0-53c4-5184-9463-05a765f85eb2"
* entry[=].resource = HL7v2Msg-DHCW-TextReport-Specimen-1
* entry[+].fullUrl = "urn:uuid:a268a2d3-bcd0-5dbc-acfe-12ff4df4b9cb"
* entry[=].resource = HL7v2Msg-DHCW-TextReport-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:c5d5e1fd-b7b4-51b0-9a7f-cbd1eecf8b6e"
* entry[=].resource = HL7v2Msg-DHCW-TextReport-Observation-1
* entry[+].fullUrl = "urn:uuid:fd948bb2-e7d2-5ea2-b6ec-cb4b5791eed2"
* entry[=].resource = HL7v2Msg-DHCW-TextReport-DiagnosticReport-1

Instance:   HL7v2Msg-NHSE-HbA1c-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - NHS England HbA1c - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "N82035"
* destination.endpoint = "http://www.acme.org/Endpoint/N82035"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "Y8J7D"
* source.endpoint = "http://www.acme.org/Endpoint/Y8J7D"
* focus[+].reference = "urn:uuid:1d887601-4235-59a0-8581-e2e5b0d136c3"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-NHSE-HbA1c-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - NHS England HbA1c - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383206"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier[+].system = "http://www.acme.org/patient/Y8J7D"
* identifier[+].value = "Y8J7D0742315"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* name.family = "LIVERPOOL"
* name.given = "Ned"
* birthDate = "1942-06-18"
* gender = #male
* address.line[+] = "20 Forthlin Road"
* address.city = "LIVERPOOL"
* address.postalCode = "L18 9TN"

Instance:   HL7v2Msg-NHSE-HbA1c-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - NHS England HbA1c - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/N82035"
* identifier[+].value = "SPC-REQ-20220129-000362"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N82035"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/Y8J7D"
* identifier[+].value = "SPC-Lab-20220129-008927"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #available
* type.text = "Venous blood specimen"
* subject.reference = "urn:uuid:51375e90-72df-5a62-b44c-4b674a374462"
* collection.collectedDateTime = "2022-01-29T10:18:00+00:00"
* receivedTime = "2022-01-29T15:14:00+00:00"

Instance:   HL7v2Msg-NHSE-HbA1c-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - NHS England HbA1c - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/N82035"
* identifier[+].value = "REQ-20220129-000241"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N82035"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/Y8J7D"
* identifier[+].value = "REP-20220130-007843"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #completed
* intent = #order
* code.coding[+] = http://snomed.info/sct#999791000000106 "Haemoglobin A1c level - International Federation of Clinical Chemistry and Laboratory Medicine standardised"
* subject.reference = "urn:uuid:51375e90-72df-5a62-b44c-4b674a374462"
* occurrenceDateTime = "2022-01-29T10:18:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C1008215"
* requester.display = "Dr Gale GASKELL"
* specimen[+].reference = "urn:uuid:2b4dae17-e8c8-5ca6-9df9-6b60bc85d611"

Instance:   HL7v2Msg-NHSE-HbA1c-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England HbA1c - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#999791000000106 "Haemoglobin A1c level - International Federation of Clinical Chemistry and Laboratory Medicine standardised"
* subject.reference = "urn:uuid:51375e90-72df-5a62-b44c-4b674a374462"
* effectiveDateTime = "2022-01-29T10:18:00+00:00"
* valueQuantity.value = 54
* valueQuantity.unit = "mmol/mol"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mmol/mol
* specimen.reference = "urn:uuid:2b4dae17-e8c8-5ca6-9df9-6b60bc85d611"
* note[+].text = "DIAGNOSIS OF DIABETES MELLITUS:
HbA1c of 48 mmol/mol and above is diagnostic of DM (WHO 2011)
42 - 47 mmol/mol indicates high risk of DM (NICE Guidance PH38 2012)

MONITORING OF DIABETES MELLITUS (ADULTS):
Type 2 target values: 48 mmol/mol – 57 mmol/mol (NICE Guidelines NG28)
Type 1 target values: 48 mmol/mol or lower (NICE Guidelines NG17)"

Instance:   HL7v2Msg-NHSE-HbA1c-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - NHS England HbA1c - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/Y8J7D"
* identifier[+].value = "REP-20220130-007843"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* basedOn.reference = "urn:uuid:ec84115c-88f7-5221-b13e-c1d0247bb40d"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#CH
* code.coding[+] = http://snomed.info/sct#999791000000106 "Haemoglobin A1c level - International Federation of Clinical Chemistry and Laboratory Medicine standardised"
* subject.reference = "urn:uuid:51375e90-72df-5a62-b44c-4b674a374462"
* effectiveDateTime = "2022-01-29T10:18:00+00:00"
* issued = "2022-01-30T12:48:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "Y8J7D"
* specimen[+].reference = "urn:uuid:2b4dae17-e8c8-5ca6-9df9-6b60bc85d611"
* result[+].reference = "urn:uuid:3f5f18cd-ffbc-5861-9976-1756c4887b0b"

Instance:   HL7v2Msg-NHSE-HbA1c
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - NHS England HbA1c"
Description: "Fictitious example: Laboratory Report (LAB-3) - NHS England HbA1c as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:a249764e-58c1-5b24-9f83-ae2b5e76975f"
* timestamp = "2022-03-08T12:09:00+00:00"
* entry[+].fullUrl = "urn:uuid:ee8758ba-b5b6-5dfd-a6f5-afa76e8a2d9b"
* entry[=].resource = HL7v2Msg-NHSE-HbA1c-MessageHeader
* entry[+].fullUrl = "urn:uuid:51375e90-72df-5a62-b44c-4b674a374462"
* entry[=].resource = HL7v2Msg-NHSE-HbA1c-Patient
* entry[+].fullUrl = "urn:uuid:2b4dae17-e8c8-5ca6-9df9-6b60bc85d611"
* entry[=].resource = HL7v2Msg-NHSE-HbA1c-Specimen-1
* entry[+].fullUrl = "urn:uuid:ec84115c-88f7-5221-b13e-c1d0247bb40d"
* entry[=].resource = HL7v2Msg-NHSE-HbA1c-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:3f5f18cd-ffbc-5861-9976-1756c4887b0b"
* entry[=].resource = HL7v2Msg-NHSE-HbA1c-Observation-1
* entry[+].fullUrl = "urn:uuid:1d887601-4235-59a0-8581-e2e5b0d136c3"
* entry[=].resource = HL7v2Msg-NHSE-HbA1c-DiagnosticReport-1

Instance:   HL7v2Msg-NHSE-CRP-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - NHS England CRP - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "N82035"
* destination.endpoint = "http://www.acme.org/Endpoint/N82035"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "Y8J7D"
* source.endpoint = "http://www.acme.org/Endpoint/Y8J7D"
* focus[+].reference = "urn:uuid:5d1dca01-fd9b-5920-95c4-a3d432187e6e"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-NHSE-CRP-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - NHS England CRP - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383206"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier[+].system = "http://www.acme.org/patient/Y8J7D"
* identifier[+].value = "Y8J7D0742315"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* name.family = "LIVERPOOL"
* name.given = "Ned"
* birthDate = "1942-06-18"
* gender = #male
* address.line[+] = "20 Forthlin Road"
* address.city = "LIVERPOOL"
* address.postalCode = "L18 9TN"

Instance:   HL7v2Msg-NHSE-CRP-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - NHS England CRP - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/N82035"
* identifier[+].value = "SPC-REQ-20220307-000105"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N82035"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/Y8J7D"
* identifier[+].value = "SPC-Lab-20220307-007856"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #available
* type.text = "Venous blood specimen"
* subject.reference = "urn:uuid:02ef74c9-a078-507a-b085-b63cd50dd5a6"
* collection.collectedDateTime = "2022-03-07T11:42:00+00:00"
* receivedTime = "2022-03-07T14:58:00+00:00"

Instance:   HL7v2Msg-NHSE-CRP-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - NHS England CRP - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/N82035"
* identifier[+].value = "REQ-20220307-000142"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N82035"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/Y8J7D"
* identifier[+].value = "REP-20220308-004205"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #completed
* intent = #order
* code.coding[+] = http://snomed.info/sct#1001371000000100 "Serum CRP (C reactive protein) level"
* code.coding[+] = http://snomed.info/sct#1106741000000105 "CRP (C reactive protein) mass concentration in serum"
* subject.reference = "urn:uuid:02ef74c9-a078-507a-b085-b63cd50dd5a6"
* occurrenceDateTime = "2022-03-07T11:42:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C1008215"
* requester.display = "Dr Gale GASKELL"
* specimen[+].reference = "urn:uuid:c5fbb99c-f15a-5e47-8109-016ec40442b2"

Instance:   HL7v2Msg-NHSE-CRP-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England CRP - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1001371000000100 "Serum CRP (C reactive protein) level"
* code.coding[+] = http://snomed.info/sct#1106741000000105 "CRP (C reactive protein) mass concentration in serum"
* subject.reference = "urn:uuid:02ef74c9-a078-507a-b085-b63cd50dd5a6"
* effectiveDateTime = "2022-03-07T11:42:00+00:00"
* valueQuantity.value = 200
* valueQuantity.unit = "mg/L"
* referenceRange.text = "0-5"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H
* specimen.reference = "urn:uuid:c5fbb99c-f15a-5e47-8109-016ec40442b2"

Instance:   HL7v2Msg-NHSE-CRP-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - NHS England CRP - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/Y8J7D"
* identifier[+].value = "REP-20220308-004205"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* basedOn.reference = "urn:uuid:656c7a84-36d0-5227-b5ea-65070eaccb09"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#CH
* code.coding[+] = http://snomed.info/sct#1001371000000100 "Serum CRP (C reactive protein) level"
* code.coding[+] = http://snomed.info/sct#1106741000000105 "CRP (C reactive protein) mass concentration in serum"
* subject.reference = "urn:uuid:02ef74c9-a078-507a-b085-b63cd50dd5a6"
* effectiveDateTime = "2022-03-07T11:42:00+00:00"
* issued = "2022-03-08T12:09:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "Y8J7D"
* specimen[+].reference = "urn:uuid:c5fbb99c-f15a-5e47-8109-016ec40442b2"
* result[+].reference = "urn:uuid:fda2d6ca-2b66-5053-b3bd-eed37cdbd488"

Instance:   HL7v2Msg-NHSE-CRP
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - NHS England CRP"
Description: "Fictitious example: Laboratory Report (LAB-3) - NHS England CRP as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:f88fb82e-2bfc-53b4-8a2e-770cc4fd22d2"
* timestamp = "2022-03-08T12:09:00+00:00"
* entry[+].fullUrl = "urn:uuid:f0cfee60-c42c-5fac-950d-3b1bce12f5c2"
* entry[=].resource = HL7v2Msg-NHSE-CRP-MessageHeader
* entry[+].fullUrl = "urn:uuid:02ef74c9-a078-507a-b085-b63cd50dd5a6"
* entry[=].resource = HL7v2Msg-NHSE-CRP-Patient
* entry[+].fullUrl = "urn:uuid:c5fbb99c-f15a-5e47-8109-016ec40442b2"
* entry[=].resource = HL7v2Msg-NHSE-CRP-Specimen-1
* entry[+].fullUrl = "urn:uuid:656c7a84-36d0-5227-b5ea-65070eaccb09"
* entry[=].resource = HL7v2Msg-NHSE-CRP-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:fda2d6ca-2b66-5053-b3bd-eed37cdbd488"
* entry[=].resource = HL7v2Msg-NHSE-CRP-Observation-1
* entry[+].fullUrl = "urn:uuid:5d1dca01-fd9b-5920-95c4-a3d432187e6e"
* entry[=].resource = HL7v2Msg-NHSE-CRP-DiagnosticReport-1

Instance:   HL7v2Msg-NHSE-LFT-UandE-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "N82035"
* destination.endpoint = "http://www.acme.org/Endpoint/N82035"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "Y8J7D"
* source.endpoint = "http://www.acme.org/Endpoint/Y8J7D"
* focus[+].reference = "urn:uuid:fd9ae8d4-d024-554a-b2d0-0ff7e3deeb51"
* focus[=].type = #DiagnosticReport
* focus[+].reference = "urn:uuid:b9f09109-0a5a-5814-8c36-d5e29a47ab5b"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-NHSE-LFT-UandE-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383206"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier[+].system = "http://www.acme.org/patient/Y8J7D"
* identifier[+].value = "Y8J7D0742315"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* name.family = "LIVERPOOL"
* name.given = "Ned"
* birthDate = "1942-06-18"
* gender = #male
* address.line[+] = "20 Forthlin Road"
* address.city = "LIVERPOOL"
* address.postalCode = "L18 9TN"

Instance:   HL7v2Msg-NHSE-LFT-UandE-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/N82035"
* identifier[+].value = "SPC-REQ-20220307-000014"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N82035"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/Y8J7D"
* identifier[+].value = "SPC-Lab-20220307-007856"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #available
* type.text = "Venous blood specimen"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* collection.collectedDateTime = "2022-03-07T10:02:00+00:00"
* receivedTime = "2022-03-07T14:54:00+00:00"

Instance:   HL7v2Msg-NHSE-LFT-UandE-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/N82035"
* identifier[+].value = "REQ-20220307-000046-001"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N82035"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/Y8J7D"
* identifier[+].value = "REP-20220308-008902"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #completed
* intent = #order
* code.coding[+] = http://snomed.info/sct#1031081000000108 "Liver function tests"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* occurrenceDateTime = "2022-03-07T10:02:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C1008215"
* requester.display = "Dr Gale GASKELL"
* specimen[+].reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"

Instance:   HL7v2Msg-NHSE-LFT-UandE-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#997591000000109 "Serum total bilirubin level"
* code.coding[+] = http://snomed.info/sct#1107221000000109 "Total bilirubin substance concentration in serum"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* effectiveDateTime = "2022-03-07T10:02:00+00:00"
* valueQuantity.value = 6
* valueQuantity.unit = "umol/L"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #umol/L
* referenceRange.text = "<21"
* specimen.reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"

Instance:   HL7v2Msg-NHSE-LFT-UandE-Observation-2
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - Observation 2"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1000821000000103 "Serum albumin level"
* code.coding[+] = http://snomed.info/sct#1105861000000106 "Albumin mass concentration in serum"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* effectiveDateTime = "2022-03-07T10:02:00+00:00"
* valueQuantity.value = 47
* valueQuantity.unit = "g/L"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #g/L
* referenceRange.text = "35-50"
* specimen.reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"

Instance:   HL7v2Msg-NHSE-LFT-UandE-Observation-3
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - Observation 3"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1000621000000104 "Serum alkaline phosphatase level"
* code.coding[+] = http://snomed.info/sct#1106051000000106 "Alkaline phosphatase enzyme activity in serum"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* effectiveDateTime = "2022-03-07T10:02:00+00:00"
* valueQuantity.value = 96
* valueQuantity.unit = "iu/L"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #[iU]/L
* referenceRange.text = "30-130"
* specimen.reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"

Instance:   HL7v2Msg-NHSE-LFT-UandE-Observation-4
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - Observation 4"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1018251000000107 "Serum alanine aminotransferase level"
* code.coding[+] = http://snomed.info/sct#1106081000000100 "Alanine aminotransferase enzyme activity in serum"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* effectiveDateTime = "2022-03-07T10:02:00+00:00"
* valueQuantity.value = 15
* valueQuantity.unit = "iu/L"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #[iU]/L
* referenceRange.text = "<40"
* specimen.reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"

Instance:   HL7v2Msg-NHSE-LFT-UandE-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/Y8J7D"
* identifier[+].value = "REP-20220308-008902"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* basedOn.reference = "urn:uuid:cf7f23e4-778c-5c89-a160-ff7b6df40c36"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#CH
* code.coding[+] = http://snomed.info/sct#1031081000000108 "Liver function tests"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* effectiveDateTime = "2022-03-07T10:02:00+00:00"
* issued = "2022-03-08T14:23:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "Y8J7D"
* specimen[+].reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"
* result[+].reference = "urn:uuid:20151d8d-5901-5c45-bc69-312fc8f07c65"
* result[+].reference = "urn:uuid:e697e681-b763-5602-b12b-5755e2c8b616"
* result[+].reference = "urn:uuid:037d4275-f141-550f-a21b-ebeab3fb6b5d"
* result[+].reference = "urn:uuid:21d73dd6-4bfe-51ec-a43f-07b4fd0e5cff"

Instance:   HL7v2Msg-NHSE-LFT-UandE-ServiceRequest-2
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - ServiceRequest 2"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/N82035"
* identifier[+].value = "REQ-20220307-000046-002"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N82035"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/Y8J7D"
* identifier[+].value = "REP-20220308-008902"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #completed
* intent = #order
* code.coding[+] = http://snomed.info/sct#1000971000000107 "Urea and electrolytes level"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* occurrenceDateTime = "2022-03-07T10:02:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C1008215"
* requester.display = "Dr Gale GASKELL"
* specimen[+].reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"

Instance:   HL7v2Msg-NHSE-LFT-UandE-Observation-5
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - Observation 5"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1000951000000103 "Serum urea level"
* code.coding[+] = http://snomed.info/sct#1110281000000107 "Urea substance concentration in serum"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* effectiveDateTime = "2022-03-07T10:02:00+00:00"
* valueQuantity.value = 3.7
* valueQuantity.unit = "mmol/L"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mmol/L
* referenceRange.text = "2.5-7.8"
* specimen.reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"

Instance:   HL7v2Msg-NHSE-LFT-UandE-Observation-6
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - Observation 6"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1000661000000107 "Serum sodium level"
* code.coding[+] = http://snomed.info/sct#1107871000000107 "Sodium substance concentration in serum"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* effectiveDateTime = "2022-03-07T10:02:00+00:00"
* valueQuantity.value = 139
* valueQuantity.unit = "mmol/L"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mmol/L
* referenceRange.text = "133-146"
* specimen.reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"

Instance:   HL7v2Msg-NHSE-LFT-UandE-Observation-7
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - Observation 7"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1000651000000109 "Serum potassium level"
* code.coding[+] = http://snomed.info/sct#1107761000000109 "Potassium substance concentration in serum"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* effectiveDateTime = "2022-03-07T10:02:00+00:00"
* valueQuantity.value = 4.7
* valueQuantity.unit = "mmol/L"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mmol/L
* referenceRange.text = "3.5-5.3"
* specimen.reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"

Instance:   HL7v2Msg-NHSE-LFT-UandE-Observation-8
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - Observation 8"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1000731000000107 "Serum creatinine level"
* code.coding[+] = http://snomed.info/sct#1107001000000108 "Creatinine substance concentration in serum"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* effectiveDateTime = "2022-03-07T10:02:00+00:00"
* valueQuantity.value = 73
* valueQuantity.unit = "umol/L"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #umol/L
* referenceRange.text = "59-104"
* specimen.reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"

Instance:   HL7v2Msg-NHSE-LFT-UandE-Observation-9
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - Observation 9"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1011481000000105 "eGFR (estimated glomerular filtration rate) using creatinine Chronic Kidney Disease Epidemiology Collaboration equation per 1.73 square metres"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* effectiveDateTime = "2022-03-07T10:02:00+00:00"
* valueQuantity.value = 100
* valueQuantity.unit = "mL/min/1.73m2"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mL/min/((173/100).m2)
* specimen.reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"
* note[+].text = "Calculated eGFR is not valid in children or pregnancy.
Less accurate with acute change in creatinine (AKI).
Caution with high or low muscle mass or amputation.
Avoid blood sampling within 12 hours of eating meat.
Ethnicity factor comment removed Dec21 NG203.
"

Instance:   HL7v2Msg-NHSE-LFT-UandE-DiagnosticReport-2
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - NHS England LFT and U&E - DiagnosticReport 2"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/Y8J7D"
* identifier[+].value = "REP-20220308-008902"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* basedOn.reference = "urn:uuid:fa249618-7284-5e2f-85de-ac6a3659d7e2"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#CH
* code.coding[+] = http://snomed.info/sct#1000971000000107 "Urea and electrolytes level"
* subject.reference = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* effectiveDateTime = "2022-03-07T10:02:00+00:00"
* issued = "2022-03-08T14:23:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "Y8J7D"
* specimen[+].reference = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"
* result[+].reference = "urn:uuid:7361d00c-2f75-5377-9b8c-2b93695bf9e9"
* result[+].reference = "urn:uuid:6da88865-649c-513d-8911-b7ff38acf99e"
* result[+].reference = "urn:uuid:3f0f3b38-eb52-5457-9c84-2c894e39da1d"
* result[+].reference = "urn:uuid:db7ed695-76d5-5a9f-87f4-71e04ec5fdd1"
* result[+].reference = "urn:uuid:0439317a-a859-56fe-a18c-c1e484b76aef"

Instance:   HL7v2Msg-NHSE-LFT-UandE
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - NHS England LFT and U&E"
Description: "Fictitious example: Laboratory Report (LAB-3) - NHS England LFT and U&E as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:b66992f0-b59c-551d-a3e7-048e0433fcd0"
* timestamp = "2022-03-08T12:09:00+00:00"
* entry[+].fullUrl = "urn:uuid:72da5459-9b6b-5e1b-b9cd-4b4f439c4aec"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-MessageHeader
* entry[+].fullUrl = "urn:uuid:773d6c85-9d13-5dc6-8cc1-48979523d1d8"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-Patient
* entry[+].fullUrl = "urn:uuid:e8037648-e389-5b68-8296-8b9855cab4cd"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-Specimen-1
* entry[+].fullUrl = "urn:uuid:cf7f23e4-778c-5c89-a160-ff7b6df40c36"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:20151d8d-5901-5c45-bc69-312fc8f07c65"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-Observation-1
* entry[+].fullUrl = "urn:uuid:e697e681-b763-5602-b12b-5755e2c8b616"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-Observation-2
* entry[+].fullUrl = "urn:uuid:037d4275-f141-550f-a21b-ebeab3fb6b5d"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-Observation-3
* entry[+].fullUrl = "urn:uuid:21d73dd6-4bfe-51ec-a43f-07b4fd0e5cff"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-Observation-4
* entry[+].fullUrl = "urn:uuid:fd9ae8d4-d024-554a-b2d0-0ff7e3deeb51"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-DiagnosticReport-1
* entry[+].fullUrl = "urn:uuid:fa249618-7284-5e2f-85de-ac6a3659d7e2"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-ServiceRequest-2
* entry[+].fullUrl = "urn:uuid:7361d00c-2f75-5377-9b8c-2b93695bf9e9"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-Observation-5
* entry[+].fullUrl = "urn:uuid:6da88865-649c-513d-8911-b7ff38acf99e"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-Observation-6
* entry[+].fullUrl = "urn:uuid:3f0f3b38-eb52-5457-9c84-2c894e39da1d"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-Observation-7
* entry[+].fullUrl = "urn:uuid:db7ed695-76d5-5a9f-87f4-71e04ec5fdd1"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-Observation-8
* entry[+].fullUrl = "urn:uuid:0439317a-a859-56fe-a18c-c1e484b76aef"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-Observation-9
* entry[+].fullUrl = "urn:uuid:b9f09109-0a5a-5814-8c36-d5e29a47ab5b"
* entry[=].resource = HL7v2Msg-NHSE-LFT-UandE-DiagnosticReport-2

Instance:   HL7v2Msg-NHSE-Lipids-HbA1c-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - NHS England Lipids and HbA1c - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "N82035"
* destination.endpoint = "http://www.acme.org/Endpoint/N82035"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "Y8J7D"
* source.endpoint = "http://www.acme.org/Endpoint/Y8J7D"
* focus[+].reference = "urn:uuid:02247f46-81ab-570b-ad36-1210657e5157"
* focus[=].type = #DiagnosticReport
* focus[+].reference = "urn:uuid:3eaf9d90-c204-5a15-80ce-d5efafd86882"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-NHSE-Lipids-HbA1c-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - NHS England Lipids and HbA1c - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383206"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier[+].system = "http://www.acme.org/patient/Y8J7D"
* identifier[+].value = "Y8J7D0742315"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* name.family = "LIVERPOOL"
* name.given = "Ned"
* birthDate = "1942-06-18"
* gender = #male
* address.line[+] = "20 Forthlin Road"
* address.city = "LIVERPOOL"
* address.postalCode = "L18 9TN"

Instance:   HL7v2Msg-NHSE-Lipids-HbA1c-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - NHS England Lipids and HbA1c - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/N82035"
* identifier[+].value = "SPC-REQ-20220705-000004"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N82035"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/Y8J7D"
* identifier[+].value = "SPC-Lab-20220705-006215"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #available
* type.text = "Venous blood specimen"
* subject.reference = "urn:uuid:7a3aa601-1d95-5a29-8bac-510d678f5538"
* collection.collectedDateTime = "2022-07-05T08:52:00+00:00"
* receivedTime = "2022-07-05T15:17:00+00:00"

Instance:   HL7v2Msg-NHSE-Lipids-HbA1c-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - NHS England Lipids and HbA1c - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/N82035"
* identifier[+].value = "REQ-20220704-000027-001"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N82035"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/Y8J7D"
* identifier[+].value = "REP-20220706-002378"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #completed
* intent = #order
* code.coding[+] = http://snomed.info/sct#1005661000000103 "Serum lipids level"
* subject.reference = "urn:uuid:7a3aa601-1d95-5a29-8bac-510d678f5538"
* occurrenceDateTime = "2022-07-05T08:52:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C1008215"
* requester.display = "Dr Gale GASKELL"
* specimen[+].reference = "urn:uuid:df981f66-061a-569d-b0c0-8574c822e5d0"

Instance:   HL7v2Msg-NHSE-Lipids-HbA1c-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England Lipids and HbA1c - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1005671000000105 "Serum cholesterol level"
* code.coding[+] = http://snomed.info/sct#1106541000000101 "Cholesterol substance concentration in serum"
* subject.reference = "urn:uuid:7a3aa601-1d95-5a29-8bac-510d678f5538"
* effectiveDateTime = "2022-07-05T08:52:00+00:00"
* valueQuantity.value = 6.1
* valueQuantity.unit = "mmol/L"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mmol/L
* specimen.reference = "urn:uuid:df981f66-061a-569d-b0c0-8574c822e5d0"

Instance:   HL7v2Msg-NHSE-Lipids-HbA1c-Observation-2
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England Lipids and HbA1c - Observation 2"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1005681000000107 "Serum high density lipoprotein cholesterol level"
* code.coding[+] = http://snomed.info/sct#1107681000000108 "HDL (high density lipoprotein) cholesterol substance concentration in serum"
* subject.reference = "urn:uuid:7a3aa601-1d95-5a29-8bac-510d678f5538"
* effectiveDateTime = "2022-07-05T08:52:00+00:00"
* valueQuantity.value = 1.44
* valueQuantity.unit = "mmol/L"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mmol/L
* specimen.reference = "urn:uuid:df981f66-061a-569d-b0c0-8574c822e5d0"

Instance:   HL7v2Msg-NHSE-Lipids-HbA1c-Observation-3
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England Lipids and HbA1c - Observation 3"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1015681000000109 "Serum cholesterol/high density lipoprotein ratio"
* code.coding[+] = http://snomed.info/sct#1107741000000108 "HDL (high density lipoprotein) cholesterol/total cholesterol ratio in serum"
* subject.reference = "urn:uuid:7a3aa601-1d95-5a29-8bac-510d678f5538"
* effectiveDateTime = "2022-07-05T08:52:00+00:00"
* valueQuantity.value = 4.2
* valueQuantity.unit = "1/1"
* specimen.reference = "urn:uuid:df981f66-061a-569d-b0c0-8574c822e5d0"

Instance:   HL7v2Msg-NHSE-Lipids-HbA1c-Observation-4
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England Lipids and HbA1c - Observation 4"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1006191000000106 "Serum non high density lipoprotein cholesterol level"
* code.coding[+] = http://snomed.info/sct#12021000237106 "Non-HDL (high density lipoprotein) cholesterol molar concentration in serum"
* subject.reference = "urn:uuid:7a3aa601-1d95-5a29-8bac-510d678f5538"
* effectiveDateTime = "2022-07-05T08:52:00+00:00"
* valueQuantity.value = 4.7
* valueQuantity.unit = "mmol/L"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mmol/L
* specimen.reference = "urn:uuid:df981f66-061a-569d-b0c0-8574c822e5d0"

Instance:   HL7v2Msg-NHSE-Lipids-HbA1c-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - NHS England Lipids and HbA1c - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/Y8J7D"
* identifier[+].value = "REP-20220706-002378"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* basedOn.reference = "urn:uuid:c6d58731-d961-5bb6-81d8-338227728339"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#CH
* code.coding[+] = http://snomed.info/sct#1005661000000103 "Serum lipids level"
* subject.reference = "urn:uuid:7a3aa601-1d95-5a29-8bac-510d678f5538"
* effectiveDateTime = "2022-07-05T08:52:00+00:00"
* issued = "2022-07-06T10:49:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "Y8J7D"
* specimen[+].reference = "urn:uuid:df981f66-061a-569d-b0c0-8574c822e5d0"
* result[+].reference = "urn:uuid:87ddd916-2f81-54b9-acf0-c08e3fe4fc1b"
* result[+].reference = "urn:uuid:2a03dc13-84b2-50e7-9102-12fddec7dc16"
* result[+].reference = "urn:uuid:deb52e26-6a50-5a33-af7a-c6960a7f8a0c"
* result[+].reference = "urn:uuid:6c12dd0a-bbf3-574a-a773-4b8e116da653"

Instance:   HL7v2Msg-NHSE-Lipids-HbA1c-ServiceRequest-2
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - NHS England Lipids and HbA1c - ServiceRequest 2"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/N82035"
* identifier[+].value = "REQ-20220704-000027-002"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N82035"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/Y8J7D"
* identifier[+].value = "REP-20220706-002378"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #completed
* intent = #order
* code.coding[+] = http://snomed.info/sct#999791000000106 "Haemoglobin A1c level - International Federation of Clinical Chemistry and Laboratory Medicine standardised"
* subject.reference = "urn:uuid:7a3aa601-1d95-5a29-8bac-510d678f5538"
* occurrenceDateTime = "2022-07-05T08:52:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C1008215"
* requester.display = "Dr Gale GASKELL"
* specimen[+].reference = "urn:uuid:df981f66-061a-569d-b0c0-8574c822e5d0"

Instance:   HL7v2Msg-NHSE-Lipids-HbA1c-Observation-5
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England Lipids and HbA1c - Observation 5"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#999791000000106 "Haemoglobin A1c level - International Federation of Clinical Chemistry and Laboratory Medicine standardised"
* subject.reference = "urn:uuid:7a3aa601-1d95-5a29-8bac-510d678f5538"
* effectiveDateTime = "2022-07-05T08:52:00+00:00"
* valueQuantity.value = 38
* valueQuantity.unit = "mmol/mol"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mmol/mol
* specimen.reference = "urn:uuid:df981f66-061a-569d-b0c0-8574c822e5d0"

Instance:   HL7v2Msg-NHSE-Lipids-HbA1c-DiagnosticReport-2
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - NHS England Lipids and HbA1c - DiagnosticReport 2"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/Y8J7D"
* identifier[+].value = "REP-20220706-002378"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* basedOn.reference = "urn:uuid:700215ed-deda-5b71-bc57-e3670e8421ec"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#CH
* code.coding[+] = http://snomed.info/sct#999791000000106 "Haemoglobin A1c level - International Federation of Clinical Chemistry and Laboratory Medicine standardised"
* subject.reference = "urn:uuid:7a3aa601-1d95-5a29-8bac-510d678f5538"
* effectiveDateTime = "2022-07-05T08:52:00+00:00"
* issued = "2022-07-06T10:49:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "Y8J7D"
* specimen[+].reference = "urn:uuid:df981f66-061a-569d-b0c0-8574c822e5d0"
* result[+].reference = "urn:uuid:3e325ba8-720b-5206-842e-572661cf4fb2"

Instance:   HL7v2Msg-NHSE-Lipids-HbA1c
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - NHS England Lipids and HbA1c"
Description: "Fictitious example: Laboratory Report (LAB-3) - NHS England Lipids and HbA1c as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:ab09177f-8a17-53fd-b0eb-13c53c54ce60"
* timestamp = "2022-03-08T12:09:00+00:00"
* entry[+].fullUrl = "urn:uuid:790aa403-15c2-57c8-90eb-e0489959b777"
* entry[=].resource = HL7v2Msg-NHSE-Lipids-HbA1c-MessageHeader
* entry[+].fullUrl = "urn:uuid:7a3aa601-1d95-5a29-8bac-510d678f5538"
* entry[=].resource = HL7v2Msg-NHSE-Lipids-HbA1c-Patient
* entry[+].fullUrl = "urn:uuid:df981f66-061a-569d-b0c0-8574c822e5d0"
* entry[=].resource = HL7v2Msg-NHSE-Lipids-HbA1c-Specimen-1
* entry[+].fullUrl = "urn:uuid:c6d58731-d961-5bb6-81d8-338227728339"
* entry[=].resource = HL7v2Msg-NHSE-Lipids-HbA1c-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:87ddd916-2f81-54b9-acf0-c08e3fe4fc1b"
* entry[=].resource = HL7v2Msg-NHSE-Lipids-HbA1c-Observation-1
* entry[+].fullUrl = "urn:uuid:2a03dc13-84b2-50e7-9102-12fddec7dc16"
* entry[=].resource = HL7v2Msg-NHSE-Lipids-HbA1c-Observation-2
* entry[+].fullUrl = "urn:uuid:deb52e26-6a50-5a33-af7a-c6960a7f8a0c"
* entry[=].resource = HL7v2Msg-NHSE-Lipids-HbA1c-Observation-3
* entry[+].fullUrl = "urn:uuid:6c12dd0a-bbf3-574a-a773-4b8e116da653"
* entry[=].resource = HL7v2Msg-NHSE-Lipids-HbA1c-Observation-4
* entry[+].fullUrl = "urn:uuid:02247f46-81ab-570b-ad36-1210657e5157"
* entry[=].resource = HL7v2Msg-NHSE-Lipids-HbA1c-DiagnosticReport-1
* entry[+].fullUrl = "urn:uuid:700215ed-deda-5b71-bc57-e3670e8421ec"
* entry[=].resource = HL7v2Msg-NHSE-Lipids-HbA1c-ServiceRequest-2
* entry[+].fullUrl = "urn:uuid:3e325ba8-720b-5206-842e-572661cf4fb2"
* entry[=].resource = HL7v2Msg-NHSE-Lipids-HbA1c-Observation-5
* entry[+].fullUrl = "urn:uuid:3eaf9d90-c204-5a15-80ce-d5efafd86882"
* entry[=].resource = HL7v2Msg-NHSE-Lipids-HbA1c-DiagnosticReport-2

Instance:   HL7v2Msg-NHSE-FBC-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - NHS England FBC - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "N81027"
* destination.endpoint = "http://www.acme.org/Endpoint/N81027"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "Y8J7D"
* source.endpoint = "http://www.acme.org/Endpoint/Y8J7D"
* focus[+].reference = "urn:uuid:1861e748-fc23-59da-afb6-af261ba75b04"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-NHSE-FBC-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383281"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier[+].system = "http://www.acme.org/patient/Y8J7D"
* identifier[+].value = "Y8J7D0482113"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* name.family = "CONGLETON"
* name.given = "Margaery"
* birthDate = "1982-02-11"
* gender = #female
* address.line[+] = "Town Hall"
* address.line[+] = "7 High Street"
* address.city = "CONGLETON"
* address.postalCode = "CW12 1BN"

Instance:   HL7v2Msg-NHSE-FBC-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/N81027"
* identifier[+].value = "SPC-REQ-20220208-000016"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N81027"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/Y8J7D"
* identifier[+].value = "SPC-Lab-20220208-001397"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #available
* type.text = "Venous blood specimen"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* collection.collectedDateTime = "2022-02-08T10:23:00+00:00"
* receivedTime = "2022-02-08T16:03:00+00:00"

Instance:   HL7v2Msg-NHSE-FBC-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - NHS England FBC - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/N81027"
* identifier[+].value = "REQ-20220129-000012"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N81027"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/Y8J7D"
* identifier[+].value = "REP-20220209-001369"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #completed
* intent = #order
* code.coding[+] = http://snomed.info/sct#1022441000000101 "FBC - full blood count"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* occurrenceDateTime = "2022-02-08T10:23:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C1008215"
* requester.display = "Dr Gale GASKELL"
* specimen[+].reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022541000000102 "Total white cell count"
* code.coding[+] = http://snomed.info/sct#1110441000000100 "White blood cell count in blood"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 4.76
* valueQuantity.unit = "10*9/L"
* referenceRange.text = "4-11"
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-2
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 2"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022451000000103 "Red blood cell count"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 3.63
* valueQuantity.unit = "10*12/L"
* referenceRange.text = "4.1-5.1"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-3
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 3"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022431000000105 "Haemoglobin estimation"
* code.coding[+] = http://snomed.info/sct#1107511000000100 "Haemoglobin mass concentration in blood"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 108
* valueQuantity.unit = "g/L"
* referenceRange.text = "120-150"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-4
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 4"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022291000000105 "Haematocrit"
* code.coding[+] = http://snomed.info/sct#1111571000000101 "Haematocrit volume fraction of blood"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 0.352
* valueQuantity.unit = "l/l"
* referenceRange.text = "0.36-0.46"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-5
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 5"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022491000000106 "MCV - Mean corpuscular volume"
* code.coding[+] = http://snomed.info/sct#1491000237105 "Erythrocytes MCV (mean corpuscular volume) in blood"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 97
* valueQuantity.unit = "fL"
* referenceRange.text = "80-100"
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-6
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 6"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022471000000107 "MCH - Mean corpuscular haemoglobin"
* code.coding[+] = http://snomed.info/sct#1022471000000107 "MCH - Mean corpuscular haemoglobin"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 29.8
* valueQuantity.unit = "pg"
* referenceRange.text = "27-32"
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-7
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 7"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022481000000109 "MCHC - Mean corpuscular haemoglobin concentration"
* code.coding[+] = http://snomed.info/sct#1022481000000109 "MCHC - Mean corpuscular haemoglobin concentration"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 307
* valueQuantity.unit = "g/L"
* referenceRange.text = "315-345"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-8
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 8"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022651000000100 "Platelet count"
* code.coding[+] = http://snomed.info/sct#1108041000000107 "Platelet count in blood"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 143
* valueQuantity.unit = "10*9/L"
* referenceRange.text = "140-400"
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-9
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 9"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022551000000104 "Neutrophil count"
* code.coding[+] = http://snomed.info/sct#1108071000000101 "Neutrophil count in blood"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 2.66
* valueQuantity.unit = "10*9/L"
* referenceRange.text = "2-7"
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-10
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 10"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022581000000105 "Lymphocyte count"
* code.coding[+] = http://snomed.info/sct#67541000237108 "Lymphocyte count in blood"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 0.7
* valueQuantity.unit = "10*9/L"
* referenceRange.text = "1-3"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-11
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 11"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022591000000107 "Monocyte count"
* code.coding[+] = http://snomed.info/sct#1107991000000100 "Monocyte count in blood"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 1.3
* valueQuantity.unit = "10*9/L"
* referenceRange.text = "0.2-1"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-12
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 12"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022561000000101 "Eosinophil count"
* code.coding[+] = http://snomed.info/sct#1107391000000104 "Eosinophil count in blood"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 0.07
* valueQuantity.unit = "10*9/L"
* referenceRange.text = "0.02-0.5"
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-Observation-13
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England FBC - Observation 13"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1022571000000108 "Basophil count"
* code.coding[+] = http://snomed.info/sct#1106091000000103 "Basophil count in blood"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* valueQuantity.value = 0.03
* valueQuantity.unit = "10*9/L"
* referenceRange.text = "0.01-0.1"
* specimen.reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"

Instance:   HL7v2Msg-NHSE-FBC-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - NHS England FBC - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/Y8J7D"
* identifier[+].value = "REP-20220209-001369"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* basedOn.reference = "urn:uuid:0cd51dda-64c9-535f-9af3-49a9ba688387"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#HM
* code.coding[+] = http://snomed.info/sct#1022441000000101 "FBC - full blood count"
* subject.reference = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* effectiveDateTime = "2022-02-08T10:23:00+00:00"
* issued = "2022-02-09T11:17:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "Y8J7D"
* specimen[+].reference = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"
* result[+].reference = "urn:uuid:b991b175-d7dc-5407-9ffb-cced5ccb476d"
* result[+].reference = "urn:uuid:41a81087-220a-53b4-8132-6e64656a0cea"
* result[+].reference = "urn:uuid:19ade5dd-1db2-5831-971a-d1bb668fb041"
* result[+].reference = "urn:uuid:d05bf9db-d722-5bb9-822a-df9f3a4e8ef6"
* result[+].reference = "urn:uuid:078d01bd-128c-5696-ba49-a36f68386f40"
* result[+].reference = "urn:uuid:7d0eb301-17ec-585e-833e-0b6c1539d1f3"
* result[+].reference = "urn:uuid:8b40dc54-1a57-5e49-ba28-14f58f25d43b"
* result[+].reference = "urn:uuid:135939a7-94ea-5753-8a42-42d99453df83"
* result[+].reference = "urn:uuid:5ee4d058-06e8-525f-8ffc-5cc2824bb581"
* result[+].reference = "urn:uuid:8be61360-85a3-5090-9b2e-146ad928700a"
* result[+].reference = "urn:uuid:b619a133-fec3-5a25-be8f-fb4d959f38f7"
* result[+].reference = "urn:uuid:1e44034f-8dad-5e6d-add6-2be5214e06a5"
* result[+].reference = "urn:uuid:45fef1cd-0ea8-51cb-9e1b-bc90d0f9cdd9"

Instance:   HL7v2Msg-NHSE-FBC
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - NHS England FBC"
Description: "Fictitious example: Laboratory Report (LAB-3) - NHS England FBC as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:309d69e9-e462-5e85-b07e-4f2dc988d32d"
* timestamp = "2022-02-09T11:17:00+00:00"
* entry[+].fullUrl = "urn:uuid:038b318b-84e6-5c7c-9f34-867903306504"
* entry[=].resource = HL7v2Msg-NHSE-FBC-MessageHeader
* entry[+].fullUrl = "urn:uuid:40840042-5c08-5323-8892-ce1ab0ff820a"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Patient
* entry[+].fullUrl = "urn:uuid:4e8fa467-da3c-551c-9e9e-7c3325c72f1b"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Specimen-1
* entry[+].fullUrl = "urn:uuid:0cd51dda-64c9-535f-9af3-49a9ba688387"
* entry[=].resource = HL7v2Msg-NHSE-FBC-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:b991b175-d7dc-5407-9ffb-cced5ccb476d"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-1
* entry[+].fullUrl = "urn:uuid:41a81087-220a-53b4-8132-6e64656a0cea"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-2
* entry[+].fullUrl = "urn:uuid:19ade5dd-1db2-5831-971a-d1bb668fb041"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-3
* entry[+].fullUrl = "urn:uuid:d05bf9db-d722-5bb9-822a-df9f3a4e8ef6"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-4
* entry[+].fullUrl = "urn:uuid:078d01bd-128c-5696-ba49-a36f68386f40"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-5
* entry[+].fullUrl = "urn:uuid:7d0eb301-17ec-585e-833e-0b6c1539d1f3"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-6
* entry[+].fullUrl = "urn:uuid:8b40dc54-1a57-5e49-ba28-14f58f25d43b"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-7
* entry[+].fullUrl = "urn:uuid:135939a7-94ea-5753-8a42-42d99453df83"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-8
* entry[+].fullUrl = "urn:uuid:5ee4d058-06e8-525f-8ffc-5cc2824bb581"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-9
* entry[+].fullUrl = "urn:uuid:8be61360-85a3-5090-9b2e-146ad928700a"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-10
* entry[+].fullUrl = "urn:uuid:b619a133-fec3-5a25-be8f-fb4d959f38f7"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-11
* entry[+].fullUrl = "urn:uuid:1e44034f-8dad-5e6d-add6-2be5214e06a5"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-12
* entry[+].fullUrl = "urn:uuid:45fef1cd-0ea8-51cb-9e1b-bc90d0f9cdd9"
* entry[=].resource = HL7v2Msg-NHSE-FBC-Observation-13
* entry[+].fullUrl = "urn:uuid:1861e748-fc23-59da-afb6-af261ba75b04"
* entry[=].resource = HL7v2Msg-NHSE-FBC-DiagnosticReport-1

Instance:   HL7v2Msg-NHSE-HBsAg-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - NHS England HBsAg - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "N81027"
* destination.endpoint = "http://www.acme.org/Endpoint/N81027"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "Y8J7D"
* source.endpoint = "http://www.acme.org/Endpoint/Y8J7D"
* focus[+].reference = "urn:uuid:92341675-2f84-54dd-988b-faf862929f69"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-NHSE-HBsAg-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - NHS England HBsAg - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383281"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier[+].system = "http://www.acme.org/patient/Y8J7D"
* identifier[+].value = "Y8J7D0482113"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* name.family = "CONGLETON"
* name.given = "Margaery"
* birthDate = "1982-02-11"
* gender = #female
* address.line[+] = "Town Hall"
* address.line[+] = "7 High Street"
* address.city = "CONGLETON"
* address.postalCode = "CW12 1BN"

Instance:   HL7v2Msg-NHSE-HBsAg-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - NHS England HBsAg - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/N81027"
* identifier[+].value = "SPC-REQ-20220307-000051"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N81027"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/Y8J7D"
* identifier[+].value = "SPC-Lab-20220307-006130"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #available
* type.text = "Venous blood specimen"
* subject.reference = "urn:uuid:b6bfe811-d89b-5d9b-b89d-dc889461f450"
* collection.collectedDateTime = "2022-03-07T13:21:00+00:00"
* receivedTime = "2022-03-07T15:34:00+00:00"

Instance:   HL7v2Msg-NHSE-HBsAg-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - NHS England HBsAg - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/N81027"
* identifier[+].value = "REQ-20220307-000004"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N81027"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/Y8J7D"
* identifier[+].value = "REP-20220311-003927"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #completed
* intent = #order
* code.coding[+] = http://snomed.info/sct#1014211000000100 "Hepatitis B surface antigen level"
* code.coding[+] = http://snomed.info/sct#51061000237103 "Hepatitis B surface antigen in serum qualitative result"
* subject.reference = "urn:uuid:b6bfe811-d89b-5d9b-b89d-dc889461f450"
* occurrenceDateTime = "2022-03-07T13:21:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C1008215"
* requester.display = "Dr Gale GASKELL"
* specimen[+].reference = "urn:uuid:690ab67f-2029-5a5a-b2ff-0e9a47f28495"

Instance:   HL7v2Msg-NHSE-HBsAg-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England HBsAg - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1014211000000100 "Hepatitis B surface antigen level"
* code.coding[+] = http://snomed.info/sct#51061000237103 "Hepatitis B surface antigen in serum qualitative result"
* subject.reference = "urn:uuid:b6bfe811-d89b-5d9b-b89d-dc889461f450"
* effectiveDateTime = "2022-03-07T13:21:00+00:00"
* valueString = "Negative"
* specimen.reference = "urn:uuid:690ab67f-2029-5a5a-b2ff-0e9a47f28495"

Instance:   HL7v2Msg-NHSE-HBsAg-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - NHS England HBsAg - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/Y8J7D"
* identifier[+].value = "REP-20220311-003927"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* basedOn.reference = "urn:uuid:50081a17-cc59-5dd5-ade2-248104e391f7"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#SR
* code.coding[+] = http://snomed.info/sct#1014211000000100 "Hepatitis B surface antigen level"
* code.coding[+] = http://snomed.info/sct#51061000237103 "Hepatitis B surface antigen in serum qualitative result"
* subject.reference = "urn:uuid:b6bfe811-d89b-5d9b-b89d-dc889461f450"
* effectiveDateTime = "2022-03-07T13:21:00+00:00"
* issued = "2022-03-11T10:06:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "Y8J7D"
* specimen[+].reference = "urn:uuid:690ab67f-2029-5a5a-b2ff-0e9a47f28495"
* result[+].reference = "urn:uuid:8f9f5107-af5b-5356-ba0f-d5b7e7f256bf"

Instance:   HL7v2Msg-NHSE-HBsAg
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - NHS England HBsAg"
Description: "Fictitious example: Laboratory Report (LAB-3) - NHS England HBsAg as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:acd3d596-835e-5425-a6d0-4a556dc0ee48"
* timestamp = "2022-03-08T12:09:00+00:00"
* entry[+].fullUrl = "urn:uuid:60b6233a-23df-5ca8-b764-453cc694daa3"
* entry[=].resource = HL7v2Msg-NHSE-HBsAg-MessageHeader
* entry[+].fullUrl = "urn:uuid:b6bfe811-d89b-5d9b-b89d-dc889461f450"
* entry[=].resource = HL7v2Msg-NHSE-HBsAg-Patient
* entry[+].fullUrl = "urn:uuid:690ab67f-2029-5a5a-b2ff-0e9a47f28495"
* entry[=].resource = HL7v2Msg-NHSE-HBsAg-Specimen-1
* entry[+].fullUrl = "urn:uuid:50081a17-cc59-5dd5-ade2-248104e391f7"
* entry[=].resource = HL7v2Msg-NHSE-HBsAg-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:8f9f5107-af5b-5356-ba0f-d5b7e7f256bf"
* entry[=].resource = HL7v2Msg-NHSE-HBsAg-Observation-1
* entry[+].fullUrl = "urn:uuid:92341675-2f84-54dd-988b-faf862929f69"
* entry[=].resource = HL7v2Msg-NHSE-HBsAg-DiagnosticReport-1

Instance:   HL7v2Msg-NHSE-HPV-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - NHS England HPV - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "N81027"
* destination.endpoint = "http://www.acme.org/Endpoint/N81027"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "Y8J7D"
* source.endpoint = "http://www.acme.org/Endpoint/Y8J7D"
* focus[+].reference = "urn:uuid:48e8d73e-3888-5394-9fc2-1183c8f87230"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-NHSE-HPV-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - NHS England HPV - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383281"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier[+].system = "http://www.acme.org/patient/Y8J7D"
* identifier[+].value = "Y8J7D0482113"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* name.family = "CONGLETON"
* name.given = "Margaery"
* birthDate = "1982-02-11"
* gender = #female
* address.line[+] = "Town Hall"
* address.line[+] = "7 High Street"
* address.city = "CONGLETON"
* address.postalCode = "CW12 1BN"

Instance:   HL7v2Msg-NHSE-HPV-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - NHS England HPV - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/N81027"
* identifier[+].value = "SPC-REQ-20220321-000065"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N81027"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/Y8J7D"
* identifier[+].value = "SPC-Lab-20220322-005962"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #available
* type.text = "Cervical swab"
* subject.reference = "urn:uuid:471dc517-a1fb-5059-974a-e92228d5d403"
* collection.collectedDateTime = "2022-03-22T11:04:00+00:00"
* receivedTime = "2022-03-22T15:25:00+00:00"

Instance:   HL7v2Msg-NHSE-HPV-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - NHS England HPV - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/N81027"
* identifier[+].value = "REQ-20220321-000017"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N81027"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/Y8J7D"
* identifier[+].value = "REP-20220403-008209"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #completed
* intent = #order
* code.coding[+] = http://snomed.info/sct#50121000237101 "Human papilloma virus RNA nucleic acid amplification qualitative result"
* subject.reference = "urn:uuid:471dc517-a1fb-5059-974a-e92228d5d403"
* occurrenceDateTime = "2022-03-22T11:04:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C1008215"
* requester.display = "Dr Gale GASKELL"
* specimen[+].reference = "urn:uuid:447c4851-5cb9-5b83-a01a-8b0c9f23ac8a"

Instance:   HL7v2Msg-NHSE-HPV-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England HPV - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#50121000237101 "Human papilloma virus RNA nucleic acid amplification qualitative result"
* subject.reference = "urn:uuid:471dc517-a1fb-5059-974a-e92228d5d403"
* effectiveDateTime = "2022-03-22T11:04:00+00:00"
* valueString = "Not detected"
* specimen.reference = "urn:uuid:447c4851-5cb9-5b83-a01a-8b0c9f23ac8a"
* note[+].text = "No cytology result (HPV Screening)"
* note[+].text = "Suggested management : Normal  Recall"

Instance:   HL7v2Msg-NHSE-HPV-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - NHS England HPV - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/Y8J7D"
* identifier[+].value = "REP-20220403-008209"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* basedOn.reference = "urn:uuid:7f55a586-fba6-53fb-a42f-b7da665cbbbd"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#CP
* code.coding[+] = http://snomed.info/sct#50121000237101 "Human papilloma virus RNA nucleic acid amplification qualitative result"
* subject.reference = "urn:uuid:471dc517-a1fb-5059-974a-e92228d5d403"
* effectiveDateTime = "2022-03-22T11:04:00+00:00"
* issued = "2022-04-03T15:43:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "Y8J7D"
* specimen[+].reference = "urn:uuid:447c4851-5cb9-5b83-a01a-8b0c9f23ac8a"
* result[+].reference = "urn:uuid:9eff41ef-66da-5a44-a2b1-ad469f9de46e"

Instance:   HL7v2Msg-NHSE-HPV
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - NHS England HPV"
Description: "Fictitious example: Laboratory Report (LAB-3) - NHS England HPV as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:6059136e-063a-58b2-825b-a36ddf36d920"
* timestamp = "2022-03-08T12:09:00+00:00"
* entry[+].fullUrl = "urn:uuid:6310fb04-e8cc-5f48-a9d9-ee2bf9d1e4e2"
* entry[=].resource = HL7v2Msg-NHSE-HPV-MessageHeader
* entry[+].fullUrl = "urn:uuid:471dc517-a1fb-5059-974a-e92228d5d403"
* entry[=].resource = HL7v2Msg-NHSE-HPV-Patient
* entry[+].fullUrl = "urn:uuid:447c4851-5cb9-5b83-a01a-8b0c9f23ac8a"
* entry[=].resource = HL7v2Msg-NHSE-HPV-Specimen-1
* entry[+].fullUrl = "urn:uuid:7f55a586-fba6-53fb-a42f-b7da665cbbbd"
* entry[=].resource = HL7v2Msg-NHSE-HPV-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:9eff41ef-66da-5a44-a2b1-ad469f9de46e"
* entry[=].resource = HL7v2Msg-NHSE-HPV-Observation-1
* entry[+].fullUrl = "urn:uuid:48e8d73e-3888-5394-9fc2-1183c8f87230"
* entry[=].resource = HL7v2Msg-NHSE-HPV-DiagnosticReport-1

Instance:   HL7v2Msg-NHSE-GTT-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - NHS England GTT (unstructured) - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "N81027"
* destination.endpoint = "http://www.acme.org/Endpoint/N81027"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "Y8J7D"
* source.endpoint = "http://www.acme.org/Endpoint/Y8J7D"
* focus[+].reference = "urn:uuid:a7f560c2-d33c-5a01-b95a-3a72ac9a7d7c"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-NHSE-GTT-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - NHS England GTT (unstructured) - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383281"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier[+].system = "http://www.acme.org/patient/Y8J7D"
* identifier[+].value = "Y8J7D0482113"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* name.family = "CONGLETON"
* name.given = "Margaery"
* birthDate = "1982-02-11"
* gender = #female
* address.line[+] = "Town Hall"
* address.line[+] = "7 High Street"
* address.city = "CONGLETON"
* address.postalCode = "CW12 1BN"

Instance:   HL7v2Msg-NHSE-GTT-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - NHS England GTT (unstructured) - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/N81027"
* identifier[+].value = "SPC-REQ-20220209-000082"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N81027"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/Y8J7D"
* identifier[+].value = "SPC-Lab-20220209-001531"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #available
* type.text = "Venous blood specimen"
* subject.reference = "urn:uuid:502b150c-d487-5452-b64b-6a02ae623589"
* collection.collectedDateTime = "2022-02-09T10:01:23+00:00"
* receivedTime = "2022-02-09T14:17:06+00:00"

Instance:   HL7v2Msg-NHSE-GTT-Specimen-2
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - NHS England GTT (unstructured) - Specimen 2"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/N81027"
* identifier[+].value = "SPC-REQ-20220209-000083"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N81027"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/Y8J7D"
* identifier[+].value = "SPC-Lab-20220209-001549"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #available
* type.text = "Venous blood specimen"
* subject.reference = "urn:uuid:502b150c-d487-5452-b64b-6a02ae623589"
* collection.collectedDateTime = "2022-02-09T11:03:07+00:00"
* receivedTime = "2022-02-09T14:17:06+00:00"

Instance:   HL7v2Msg-NHSE-GTT-Specimen-3
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - NHS England GTT (unstructured) - Specimen 3"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/N81027"
* identifier[+].value = "SPC-REQ-20220209-000084"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N81027"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/Y8J7D"
* identifier[+].value = "SPC-Lab-20220209-001587"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #available
* type.text = "Venous blood specimen"
* subject.reference = "urn:uuid:502b150c-d487-5452-b64b-6a02ae623589"
* collection.collectedDateTime = "2022-02-09T12:02:17+00:00"
* receivedTime = "2022-02-09T14:17:06+00:00"

Instance:   HL7v2Msg-NHSE-GTT-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - NHS England GTT (unstructured) - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/N81027"
* identifier[+].value = "REQ-20220207-000013"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N81027"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/Y8J7D"
* identifier[+].value = "REP-20220210-000218"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #completed
* intent = #order
* code.coding[+] = http://snomed.info/sct#1005711000000106 "Glucose tolerance test"
* subject.reference = "urn:uuid:502b150c-d487-5452-b64b-6a02ae623589"
* occurrenceDateTime = "2022-02-09T10:01:23+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C1008215"
* requester.display = "Dr Gale GASKELL"
* specimen[+].reference = "urn:uuid:0f9e6b49-1520-5a09-b270-72faf56235ef"
* specimen[+].reference = "urn:uuid:00f31741-dd7e-5dd1-8ba4-c3676f0850ab"
* specimen[+].reference = "urn:uuid:957f10ca-b5d6-5eab-b993-4350b4d7c084"

Instance:   HL7v2Msg-NHSE-GTT-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England GTT (unstructured) - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#1005711000000106 "Glucose tolerance test"
* subject.reference = "urn:uuid:502b150c-d487-5452-b64b-6a02ae623589"
* effectiveDateTime = "2022-02-09T10:01:23+00:00"
* valueString = "GTT Fasting Glucose   4.8 mmol/L 
 GTT Glucose 60 min    8.8 mmol/L
 GTT Glucose 120 min   6.4 mmol/L"
* specimen.reference = "urn:uuid:0f9e6b49-1520-5a09-b270-72faf56235ef"

Instance:   HL7v2Msg-NHSE-GTT-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - NHS England GTT (unstructured) - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/Y8J7D"
* identifier[+].value = "REP-20220210-000218"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* basedOn.reference = "urn:uuid:26ae572d-e0c9-57b5-8d71-4004beca9399"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#CH
* code.coding[+] = http://snomed.info/sct#1005711000000106 "Glucose tolerance test"
* subject.reference = "urn:uuid:502b150c-d487-5452-b64b-6a02ae623589"
* effectiveDateTime = "2022-02-09T10:01:23+00:00"
* issued = "2022-02-10T11:49:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "Y8J7D"
* specimen[+].reference = "urn:uuid:0f9e6b49-1520-5a09-b270-72faf56235ef"
* specimen[+].reference = "urn:uuid:00f31741-dd7e-5dd1-8ba4-c3676f0850ab"
* specimen[+].reference = "urn:uuid:957f10ca-b5d6-5eab-b993-4350b4d7c084"
* result[+].reference = "urn:uuid:12b5b401-3f29-5d65-a808-791da244b8bf"
* conclusion = "Fasting glucose below 5.1, 1hr below 10.0 and 2hr below 8.5 mmol/L. Normal response to glucose load, no further action required."

Instance:   HL7v2Msg-NHSE-GTT
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - NHS England GTT (unstructured)"
Description: "Fictitious example: Laboratory Report (LAB-3) - NHS England GTT (unstructured) as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:904be84a-bb79-5ab5-895b-9b625d1b4b9b"
* timestamp = "2022-03-08T12:09:00+00:00"
* entry[+].fullUrl = "urn:uuid:0712aa17-c2de-5ece-ab01-e28601b9faf6"
* entry[=].resource = HL7v2Msg-NHSE-GTT-MessageHeader
* entry[+].fullUrl = "urn:uuid:502b150c-d487-5452-b64b-6a02ae623589"
* entry[=].resource = HL7v2Msg-NHSE-GTT-Patient
* entry[+].fullUrl = "urn:uuid:0f9e6b49-1520-5a09-b270-72faf56235ef"
* entry[=].resource = HL7v2Msg-NHSE-GTT-Specimen-1
* entry[+].fullUrl = "urn:uuid:00f31741-dd7e-5dd1-8ba4-c3676f0850ab"
* entry[=].resource = HL7v2Msg-NHSE-GTT-Specimen-2
* entry[+].fullUrl = "urn:uuid:957f10ca-b5d6-5eab-b993-4350b4d7c084"
* entry[=].resource = HL7v2Msg-NHSE-GTT-Specimen-3
* entry[+].fullUrl = "urn:uuid:26ae572d-e0c9-57b5-8d71-4004beca9399"
* entry[=].resource = HL7v2Msg-NHSE-GTT-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:12b5b401-3f29-5d65-a808-791da244b8bf"
* entry[=].resource = HL7v2Msg-NHSE-GTT-Observation-1
* entry[+].fullUrl = "urn:uuid:a7f560c2-d33c-5a01-b95a-3a72ac9a7d7c"
* entry[=].resource = HL7v2Msg-NHSE-GTT-DiagnosticReport-1

Instance:   HL7v2Msg-NHSE-UrineMCS-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - NHS England Urine MC&S (unstructured) - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "N81027"
* destination.endpoint = "http://www.acme.org/Endpoint/N81027"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "Y8J7D"
* source.endpoint = "http://www.acme.org/Endpoint/Y8J7D"
* focus[+].reference = "urn:uuid:00ecf3b0-de20-5a41-9e94-877ed4a70e09"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-NHSE-UrineMCS-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - NHS England Urine MC&S (unstructured) - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383281"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PI
* identifier[+].system = "http://www.acme.org/patient/Y8J7D"
* identifier[+].value = "Y8J7D0482113"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* name.family = "CONGLETON"
* name.given = "Margaery"
* birthDate = "1982-02-11"
* gender = #female
* address.line[+] = "Town Hall"
* address.line[+] = "7 High Street"
* address.city = "CONGLETON"
* address.postalCode = "CW12 1BN"

Instance:   HL7v2Msg-NHSE-UrineMCS-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - NHS England Urine MC&S (unstructured) - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/N81027"
* identifier[+].value = "SPC-REQ-20220221-000024"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N81027"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/specimen/Y8J7D"
* identifier[+].value = "SPC-Lab-20220221-004306"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #available
* type.text = "Urine specimen"
* subject.reference = "urn:uuid:61aca9c4-c09d-5862-8a2a-a5bb4db0eff0"
* collection.collectedDateTime = "2022-02-21T11:07:00+00:00"
* receivedTime = "2022-02-21T14:58:00+00:00"

Instance:   HL7v2Msg-NHSE-UrineMCS-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - NHS England Urine MC&S (unstructured) - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/N81027"
* identifier[+].value = "REQ-20220221-000018"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "N81027"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/Y8J7D"
* identifier[+].value = "REP-20220225-006301"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* status = #completed
* intent = #order
* code.coding[+] = http://snomed.info/sct#995581000000104 "Urinary microscopy, culture and sensitivities"
* subject.reference = "urn:uuid:61aca9c4-c09d-5862-8a2a-a5bb4db0eff0"
* occurrenceDateTime = "2022-02-21T11:07:00+00:00"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C1008215"
* requester.display = "Dr Gale GASKELL"
* specimen[+].reference = "urn:uuid:83cb705d-6305-5e00-89eb-612bb8c7fe97"

Instance:   HL7v2Msg-NHSE-UrineMCS-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - NHS England Urine MC&S (unstructured) - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#995581000000104 "Urinary microscopy, culture and sensitivities"
* subject.reference = "urn:uuid:61aca9c4-c09d-5862-8a2a-a5bb4db0eff0"
* effectiveDateTime = "2022-02-21T11:07:00+00:00"
* valueString = "Microscopy
Casts  None seen
White cells  >35 x10*6/L
Red cells  10-35 x10*6/L
Epithelial cells  +

Culture
1. Staphylococcus aureus   Scanty growth

Sensitivities  1
Flucloxacillin   S
Trimethoprim  S
Nitrofurantoin  R"
* specimen.reference = "urn:uuid:83cb705d-6305-5e00-89eb-612bb8c7fe97"

Instance:   HL7v2Msg-NHSE-UrineMCS-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - NHS England Urine MC&S (unstructured) - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/Y8J7D"
* identifier[+].value = "REP-20220225-006301"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "Y8J7D"
* basedOn.reference = "urn:uuid:b60b590e-434c-52d6-9ac4-25a91f4978eb"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#MB
* code.coding[+] = http://snomed.info/sct#995581000000104 "Urinary microscopy, culture and sensitivities"
* subject.reference = "urn:uuid:61aca9c4-c09d-5862-8a2a-a5bb4db0eff0"
* effectiveDateTime = "2022-02-21T11:07:00+00:00"
* issued = "2022-02-25T13:47:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "Y8J7D"
* specimen[+].reference = "urn:uuid:83cb705d-6305-5e00-89eb-612bb8c7fe97"
* result[+].reference = "urn:uuid:36dbbc3d-5f80-5be0-85bc-8ab9c771b8ed"
* conclusion = "Likely to be clinically significant."

Instance:   HL7v2Msg-NHSE-UrineMCS
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - NHS England Urine MC&S (unstructured)"
Description: "Fictitious example: Laboratory Report (LAB-3) - NHS England Urine MC&S (unstructured) as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:fafd0144-2359-5cf5-ab2b-5b073dc2d883"
* timestamp = "2022-03-08T12:09:00+00:00"
* entry[+].fullUrl = "urn:uuid:247b5f22-11b9-5c1d-b578-8a357ef3f39b"
* entry[=].resource = HL7v2Msg-NHSE-UrineMCS-MessageHeader
* entry[+].fullUrl = "urn:uuid:61aca9c4-c09d-5862-8a2a-a5bb4db0eff0"
* entry[=].resource = HL7v2Msg-NHSE-UrineMCS-Patient
* entry[+].fullUrl = "urn:uuid:83cb705d-6305-5e00-89eb-612bb8c7fe97"
* entry[=].resource = HL7v2Msg-NHSE-UrineMCS-Specimen-1
* entry[+].fullUrl = "urn:uuid:b60b590e-434c-52d6-9ac4-25a91f4978eb"
* entry[=].resource = HL7v2Msg-NHSE-UrineMCS-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:36dbbc3d-5f80-5be0-85bc-8ab9c771b8ed"
* entry[=].resource = HL7v2Msg-NHSE-UrineMCS-Observation-1
* entry[+].fullUrl = "urn:uuid:00ecf3b0-de20-5a41-9e94-877ed4a70e09"
* entry[=].resource = HL7v2Msg-NHSE-UrineMCS-DiagnosticReport-1

Instance:   HL7v2Msg-FIT-MessageHeader
InstanceOf: MessageHeader
Title:      "Laboratory Report (LAB-3) - Bowel Cancer Screening FIT - MessageHeader"
Description: "Fictitious example: the message header (HL7 v2 MSH), event R01."
Usage:      #inline
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "BCSS"
* destination.endpoint = "http://www.acme.org/Endpoint/BCSS"
* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "HUB01"
* source.endpoint = "http://www.acme.org/Endpoint/HUB01"
* focus[+].reference = "urn:uuid:1f3f37cb-c3c0-52e4-934c-6f7a08624575"
* focus[=].type = #DiagnosticReport


Instance:   HL7v2Msg-FIT-Patient
InstanceOf: Patient
Title:      "Laboratory Report (LAB-3) - Bowel Cancer Screening FIT - Patient"
Description: "Fictitious example: the patient (HL7 v2 PID)."
Usage:      #inline
* identifier[+].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[=].value = "9737383192"
* name.family = "MANCHESTER"
* name.given = "Sansa"
* birthDate = "1972-09-21"
* gender = #female
* address.line[+] = "Oxford Rd"
* address.city = "MANCHESTER"
* address.postalCode = "M13 9PL"
* generalPractitioner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* generalPractitioner.identifier.value = "P84673"
* generalPractitioner.display = "ANCOATS URBAN VILLAGE MEDICAL PRACTICE"

Instance:   HL7v2Msg-FIT-Specimen-1
InstanceOf: Specimen
Title:      "Laboratory Report (LAB-3) - Bowel Cancer Screening FIT - Specimen 1"
Description: "Fictitious example: the specimen (HL7 v2 SPM)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/specimen/HUB01"
* identifier[+].value = "F25-118204-K1"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "HUB01"
* status = #available
* type.coding[+] = http://snomed.info/sct#119339001 "Stool specimen"
* subject.reference = "urn:uuid:196af7f7-08a0-51e9-85d1-58f019e953f6"
* collection.collectedDateTime = "2025-10-29"
* receivedTime = "2025-10-31T10:15:00+00:00"

Instance:   HL7v2Msg-FIT-ServiceRequest-1
InstanceOf: ServiceRequest
Title:      "Laboratory Report (LAB-3) - Bowel Cancer Screening FIT - ServiceRequest 1"
Description: "Fictitious example: the order (HL7 v2 ORC/OBR)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[+].system = "http://www.acme.org/servicerequest/BCSS"
* identifier[+].value = "BCS25-0438812"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "BCSS"
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/servicerequest/HUB01"
* identifier[+].value = "F25-118204"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "HUB01"
* status = #completed
* intent = #order
* code.coding[+] = http://www.acme.org/CodeSystem/HUB01#FITSCR "Bowel cancer screening faecal immunochemical test"
* subject.reference = "urn:uuid:196af7f7-08a0-51e9-85d1-58f019e953f6"
* occurrenceDateTime = "2025-10-29"
* requester.display = "BCSP Hub Manager"
* specimen[+].reference = "urn:uuid:558e768a-9a27-51f7-b5a9-e2d9bfe39df3"

Instance:   HL7v2Msg-FIT-Observation-1
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Bowel Cancer Screening FIT - Observation 1"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#27396-1 "Hemoglobin [Mass/mass] in Stool from gastrointestinal"
* code.coding[+] = http://snomed.info/sct#1049361000000101 "Quantitative faecal immunochemical test"
* subject.reference = "urn:uuid:196af7f7-08a0-51e9-85d1-58f019e953f6"
* effectiveDateTime = "2025-11-03"
* valueQuantity.value = 142
* valueQuantity.unit = "microgram per gram"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #ug/g
* referenceRange.text = "<120"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H
* specimen.reference = "urn:uuid:558e768a-9a27-51f7-b5a9-e2d9bfe39df3"

Instance:   HL7v2Msg-FIT-Observation-2
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Bowel Cancer Screening FIT - Observation 2"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://loinc.org#29771-3 "Hemoglobin [Presence] in Stool from gastrointestinal lower by Immunoassay"
* subject.reference = "urn:uuid:196af7f7-08a0-51e9-85d1-58f019e953f6"
* effectiveDateTime = "2025-11-03"
* valueCodeableConcept.coding[+] = http://loinc.org#LA6576-8 "Positive"
* specimen.reference = "urn:uuid:558e768a-9a27-51f7-b5a9-e2d9bfe39df3"

Instance:   HL7v2Msg-FIT-Observation-3
InstanceOf: Observation
Title:      "Laboratory Report (LAB-3) - Bowel Cancer Screening FIT - Observation 3"
Description: "Fictitious example: a result (HL7 v2 OBX)."
Usage:      #inline
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+] = http://snomed.info/sct#368481000000103 "Bowel cancer screening programme: faecal occult blood result"
* subject.reference = "urn:uuid:196af7f7-08a0-51e9-85d1-58f019e953f6"
* effectiveDateTime = "2025-11-04"
* valueCodeableConcept.coding[+] = http://snomed.info/sct#1101371000000105 "Bowel cancer screening programme liquid faecal immunochemical test abnormal"
* specimen.reference = "urn:uuid:558e768a-9a27-51f7-b5a9-e2d9bfe39df3"
* note[+].text = "Further tests needed. Referred to specialist screening practitioner clinic."

Instance:   HL7v2Msg-FIT-DiagnosticReport-1
InstanceOf: DiagnosticReport
Title:      "Laboratory Report (LAB-3) - Bowel Cancer Screening FIT - DiagnosticReport 1"
Description: "Fictitious example: the report (HL7 v2 OBR with its OBX)."
Usage:      #inline
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* identifier[+].system = "http://www.acme.org/diagnosticreport/identifiers/HUB01"
* identifier[+].value = "F25-118204"
* identifier[+].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[+].assigner.identifier.value = "HUB01"
* basedOn.reference = "urn:uuid:496457cc-798c-56c9-89ee-a174344205b5"
* status = #final
* code.coding[+] = http://www.acme.org/CodeSystem/HUB01#FITSCR "Bowel cancer screening faecal immunochemical test"
* subject.reference = "urn:uuid:196af7f7-08a0-51e9-85d1-58f019e953f6"
* effectiveDateTime = "2025-10-29"
* issued = "2025-11-04T10:15:00+00:00"
* performer.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* performer.identifier.value = "HUB01"
* specimen[+].reference = "urn:uuid:558e768a-9a27-51f7-b5a9-e2d9bfe39df3"
* result[+].reference = "urn:uuid:252b7960-f356-51e2-bdf2-a00aca06a9d4"
* result[+].reference = "urn:uuid:b156df68-feac-5b83-bdb8-545001f919a8"
* result[+].reference = "urn:uuid:e1ecfa18-12d4-5d58-b6e6-666aaef32d69"

Instance:   HL7v2Msg-FIT
InstanceOf: Bundle
Title:      "Bundle Message - Laboratory Report (LAB-3) - Bowel Cancer Screening FIT"
Description: "Fictitious example: Laboratory Report (LAB-3) - Bowel Cancer Screening FIT as a FHIR Message, converted from the HL7 v2 ORU^R01 on the HL7 v2 Pathology Examples page."
Usage:      #example
* type = #message
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2a722a61-34d7-5260-a950-90733ccf7ab3"
* timestamp = "2025-11-04T10:15:00+00:00"
* entry[+].fullUrl = "urn:uuid:d59995c4-2b1b-5eb3-b430-5f7b61bf39b8"
* entry[=].resource = HL7v2Msg-FIT-MessageHeader
* entry[+].fullUrl = "urn:uuid:196af7f7-08a0-51e9-85d1-58f019e953f6"
* entry[=].resource = HL7v2Msg-FIT-Patient
* entry[+].fullUrl = "urn:uuid:558e768a-9a27-51f7-b5a9-e2d9bfe39df3"
* entry[=].resource = HL7v2Msg-FIT-Specimen-1
* entry[+].fullUrl = "urn:uuid:496457cc-798c-56c9-89ee-a174344205b5"
* entry[=].resource = HL7v2Msg-FIT-ServiceRequest-1
* entry[+].fullUrl = "urn:uuid:252b7960-f356-51e2-bdf2-a00aca06a9d4"
* entry[=].resource = HL7v2Msg-FIT-Observation-1
* entry[+].fullUrl = "urn:uuid:b156df68-feac-5b83-bdb8-545001f919a8"
* entry[=].resource = HL7v2Msg-FIT-Observation-2
* entry[+].fullUrl = "urn:uuid:e1ecfa18-12d4-5d58-b6e6-666aaef32d69"
* entry[=].resource = HL7v2Msg-FIT-Observation-3
* entry[+].fullUrl = "urn:uuid:1f3f37cb-c3c0-52e4-934c-6f7a08624575"
* entry[=].resource = HL7v2Msg-FIT-DiagnosticReport-1
