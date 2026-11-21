// Fictitious examples for the End of Life Care scenario. Ned LIVERPOOL is the
// patient of the Lynch syndrome example (LAB-35); his caecal adenocarcinoma has
// since spread to the liver. GP001 is a placeholder, not an ODS code; phone
// numbers are from the Ofcom drama ranges; the NHS number is a test number.

Instance:   EolPatient
InstanceOf: Patient
Title:      "Ned LIVERPOOL"
Description: "Fictitious example patient."
Usage:      #example
* identifier.system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier.value = "9737383206"
* name.family = "LIVERPOOL"
* name.given = "Ned"
* gender = #male
* birthDate = "1942-06-18"
* address.line = "20 Forthlin Road"
* address.city = "LIVERPOOL"
* address.postalCode = "L18 9TN"
* telecom.system = #phone
* telecom.value = "0151 496 0201"
* generalPractitioner = Reference(EolGPPractice)

Instance:   EolCarer
InstanceOf: RelatedPerson
Title:      "Joan LIVERPOOL - main carer and LPA"
Description: "Fictitious example. Ned's wife: main carer (SCCI1580 items 16-17) and lasting power of attorney for personal welfare (items 51-53)."
Usage:      #example
* patient = Reference(EolPatient)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#WIFE "wife"
* relationship[+] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#HPOWATT "healthcare power of attorney"
* name.family = "LIVERPOOL"
* name.given = "Joan"
* telecom.system = #phone
* telecom.value = "07700 900123"

Instance:   EolPalliativeConsultant
InstanceOf: Practitioner
Title:      "Dr Priya FICTITIOUS - Consultant in Palliative Medicine"
Description: "Fictitious example practitioner."
Usage:      #example
* identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* identifier.value = "C5678901"
* name.family = "FICTITIOUS"
* name.given = "Priya"
* name.prefix = "Dr"

Instance:   EolOncologist
InstanceOf: Practitioner
Title:      "Dr Morgan FICTITIOUS - Consultant Oncologist"
Description: "Fictitious example practitioner who raised the Task after the MDT."
Usage:      #example
* identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* identifier.value = "C7890123"
* name.family = "FICTITIOUS"
* name.given = "Morgan"
* name.prefix = "Dr"

Instance:   EolProvider
InstanceOf: Organization
Title:      "Manchester University NHS Foundation Trust"
Description: "Example organisation holding the EPaCCS record."
Usage:      #example
* identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier.value = "R0A"
* name = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"

Instance:   EolGPPractice
InstanceOf: Organization
Title:      "FICTITIOUS Medical Practice"
Description: "Fictitious example GP practice. GP001 is a placeholder, not an ODS code."
Usage:      #example
* identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier.value = "GP001"
* name = "FICTITIOUS MEDICAL PRACTICE"

Instance:   EolTask
InstanceOf: Task
Title:      "Task - complete end of life care record"
Description: "Fictitious example. Raised by the oncologist after the colorectal MDT judged Ned's prognosis to be last months of life. Completed by the palliative care team, with the QuestionnaireResponse as output."
Usage:      #example
* status = #completed
* intent = #order
* priority = #urgent
* code = http://hl7.org/fhir/CodeSystem/task-code#fulfill "Fulfill the focal request"
* description = "Complete the End of Life Care Record (advance care planning conversation)"
* focus = Reference(EndOfLifeCareQuestionnaire)
* for = Reference(EolPatient)
* authoredOn = "2026-10-05T16:30:00+00:00"
* lastModified = "2026-10-12T14:05:00+00:00"
* requester = Reference(EolOncologist)
* owner = Reference(EolPalliativeConsultant)
* reasonCode = http://snomed.info/sct#968211000000101 "Last months of life"
* reasonCode.text = "Colorectal MDT 5 October 2026: metastatic caecal adenocarcinoma, liver metastases, not for further anti-cancer treatment"
* output.type.text = "End of Life Care QuestionnaireResponse"
* output.valueReference = Reference(EolQuestionnaireResponse1)

Instance:   EolDocumentReference1
InstanceOf: DocumentReference
Title:      "DocumentReference - End of Life Care Document version 1 (superseded)"
Description: "Fictitious example. Indexes version 1 of the End of Life Care Document; superseded by version 2."
Usage:      #example
* status = #superseded
* type = http://snomed.info/sct#861421000000109 "End of Life Care Coordination Summary"
* subject = Reference(EolPatient)
* date = "2026-10-12T14:05:00+00:00"
* author = Reference(EolPalliativeConsultant)
* custodian = Reference(EolProvider)
* content.attachment.contentType = #application/fhir+json
* content.attachment.url = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Bundle/EolDocument1"
* content.attachment.title = "End of Life Care Record (version 1)"

Instance:   EolDocumentReference2
InstanceOf: DocumentReference
Title:      "DocumentReference - End of Life Care Document version 2 (current)"
Description: "Fictitious example. Indexes version 2 of the End of Life Care Document, which replaces version 1, and its printable PDF."
Usage:      #example
* status = #current
* type = http://snomed.info/sct#861421000000109 "End of Life Care Coordination Summary"
* subject = Reference(EolPatient)
* date = "2026-11-02T10:05:00+00:00"
* author = Reference(EolPalliativeConsultant)
* custodian = Reference(EolProvider)
* relatesTo.code = #replaces
* relatesTo.target = Reference(EolDocumentReference1)
* content[+].attachment.contentType = #application/fhir+json
* content[=].attachment.url = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Bundle/EolDocument2"
* content[=].attachment.title = "End of Life Care Record (version 2)"
* content[+].attachment.contentType = #application/pdf
* content[=].attachment.url = "https://example.org/eol/EOL-0001-v2.pdf"
* content[=].attachment.title = "End of Life Care Record (version 2) - printable copy"
