// Fictitious example: Ned LIVERPOOL's caecal biopsy (H23-41022), the histopathology
// report of the Lynch syndrome example on LAB-35, as a Cancer Pathology Report
// FHIR Document. The patient is the Palliative Care Record example patient (EolPatient).

Alias: $obscat = http://terminology.hl7.org/CodeSystem/observation-category

RuleSet: PathologyResult
* status = #final
* category[laboratory] = $obscat#laboratory
* subject = Reference(EolPatient)
* specimen = Reference(PathSpecimenH23-41022)
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* issued = "2023-08-21T09:00:00+00:00"
* performer = Reference(PathPathologist)

Instance:   PathLaboratory
InstanceOf: Organization
Title:      "Manchester Royal Infirmary Laboratory"
Description: "Example reporting laboratory (pCR0800)."
Usage:      #example
* identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier.value = "690S0"
* name = "MANCHESTER ROYAL INFIRMARY LABORATORY"

Instance:   PathPathologist
InstanceOf: Practitioner
Title:      "Dr Anika FICTITIOUS - Consultant Histopathologist"
Description: "Fictitious reporting pathologist (pCR7130/pCR7140)."
Usage:      #example
* identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* identifier.value = "C2468013"
* name.family = "FICTITIOUS"
* name.given = "Anika"
* name.prefix = "Dr"

Instance:   PathSpecimenH23-41022
InstanceOf: CancerPathologySpecimen
Title:      "Specimen A - caecal mass, colonoscopic biopsies"
Description: "Fictitious example specimen."
Usage:      #example
* identifier.system = "https://fhir.nhs.uk/Id/690S0/specimen"
* identifier.value = "H23-41022-A"
* type = COSDSpecimenNatureCS#1 "Primary tumour"
* type.text = "Caecal mass, colonoscopic biopsies"
* subject = Reference(EolPatient)
* receivedTime = "2023-08-14T15:00:00+00:00"
* collection.collectedDateTime = "2023-08-14T10:00:00+00:00"
* collection.method = COSDPathologyInvestigationTypeCS#BU "Biopsy (not otherwise specified)"
* collection.bodySite = http://snomed.info/sct#32713005 "Caecum structure"

Instance:   PathPrimaryCancerCondition
InstanceOf: PrimaryCancerCondition
Title:      "Primary cancer - caecum"
Description: "Fictitious example diagnosis (pCR0810, pCR6410)."
Usage:      #example
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* code = http://hl7.org/fhir/sid/icd-10#C18.0 "Caecum"
* code.coding[+] = http://snomed.info/sct#363350007 "Malignant neoplasm of caecum"
* code.text = "Adenocarcinoma of the caecum"
* bodySite = http://snomed.info/sct#32713005 "Caecum structure"
* subject = Reference(EolPatient)
* recordedDate = "2023-08-21"
* evidence.detail = Reference(PathHistologicType)

Instance:   PathHistologicType
InstanceOf: HistologicBehaviorAndType
Title:      "Histologic type - adenocarcinoma"
Description: "Fictitious example morphology (pCR6420)."
Usage:      #example
* insert PathologyResult
* valueCodeableConcept = http://snomed.info/sct#1187332001 "Adenocarcinoma"

Instance:   PathMLH1
InstanceOf: TumorMarkerTest
Title:      "MLH1 nuclear expression - lost"
Description: "Fictitious example MMR immunohistochemistry (pCR7020)."
Usage:      #example
* insert PathologyResult
* code = http://loinc.org#81691-8 "MLH-1 Ag [Presence] in Cancer specimen by Immune stain"
* valueCodeableConcept = COSDNuclearExpressionIntactCS#N "No - nuclear expression lost"

Instance:   PathPMS2
InstanceOf: TumorMarkerTest
Title:      "PMS2 nuclear expression - lost"
Description: "Fictitious example MMR immunohistochemistry (pCR7030)."
Usage:      #example
* insert PathologyResult
* code = http://loinc.org#81694-2 "PMS2 Ag [Presence] in Cancer specimen by Immune stain"
* valueCodeableConcept = COSDNuclearExpressionIntactCS#N "No - nuclear expression lost"

