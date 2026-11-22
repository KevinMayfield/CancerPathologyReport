// Palliative Care Record - from a poor prognosis on the cancer pathway to a shared,
// printable end of life care record (ReSPECT-style FHIR Document), and its amendment.

Instance:       PalliativeCareRecordScenario
InstanceOf:     ExampleScenario
Title:          "Palliative Care Record - capture, share, print and amend"
Description:    "Proof of concept - not an authoritative source. A poor prognosis on the cancer pathway starts a Task to complete the end of life care record. The record is captured with an SDC Questionnaire, persisted as Observations, shared as a FHIR Document laid out like the ReSPECT form, and printed for the person's home. It is later amended, producing a replacement Document and printed copy."
Usage:          #definition
* url = "https://fhir.acme.example.org/CancerPathologyReport/ExampleScenario/PalliativeCareRecordScenario"
* name = "PalliativeCareRecordScenario"
* status = #draft
* experimental = true
* purpose = "Shows the Questionnaire - QuestionnaireResponse - Observation - Document pattern for SCCI1580 Palliative Care Co-ordination: Core Content."

// Actors

* actor[+].actorId = "patient"
* actor[=].type = #person
* actor[=].name = "Person and family"
* actor[=].description = "The person receiving palliative care, with their family, carer or legal welfare proxy. Keeps the printed copy at home."
* actor[+].actorId = "mdt"
* actor[=].type = #entity
* actor[=].name = "Cancer MDT / Order Placer (EPR)"
* actor[=].description = "The cancer multidisciplinary team and its EPR, where the poor prognosis is recorded and the Task is raised."
* actor[+].actorId = "clinician"
* actor[=].type = #person
* actor[=].name = "Clinician"
* actor[=].description = "Palliative care team, GP or key worker who holds the conversation with the person and completes the record."
* actor[+].actorId = "formfiller"
* actor[=].type = #entity
* actor[=].name = "Form Filler"
* actor[=].description = "SDC Form Filler, e.g. the EPaCCS or EPR user interface."
* actor[+].actorId = "epaccs"
* actor[=].type = #entity
* actor[=].name = "EPaCCS (Form Manager and Data Repository)"
* actor[=].description = "Holds the Questionnaire, supports $populate and $extract, and persists the QuestionnaireResponse and extracted Observations."
* actor[+].actorId = "docrepo"
* actor[=].type = #entity
* actor[=].name = "Document Repository"
* actor[=].description = "Shared care record (or Single Patient Record) holding the FHIR Document, indexed by a DocumentReference."
* actor[+].actorId = "uec"
* actor[=].type = #entity
* actor[=].name = "Urgent and Emergency Care"
* actor[=].description = "111, 999 and ambulance systems that retrieve the current Document."

// Instances - the resourceIds are the examples in this guide, except the printed copy

