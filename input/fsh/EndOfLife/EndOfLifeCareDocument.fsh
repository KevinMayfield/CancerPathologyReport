// Palliative Care Record Document - Composition sections in the ReSPECT form's section
// order, entries are the Observations extracted from the Questionnaire.

CodeSystem:     EOLDocumentSectionCS
Id:             eol-document-section
Title:          "Palliative Care Record Section"
Description:    "Proof of concept - not an authoritative source. Sections of the Palliative Care Record Document. Sections 1 to 9 follow the section order and headings of the ReSPECT form (version 3, Resuscitation Council UK, licensed CC BY-NC-ND 4.0); only the headings are used. Two further sections hold SCCI1580 content not on the ReSPECT form. A local code system - no published section codes were found."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete
* #respect-1 "This plan belongs to" "Demographics - SCCI1580 items 5-13"
* #respect-2 "Shared understanding of my health and current condition" "Diagnoses, prognosis, disability, functional status, allergies, anticipatory medicines and other care planning documents - SCCI1580 items 26-35, 49-53"
* #respect-3 "What matters to me in decisions about my treatment and care" "Preferred place of death and other preferences - SCCI1580 items 35-43, 58"
* #respect-4 "Clinical recommendations for emergency care and treatment" "CPR decision and contingency plans - SCCI1580 items 44-47, PRSB contingency plans"
* #respect-5 "Capacity for involvement in making this plan" "Consent status and mental capacity assessment - SCCI1580 item 1, PRSB"
* #respect-6 "Involvement in making this plan" "Awareness of the CPR decision and prognosis - SCCI1580 items 18, 48, PRSB involvement"
* #respect-7 "Clinicians' signatures" "Clinicians recording and endorsing the plan - Composition.author and attester"
* #respect-8 "Emergency contacts and those involved in discussing this plan" "Main carer, others involved in decisions, LPA, GP, key worker, care workers - SCCI1580 items 16-25, 51-57"
* #respect-9 "Form reviewed and remains relevant" "Review and amendment dates - SCCI1580 items 3, 4, 46"
* #after-death "After death" "Date and actual place of death - SCCI1580 items 59-60"

ValueSet:       EOLDataItem
Id:             scci1580-data-item
Title:          "SCCI1580 Data Item"
Description:    "Proof of concept - not an authoritative source. All SCCI1580 data items."
* ^status = #draft
* ^experimental = true
* include codes from system EOLDataItemCS

Profile:        PalliativeCareRecordObservation
Parent:         Observation
Id:             PalliativeCareRecordObservation
Title:          "Palliative Care Record Observation"
Description:    """
**Proof of concept - not an authoritative source.**

One answer from the [Palliative Care Record Questionnaire](Questionnaire-PalliativeCareRecordQuestionnaire.html),
extracted by SDC observation-based extraction. `code` is the SCCI1580 data item and
`value[x]` the answer; `derivedFrom` is the QuestionnaireResponse. When the record is
amended, the Observation is updated with status `amended`.
"""
* ^experimental = true
* status MS
* status ^short = "final, or amended after an amendment of the record"
* code MS
* code from EOLDataItem (extensible)
* code ^short = "SCCI1580 data item"
* subject 1..1 MS
* subject only Reference(Patient)
* effective[x] MS
* effective[x] only dateTime
* performer MS
* performer ^short = "Professional recording the answer"
* value[x] MS
* derivedFrom MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "The QuestionnaireResponse the answer was extracted from"

Profile:        PalliativeCareTeam
Parent:         CareTeam
Id:             PalliativeCareTeam
Title:          "Palliative Care Team"
Description:    """
**Proof of concept - not an authoritative source.**

The people and services caring for the person: the key worker (SCCI1580 items
21-22) and the care workers involved in care (items 23-25). Referenced by the
[Palliative Care Plan](StructureDefinition-PalliativeCarePlan.html).
"""
* ^experimental = true
* status MS
* subject 1..1 MS
* subject only Reference(Patient)
* participant 1..* MS
* participant.role 1..* MS
* participant.role ^short = "Key worker, or professional group (SCCI1580 item 24)"
* participant.role from EOLCareTeamRole (extensible)
* participant.member 1..1 MS
* participant.member only Reference(Practitioner or PractitionerRole or Organization or CareTeam)
* participant.member ^short = "Key worker or care worker name (SCCI1580 items 21, 23); telephone (22, 25) on the Practitioner or Organization"