Instance:   PathMSH2
InstanceOf: TumorMarkerTest
Title:      "MSH2 nuclear expression - intact"
Description: "Fictitious example MMR immunohistochemistry (pCR7040)."
Usage:      #example
* insert PathologyResult
* code = http://loinc.org#81692-6 "MSH-2 Ag [Presence] in Cancer specimen by Immune stain"
* valueCodeableConcept = COSDNuclearExpressionIntactCS#Y "Yes - nuclear expression intact"

Instance:   PathMSH6
InstanceOf: TumorMarkerTest
Title:      "MSH6 nuclear expression - intact"
Description: "Fictitious example MMR immunohistochemistry (pCR7050)."
Usage:      #example
* insert PathologyResult
* code = http://loinc.org#81693-4 "MSH-6 Ag [Presence] in Cancer specimen by Immune stain"
* valueCodeableConcept = COSDNuclearExpressionIntactCS#Y "Yes - nuclear expression intact"

Instance:   PathDiagnosticReport
InstanceOf: CancerPathologyDiagnosticReport
Title:      "Histopathology report H23-41022"
Description: "Fictitious example Cancer Pathology Diagnostic Report - the workflow view of the same report as the Composition."
Usage:      #example
* extension[DiagnosticReportCompositionR5].valueReference = Reference(PathComposition)
* identifier.system = "https://fhir.nhs.uk/Id/690S0/report"
* identifier.value = "H23-41022"
* basedOn.identifier.system = "https://fhir.nhs.uk/Id/R0A/order"
* basedOn.identifier.value = "1583320"
* status = #final
* code = http://loinc.org#60567-5 "Comprehensive pathology report panel"
* subject = Reference(EolPatient)
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* issued = "2023-08-21T09:00:00+00:00"
* performer[+] = Reference(PathPathologist)
* performer[+] = Reference(PathLaboratory)
* specimen = Reference(PathSpecimenH23-41022)
* result[+] = Reference(PathHistologicType)
* result[+] = Reference(PathMLH1)
* result[+] = Reference(PathPMS2)
* result[+] = Reference(PathMSH2)
* result[+] = Reference(PathMSH6)
* conclusion = "Caecum, biopsy: adenocarcinoma. Mismatch repair deficient (loss of MLH1 and PMS2). MLH1 promoter hypermethylation testing requested to assess for Lynch syndrome."