* instance[+].resourceId = "PathDocument"
* instance[=].resourceType = #Bundle
* instance[=].name = "Cancer Pathology Report (FHIR Document)"
* instance[=].description = "The histopathology report from the cancer pathway. Its [Primary Cancer Condition](Condition-PathPrimaryCancerCondition.html) pre-populates the primary diagnosis, and is the diagnosis the care plan addresses. The same report as an HL7 v2 ORU_R01 and FHIR Message is on the [HL7 v2](HL7v2.html#laboratory-report-lab-3---histopathology) page. Example: [Bundle/PathDocument](Bundle-PathDocument.html)."
* instance[+].resourceId = "EolTask"
* instance[=].resourceType = #Task
* instance[=].name = "Task - complete end of life care record"
* instance[=].description = "Requests completion of the end of life care record. Task.focus is the Questionnaire; Task.reasonCode is the prognosis from the MDT; Task.owner is the palliative care team. Its outputs are the QuestionnaireResponse and the care plan. Example: [Task/EolTask](Task-EolTask.html)."
* instance[+].resourceId = "PalliativeCareRecordQuestionnaire"
* instance[=].resourceType = #Questionnaire
* instance[=].name = "Palliative Care Record Questionnaire"
* instance[=].description = "The SCCI1580 SDC Questionnaire. Example: [Questionnaire/PalliativeCareRecordQuestionnaire](Questionnaire-PalliativeCareRecordQuestionnaire.html)."
* instance[+].resourceId = "EolQuestionnaireResponse1"
* instance[=].resourceType = #QuestionnaireResponse
* instance[=].name = "QuestionnaireResponse - first completion"
* instance[=].description = "The person's answers, first completion. Example: [QuestionnaireResponse/EolQuestionnaireResponse1](QuestionnaireResponse-EolQuestionnaireResponse1.html)."
* instance[+].resourceId = "EolQuestionnaireResponse2"
* instance[=].resourceType = #QuestionnaireResponse
* instance[=].name = "QuestionnaireResponse - amendment"
* instance[=].description = "The amended answers - hospice now the first choice, prognosis last weeks of life. Example: [QuestionnaireResponse/EolQuestionnaireResponse2](QuestionnaireResponse-EolQuestionnaireResponse2.html)."
* instance[+].resourceId = "EolObs1-36"
* instance[=].resourceType = #Observation
* instance[=].name = "Observations - first completion"
* instance[=].description = "Extracted from the first QuestionnaireResponse, one per coded answer: Observation.code is the SCCI1580 data item, value is the answer, derivedFrom is the QuestionnaireResponse. Demographic, GP and contact answers update Patient, Practitioner and RelatedPerson instead. Shown: preferred place of death 1st choice; all: [1 Consent status](Observation-EolObs1-1.html), [44 Cardiopulmonary resuscitation decision](Observation-EolObs1-44.html), [45 Date of cardiopulmonary resuscitation decision](Observation-EolObs1-45.html), [46 Date for review of cardiopulmonary resuscitation decision](Observation-EolObs1-46.html), [47 Location of cardiopulmonary resuscitation documentation](Observation-EolObs1-47.html), [16 Availability of carer support](Observation-EolObs1-16.html), [14 Need for an interpreter](Observation-EolObs1-14.html), [15 Preferred spoken language](Observation-EolObs1-15.html), [29 Functional status (Australia-modified Karnofsky Performance Status score 0-100)](Observation-EolObs1-29.html), [28 Disability](Observation-EolObs1-28.html), [33 EoLC tool in use](Observation-EolObs1-33.html), [18 Is main carer aware of person's prognosis?](Observation-EolObs1-18.html), [48 Awareness of cardiopulmonary resuscitation decision](Observation-EolObs1-48.html), [34 Likely prognosis](Observation-EolObs1-34.html), [30 Allergies/adverse drug reactions](Observation-EolObs1-30.html), [31 Anticipatory medicines/just in case box issued](Observation-EolObs1-31.html), [32 Location of anticipatory medicines/just in case box](Observation-EolObs1-32.html), [35 Has advance statement](Observation-EolObs1-35.html), [52 Authority of LPA](Observation-EolObs1-52.html), [36 Preferred place of death 1st choice](Observation-EolObs1-36.html), [39 Preferred place of death (1st choice) is usual place of residence](Observation-EolObs1-39.html), [40 Preferred place of death 2nd choice](Observation-EolObs1-40.html), [41 Preferred place of death organisation name (2nd choice)](Observation-EolObs1-41.html), [58 Other relevant issues or preferences about provision of care](Observation-EolObs1-58.html). Example: [Observation/EolObs1-36](Observation-EolObs1-36.html)."
* instance[+].resourceId = "EolObs2-36"
* instance[=].resourceType = #Observation
* instance[=].name = "Observations - amendment"
* instance[=].description = "Extracted from the amended QuestionnaireResponse; the Observations they replace are marked amended. Shown: preferred place of death 1st choice; all: [46 Date for review of cardiopulmonary resuscitation decision](Observation-EolObs2-46.html), [29 Functional status (Australia-modified Karnofsky Performance Status score 0-100)](Observation-EolObs2-29.html), [34 Likely prognosis](Observation-EolObs2-34.html), [36 Preferred place of death 1st choice](Observation-EolObs2-36.html), [39 Preferred place of death (1st choice) is usual place of residence](Observation-EolObs2-39.html), [40 Preferred place of death 2nd choice](Observation-EolObs2-40.html), [58 Other relevant issues or preferences about provision of care](Observation-EolObs2-58.html). Example: [Observation/EolObs2-36](Observation-EolObs2-36.html)."
* instance[+].resourceId = "EolCareTeam"
* instance[=].resourceType = #CareTeam
* instance[=].name = "End of life care team"
* instance[=].description = "The key worker and the care workers involved in care (SCCI1580 items 21-25). Example: [CareTeam/EolCareTeam](CareTeam-EolCareTeam.html)."
* instance[+].resourceId = "EolCarePlan"
* instance[=].resourceType = #CarePlan
* instance[=].name = "End of life care plan"
* instance[=].description = "Created on extraction. CarePlan.addresses the diagnoses - the Primary Cancer Condition from the Cancer Pathology Report, and the liver metastases - and CarePlan.careTeam links to the care team. Example: [CarePlan/EolCarePlan](CarePlan-EolCarePlan.html)."
* instance[+].resourceId = "EolDocument1"
* instance[=].resourceType = #Bundle
* instance[=].name = "Palliative Care Record (FHIR Document) - first issue"
* instance[=].description = "Bundle of type document. The Composition's sections follow the ReSPECT form's section order, and each section's entries are the Observations; each section has a narrative for display. See [What the reader sees](PalliativeCareRecord.html#what-the-reader-sees). Example: [Bundle/EolDocument1](Bundle-EolDocument1.html)."
* instance[+].resourceId = "EolDocument2"
* instance[=].resourceType = #Bundle
* instance[=].name = "Palliative Care Record (FHIR Document) - replacement"
* instance[=].description = "The amended record; Composition.relatesTo code replaces the first issue. Example: [Bundle/EolDocument2](Bundle-EolDocument2.html)."
* instance[+].resourceId = "EolDocumentReference1"
* instance[=].resourceType = #DocumentReference
* instance[=].name = "DocumentReference - first issue (superseded)"
* instance[=].description = "Indexed the first Document; superseded when the replacement is published. Example: [DocumentReference/EolDocumentReference1](DocumentReference-EolDocumentReference1.html)."
* instance[+].resourceId = "EolDocumentReference2"
* instance[=].resourceType = #DocumentReference
* instance[=].name = "DocumentReference - replacement (current)"
* instance[=].description = "Indexes the current Document; relatesTo replaces the first DocumentReference. Example: [DocumentReference/EolDocumentReference2](DocumentReference-EolDocumentReference2.html)."
* instance[+].resourceId = "pdf"
* instance[=].resourceType = #Binary
* instance[=].name = "Printed copy (PDF)"
* instance[=].description = "The Document rendered to PDF with a stylesheet, for the copy kept in the person's home. No example in this guide."
* instance[=].version[+].versionId = "pdf-1"
* instance[=].version[=].description = "Printed from the first Document"
* instance[=].version[+].versionId = "pdf-2"
* instance[=].version[=].description = "Printed from the replacement Document; replaces the copy in the home"