ValueSet:       EOLCareTeamRole
Id:             eol-care-team-role
Title:          "Palliative Care Team Role"
Description:    "Proof of concept - not an authoritative source. The key worker (SCCI1580 item 21, coded here with 719240009 Has end of life care key worker) and the care worker professional groups (SCCI1580 item 24)."
* ^status = #draft
* ^experimental = true
* http://snomed.info/sct#719240009 "Has end of life care key worker"
* include codes from valueset EOLCareWorkerGroup

Profile:        PalliativeCarePlan
Parent:         CarePlan
Id:             PalliativeCarePlan
Title:          "Palliative Care Plan"
Description:    """
**Proof of concept - not an authoritative source.**

The person's end of life care plan. It `addresses` the diagnoses - the primary end
of life care diagnosis (SCCI1580 item 26) and other relevant diagnoses and clinical
issues (item 27) - and links to the [care team](StructureDefinition-PalliativeCareTeam.html)
(items 21-25). The plan's content - preferences, CPR decision, legal information -
is held as [Observations](StructureDefinition-PalliativeCareRecordObservation.html) in
`supportingInfo`.
"""
* ^experimental = true
* status MS
* intent = #plan
* category 1..* MS
* category = http://snomed.info/sct#773981004 "Palliative care plan"
* subject 1..1 MS
* subject only Reference(Patient)
* period MS
* period.start ^short = "Record creation date (SCCI1580 item 2)"
* period.end ^short = "Date of death (SCCI1580 item 59), when the plan ends"
* created MS
* author MS
* careTeam 0..* MS
* careTeam only Reference(PalliativeCareTeam)
* careTeam ^short = "Key worker and care workers (SCCI1580 items 21-25)"
* addresses 1..* MS
* addresses ^short = "Primary end of life care diagnosis (SCCI1580 item 26) first, then other diagnoses and clinical issues (item 27)"
* addresses ^comment = "For a person on the cancer pathway, the primary diagnosis can be the Primary Cancer Condition recorded by the Cancer Pathology Report."
* supportingInfo MS
* supportingInfo only Reference(PalliativeCareRecordObservation or RelatedPerson)
* supportingInfo ^short = "The extracted answers, and the persons involved"

RuleSet: IPSSubsectionSlicing(parent)
* section[{parent}].section ^slicing.discriminator.type = #pattern
* section[{parent}].section ^slicing.discriminator.path = "code"
* section[{parent}].section ^slicing.rules = #open
* section[{parent}].section ^short = "Subsections, coded with International Patient Summary section codes where the content matches"

Profile:        PalliativeCareRecordComposition
Parent:         Composition
Id:             PalliativeCareRecordComposition
Title:          "Palliative Care Record Composition"
Description:    """
**Proof of concept - not an authoritative source.**

The Composition of the Palliative Care Record Document - the shared and printable form of
the [Palliative Care Record](StructureDefinition-PalliativeCareRecord.html)
(SCCI1580 Palliative Care Co-ordination: Core Content). Its sections follow the
**ReSPECT form's section order**, so the rendered and printed record reads like the
form clinicians and families know; each section has a narrative for display and the
extracted [Observations](StructureDefinition-PalliativeCareRecordObservation.html) as
entries. An amended record is a new Composition that `replaces` the previous one.
"""
* ^experimental = true
* type = http://snomed.info/sct#861421000000109 "End of Life Care Coordination Summary"
* subject 1..1 MS
* subject only Reference(Patient)
* date MS
* date ^short = "Date and time of last amendment (SCCI1580 item 4)"
* author MS
* author ^short = "Clinician completing the record"
* attester MS
* attester ^short = "Clinicians' signatures (ReSPECT section 7)"
* custodian MS
* custodian ^short = "Organisation holding the EPaCCS record"
* relatesTo MS
* relatesTo ^short = "For an amendment: code = replaces, target = the previous Composition"
* event MS
* event.detail ^short = "The Task and QuestionnaireResponse the document was produced from"