Instance:   PathComposition
InstanceOf: CancerPathologyComposition
Title:      "Histopathology report H23-41022 - Composition"
Description: "Fictitious example Cancer Pathology Composition."
Usage:      #example
* extension[diagnosticReport].valueReference = Reference(PathDiagnosticReport)
* identifier.system = "https://fhir.nhs.uk/Id/690S0/report"
* identifier.value = "H23-41022"
* status = #final
* subject = Reference(EolPatient)
* date = "2023-08-21T09:00:00+00:00"
* author = Reference(PathPathologist)
* title = "Histopathology Report"
* attester.mode = #legal
* attester.time = "2023-08-21T09:00:00+00:00"
* attester.party = Reference(PathPathologist)
* custodian = Reference(PathLaboratory)
* section[surgicalPathology].title = "Report"
* section[surgicalPathology].code = http://loinc.org#11529-5 "Surgical pathology study"
* section[surgicalPathology].text.status = #generated
* section[surgicalPathology].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Histopathology report H23-41022, Manchester Royal Infirmary Laboratory (690S0).</p></div>"
* section[surgicalPathology].section[+].title = "Clinical details"
* section[surgicalPathology].section[=].code = http://loinc.org#22636-5 "Pathology report relevant history Narrative"
* section[surgicalPathology].section[=].text.status = #generated
* section[surgicalPathology].section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Change in bowel habit. Colonoscopy: ulcerated mass in the caecum.</p></div>"
* section[surgicalPathology].section[+].title = "Specimen"
* section[surgicalPathology].section[=].code = http://loinc.org#22633-2 "Pathology report site of origin Narrative"
* section[surgicalPathology].section[=].text.status = #generated
* section[surgicalPathology].section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>A: Caecal mass, colonoscopic biopsies, collected 14-Aug-2023. Fixed in buffered 10% formalin.</p></div>"
* section[surgicalPathology].section[=].entry = Reference(PathSpecimenH23-41022)
* section[surgicalPathology].section[+].title = "Macroscopy"
* section[surgicalPathology].section[=].code = http://loinc.org#22634-0 "Pathology report gross observation Narrative"
* section[surgicalPathology].section[=].text.status = #generated
* section[surgicalPathology].section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Four cores of tan tissue, 2 to 5 mm. All embedded in block A1.</p></div>"
* section[surgicalPathology].section[+].title = "Microscopy"
* section[surgicalPathology].section[=].code = http://loinc.org#22635-7 "Pathology report microscopic observation Narrative Other stain"
* section[surgicalPathology].section[=].text.status = #generated
* section[surgicalPathology].section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Fragments of large bowel mucosa infiltrated by an adenocarcinoma, forming irregular glands with a desmoplastic stroma. Tumour-infiltrating lymphocytes are prominent. Mismatch repair immunohistochemistry: MLH1 loss of nuclear expression; PMS2 loss of nuclear expression; MSH2 retained; MSH6 retained.</p></div>"
* section[surgicalPathology].section[+].title = "Diagnosis"
* section[surgicalPathology].section[=].code = http://loinc.org#22637-3 "Pathology report final diagnosis Narrative"
* section[surgicalPathology].section[=].text.status = #generated
* section[surgicalPathology].section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Caecum, biopsy: adenocarcinoma. Mismatch repair deficient (loss of MLH1 and PMS2). MLH1 promoter hypermethylation testing requested to assess for Lynch syndrome.</p></div>"
* section[surgicalPathology].section[=].entry = Reference(PathPrimaryCancerCondition)
* section[synopticReport].title = "Cancer data summary"
* section[synopticReport].code = http://loinc.org#60568-3 "Pathology synoptic report"
* section[synopticReport].text.status = #generated
* section[synopticReport].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Specimen nature (pCR0970)</td><td>Primary tumour</td></tr><tr><td>Investigation type (pCR0760)</td><td>Biopsy</td></tr><tr><td>Topography (pCR6410)</td><td>Caecum structure</td></tr><tr><td>Diagnosis (pCR0810)</td><td>C18.0 Caecum</td></tr><tr><td>Morphology (pCR6420)</td><td>Adenocarcinoma</td></tr><tr><td>MLH1 nuclear expression intact (pCR7020)</td><td>No - lost</td></tr><tr><td>PMS2 nuclear expression intact (pCR7030)</td><td>No - lost</td></tr><tr><td>MSH2 nuclear expression intact (pCR7040)</td><td>Yes</td></tr><tr><td>MSH6 nuclear expression intact (pCR7050)</td><td>Yes</td></tr></table></div>"
* section[synopticReport].entry[+] = Reference(PathSpecimenH23-41022)
* section[synopticReport].entry[+] = Reference(PathPrimaryCancerCondition)
* section[synopticReport].entry[+] = Reference(PathHistologicType)
* section[synopticReport].entry[+] = Reference(PathMLH1)
* section[synopticReport].entry[+] = Reference(PathPMS2)
* section[synopticReport].entry[+] = Reference(PathMSH2)
* section[synopticReport].entry[+] = Reference(PathMSH6)

Instance:   PathDocument
InstanceOf: Bundle
Title:      "Histopathology report H23-41022 - FHIR Document"
Description: "Fictitious example Cancer Pathology Report as a FHIR Document (Bundle of type document), following the HL7 Europe Laboratory Bundle-eu-lab rules: one Composition and one DiagnosticReport with the same identifier and type."
Usage:      #example
* identifier.system = "https://fhir.nhs.uk/Id/690S0/document"
* identifier.value = "H23-41022"
* type = #document
* timestamp = "2023-08-21T09:05:00+00:00"
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Composition/PathComposition"
* entry[=].resource = PathComposition
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/DiagnosticReport/PathDiagnosticReport"
* entry[=].resource = PathDiagnosticReport
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Patient/EolPatient"
* entry[=].resource = EolPatient
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Organization/EolGPPractice"
* entry[=].resource = EolGPPractice
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Practitioner/PathPathologist"
* entry[=].resource = PathPathologist
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Organization/PathLaboratory"
* entry[=].resource = PathLaboratory
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Specimen/PathSpecimenH23-41022"
* entry[=].resource = PathSpecimenH23-41022
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Condition/PathPrimaryCancerCondition"
* entry[=].resource = PathPrimaryCancerCondition
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/PathHistologicType"
* entry[=].resource = PathHistologicType
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/PathMLH1"
* entry[=].resource = PathMLH1
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/PathPMS2"
* entry[=].resource = PathPMS2
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/PathMSH2"
* entry[=].resource = PathMSH2
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/PathMSH6"
* entry[=].resource = PathMSH6