// Process 1 - create

* process[+].title = "Create, share and print the end of life care record"
* process[=].description = "From a poor prognosis on the cancer pathway to a shared Document and printed copy."
* process[=].preConditions = "The person has a cancer diagnosis, and the MDT or treating clinician judges the prognosis to be poor (e.g. last months of life)."
* process[=].postConditions = "A current Palliative Care Record Document is available to urgent and emergency care, and a printed copy is in the person's home."
* process[=].step[+].operation.number = "1"
* process[=].step[=].operation.name = "Raise Task"
* process[=].step[=].operation.initiator = "mdt"
* process[=].step[=].operation.receiver = "epaccs"
* process[=].step[=].operation.description = "The MDT outcome (likely prognosis: last months of life) triggers a Task to complete the end of life care record, owned by the palliative care team."
* process[=].step[=].operation.request.resourceId = "EolTask"
* process[=].step[+].operation.number = "2"
* process[=].step[=].operation.name = "Retrieve Cancer Pathology Report"
* process[=].step[=].operation.initiator = "formfiller"
* process[=].step[=].operation.receiver = "docrepo"
* process[=].step[=].operation.description = "For pre-population, the Form Filler retrieves the Cancer Pathology Report, the source of the primary diagnosis."
* process[=].step[=].operation.response.resourceId = "PathDocument"
* process[=].step[+].operation.number = "3"
* process[=].step[=].operation.name = "Accept Task and populate"
* process[=].step[=].operation.initiator = "formfiller"
* process[=].step[=].operation.receiver = "epaccs"
* process[=].step[=].operation.description = "The clinician accepts the Task. The Form Filler calls Questionnaire $populate, pre-filling demographics, GP, and the primary diagnosis from the Cancer Pathology Report."
* process[=].step[=].operation.request.resourceId = "PalliativeCareRecordQuestionnaire"
* process[=].step[=].operation.response.resourceId = "EolQuestionnaireResponse1"
* process[=].step[+].operation.number = "4"
* process[=].step[=].operation.name = "Conversation and completion"
* process[=].step[=].operation.initiator = "clinician"
* process[=].step[=].operation.receiver = "patient"
* process[=].step[=].operation.description = "Advance care planning conversation with the person and those important to them, following the ReSPECT process. The clinician completes the QuestionnaireResponse."
* process[=].step[+].operation.number = "5"
* process[=].step[=].operation.name = "Submit and extract"
* process[=].step[=].operation.initiator = "formfiller"
* process[=].step[=].operation.receiver = "epaccs"
* process[=].step[=].operation.description = "The completed QuestionnaireResponse is submitted. $extract creates the Observations; Patient and RelatedPerson are updated."
* process[=].step[=].operation.request.resourceId = "EolQuestionnaireResponse1"
* process[=].step[=].operation.response.resourceId = "EolObs1-36"
* process[=].step[+].operation.number = "6"
* process[=].step[=].operation.name = "Create care team and care plan"
* process[=].step[=].operation.initiator = "epaccs"
* process[=].step[=].operation.receiver = "epaccs"
* process[=].step[=].operation.description = "$extract also creates the CareTeam (key worker and care workers) and the CarePlan, which addresses the diagnoses and links to the CareTeam."
* process[=].step[=].operation.request.resourceId = "EolCareTeam"
* process[=].step[=].operation.response.resourceId = "EolCarePlan"
* process[=].step[+].operation.number = "7"
* process[=].step[=].operation.name = "Generate and publish Document"
* process[=].step[=].operation.initiator = "epaccs"
* process[=].step[=].operation.receiver = "docrepo"
* process[=].step[=].operation.description = "The EPaCCS builds the FHIR Document from the Observations - sections in ReSPECT order - and publishes it with a DocumentReference. The Task is completed."
* process[=].step[=].operation.request.resourceId = "EolDocument1"
* process[=].step[=].operation.response.resourceId = "EolDocumentReference1"
* process[=].step[+].operation.number = "8"
* process[=].step[=].operation.name = "Print copy for home"
* process[=].step[=].operation.initiator = "epaccs"
* process[=].step[=].operation.receiver = "patient"
* process[=].step[=].operation.description = "The Document is rendered to PDF with a stylesheet and printed; the copy is kept in the person's home."
* process[=].step[=].operation.request.resourceId = "pdf"
* process[=].step[=].operation.request.versionId = "pdf-1"
* process[=].step[+].operation.number = "9"
* process[=].step[=].operation.name = "Urgent care retrieves Document"
* process[=].step[=].operation.initiator = "uec"
* process[=].step[=].operation.receiver = "docrepo"
* process[=].step[=].operation.description = "A 111 call handler or paramedic finds the DocumentReference and retrieves the current Document."
* process[=].step[=].operation.request.resourceId = "EolDocumentReference1"
* process[=].step[=].operation.response.resourceId = "EolDocument1"