* section 1..* MS
* section ^slicing.discriminator.type = #pattern
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #closed
* section ^slicing.ordered = true
* section.code 1..1
* section.text 1..1
* section.entry only Reference(PalliativeCareRecordObservation or PalliativeCarePlan or PalliativeCareTeam or Condition or AllergyIntolerance or MedicationStatement or Consent or DocumentReference or Patient or RelatedPerson or Practitioner or PractitionerRole or Organization)
* section contains
    planBelongsTo 1..1 MS and
    sharedUnderstanding 0..1 MS and
    whatMattersToMe 0..1 MS and
    clinicalRecommendations 0..1 MS and
    capacity 0..1 MS and
    involvement 0..1 MS and
    clinicianSignatures 0..1 MS and
    emergencyContacts 0..1 MS and
    formReviewed 0..1 MS and
    afterDeath 0..1 MS
* section[planBelongsTo].code = EOLDocumentSectionCS#respect-1
* section[sharedUnderstanding].code = EOLDocumentSectionCS#respect-2
* section[whatMattersToMe].code = EOLDocumentSectionCS#respect-3
* section[clinicalRecommendations].code = EOLDocumentSectionCS#respect-4
* section[capacity].code = EOLDocumentSectionCS#respect-5
* section[involvement].code = EOLDocumentSectionCS#respect-6
* section[clinicianSignatures].code = EOLDocumentSectionCS#respect-7
* section[emergencyContacts].code = EOLDocumentSectionCS#respect-8
* section[formReviewed].code = EOLDocumentSectionCS#respect-9
* section[afterDeath].code = EOLDocumentSectionCS#after-death

// IPS-coded subsections: where a ReSPECT section's content matches an
// International Patient Summary section, it is a subsection with the IPS LOINC
// section code (reuse of the codes, not IPS conformance).

* insert IPSSubsectionSlicing(sharedUnderstanding)
* section[sharedUnderstanding].section contains
    problems 0..1 MS and
    allergies 0..1 MS and
    medications 0..1 MS and
    functionalStatus 0..1 MS and
    advanceDirectives 0..1 MS
* section[sharedUnderstanding].section[problems].code = $loinc#11450-4 "Problem list - Reported"
* section[sharedUnderstanding].section[problems] ^short = "IPS Problems - SCCI1580 items 26, 27 (Conditions addressed by the care plan)"
* section[sharedUnderstanding].section[problems].text 1..1
* section[sharedUnderstanding].section[allergies].code = $loinc#48765-2 "Allergies and adverse reactions Document"
* section[sharedUnderstanding].section[allergies] ^short = "IPS Allergies and Intolerances - SCCI1580 item 30"
* section[sharedUnderstanding].section[allergies].text 1..1
* section[sharedUnderstanding].section[medications].code = $loinc#10160-0 "History of Medication use Narrative"
* section[sharedUnderstanding].section[medications] ^short = "IPS Medication Summary - anticipatory medicines, SCCI1580 items 31, 32"
* section[sharedUnderstanding].section[medications].text 1..1
* section[sharedUnderstanding].section[functionalStatus].code = $loinc#47420-5 "Functional Status Assessment Note"
* section[sharedUnderstanding].section[functionalStatus] ^short = "IPS Functional Status - SCCI1580 items 29, 28"
* section[sharedUnderstanding].section[functionalStatus].text 1..1
* section[sharedUnderstanding].section[advanceDirectives].code = $loinc#42348-3 "Advance Healthcare Directives"
* section[sharedUnderstanding].section[advanceDirectives] ^short = "IPS Advance Directives - advance statement, ADRT, LPA, SCCI1580 items 35, 49-52"
* section[sharedUnderstanding].section[advanceDirectives].text 1..1

* insert IPSSubsectionSlicing(whatMattersToMe)
* section[whatMattersToMe].section contains patientStory 0..1 MS
* section[whatMattersToMe].section[patientStory].code = $loinc#81338-6 "Patient Goals, Preferences, and Priorities for Care Experience"
* section[whatMattersToMe].section[patientStory] ^short = "IPS Patient Story - preferences, SCCI1580 items 35-43, 58"
* section[whatMattersToMe].section[patientStory].text 1..1

* insert IPSSubsectionSlicing(clinicalRecommendations)
* section[clinicalRecommendations].section contains planOfCare 0..1 MS
* section[clinicalRecommendations].section[planOfCare].code = $loinc#18776-5 "Plan of Care Note"
* section[clinicalRecommendations].section[planOfCare] ^short = "IPS Plan of Care - the palliative care plan and contingency plans"
* section[clinicalRecommendations].section[planOfCare].text 1..1

* insert IPSSubsectionSlicing(emergencyContacts)
* section[emergencyContacts].section contains socialHistory 0..1 MS
* section[emergencyContacts].section[socialHistory].code = $loinc#29762-2 "Social history note"
* section[emergencyContacts].section[socialHistory] ^short = "IPS Social History - main carer and availability of carer support, SCCI1580 items 16, 17"
* section[emergencyContacts].section[socialHistory].text 1..1

// Which resources each section holds

* section[planBelongsTo].entry only Reference(Patient)
* section[planBelongsTo].entry ^short = "The Patient - demographics, SCCI1580 items 5-13"
* section[sharedUnderstanding].entry only Reference(PalliativeCareRecordObservation)
* section[sharedUnderstanding].entry ^short = "Observations - likely prognosis (34), EoLC tool in use (33), palliative care register"
* section[sharedUnderstanding].section[problems].entry only Reference(Condition)
* section[sharedUnderstanding].section[problems].entry ^short = "Conditions addressed by the care plan - primary and other diagnoses (26, 27)"
* section[sharedUnderstanding].section[allergies].entry only Reference(PalliativeCareRecordObservation or AllergyIntolerance)
* section[sharedUnderstanding].section[allergies].entry ^short = "Observation (30), or AllergyIntolerance as in IPS"
* section[sharedUnderstanding].section[medications].entry only Reference(PalliativeCareRecordObservation or MedicationStatement)
* section[sharedUnderstanding].section[medications].entry ^short = "Observations - anticipatory medicines issued and location (31, 32), or MedicationStatement as in IPS"
* section[sharedUnderstanding].section[functionalStatus].entry only Reference(PalliativeCareRecordObservation)
* section[sharedUnderstanding].section[functionalStatus].entry ^short = "Observations - functional status (29), disability (28)"
* section[sharedUnderstanding].section[advanceDirectives].entry only Reference(PalliativeCareRecordObservation or Consent or DocumentReference)
* section[sharedUnderstanding].section[advanceDirectives].entry ^short = "Observations - advance statement, ADRT, LPA authority (35, 49, 50, 52); Consent or DocumentReference as in IPS"
* section[whatMattersToMe].entry 0..0
* section[whatMattersToMe].section[patientStory].entry only Reference(PalliativeCareRecordObservation)
* section[whatMattersToMe].section[patientStory].entry ^short = "Observations - preferred place of death and other preferences (36-43, 58)"
* section[clinicalRecommendations].entry only Reference(PalliativeCareRecordObservation)
* section[clinicalRecommendations].entry ^short = "Observations - CPR decision, date and document location (44, 45, 47)"
* section[clinicalRecommendations].section[planOfCare].entry only Reference(PalliativeCarePlan)
* section[clinicalRecommendations].section[planOfCare].entry ^short = "The palliative care plan (with the care team and contingency plans)"
* section[capacity].entry only Reference(PalliativeCareRecordObservation)
* section[capacity].entry ^short = "Observation - consent status (1)"
* section[involvement].entry only Reference(PalliativeCareRecordObservation or RelatedPerson)
* section[involvement].entry ^short = "Observations - awareness of CPR decision and prognosis (48, 18); persons involved"
* section[clinicianSignatures].entry only Reference(Practitioner or PractitionerRole)
* section[clinicianSignatures].entry ^short = "The clinicians - also Composition.author and attester"
* section[emergencyContacts].entry only Reference(PalliativeCareTeam or RelatedPerson or Practitioner or PractitionerRole or Organization)
* section[emergencyContacts].entry ^short = "Care team (21-25), LPA and others involved in decisions (51-57), GP (19-20)"
* section[emergencyContacts].section[socialHistory].entry only Reference(PalliativeCareRecordObservation or RelatedPerson)
* section[emergencyContacts].section[socialHistory].entry ^short = "Main carer - availability of carer support (16) and RelatedPerson (16, 17)"
* section[formReviewed].entry only Reference(PalliativeCareRecordObservation)
* section[formReviewed].entry ^short = "Observation - CPR review date (46); planned review date (3) and last amended (4) are in the narrative and Composition.date"
* section[afterDeath].entry only Reference(PalliativeCareRecordObservation)
* section[afterDeath].entry ^short = "Observations - date and actual place of death (59, 60)"