// Process 2 - amend

* process[+].title = "Amend the end of life care record"
* process[=].description = "A change - e.g. a new CPR decision or preferred place of death - is made from the previous answers, producing a replacement Document and printed copy."
* process[=].preConditions = "A current Palliative Care Record Document (first issue) and printed copy exist."
* process[=].postConditions = "The replacement Document replaces the first issue, and the printed copy in the home is replaced."
* process[=].step[+].operation.number = "10"
* process[=].step[=].operation.name = "Populate from previous answers"
* process[=].step[=].operation.initiator = "formfiller"
* process[=].step[=].operation.receiver = "epaccs"
* process[=].step[=].operation.description = "Questionnaire $populate pre-fills the form from the current Observations, so only the changes are entered."
* process[=].step[=].operation.request.resourceId = "EolObs1-36"
* process[=].step[=].operation.response.resourceId = "EolQuestionnaireResponse2"
* process[=].step[+].operation.number = "11"
* process[=].step[=].operation.name = "Amend, submit and extract"
* process[=].step[=].operation.initiator = "formfiller"
* process[=].step[=].operation.receiver = "epaccs"
* process[=].step[=].operation.description = "The clinician makes the amendments with the person. $extract creates new Observations; those they replace are marked amended."
* process[=].step[=].operation.request.resourceId = "EolQuestionnaireResponse2"
* process[=].step[=].operation.response.resourceId = "EolObs2-36"
* process[=].step[+].operation.number = "12"
* process[=].step[=].operation.name = "Publish replacement Document"
* process[=].step[=].operation.initiator = "epaccs"
* process[=].step[=].operation.receiver = "docrepo"
* process[=].step[=].operation.description = "A new Document is generated; its Composition replaces the first, and the new DocumentReference supersedes the previous one."
* process[=].step[=].operation.request.resourceId = "EolDocument2"
* process[=].step[=].operation.response.resourceId = "EolDocumentReference2"
* process[=].step[+].operation.number = "13"
* process[=].step[=].operation.name = "Replace printed copy"
* process[=].step[=].operation.initiator = "epaccs"
* process[=].step[=].operation.receiver = "patient"
* process[=].step[=].operation.description = "The replacement Document is printed; the old copy in the home is removed."
* process[=].step[=].operation.request.resourceId = "pdf"
* process[=].step[=].operation.request.versionId = "pdf-2"
