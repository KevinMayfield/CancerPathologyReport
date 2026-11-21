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
* section.entry only Reference(PalliativeCareRecordObservation or PalliativeCarePlan or PalliativeCareTeam or Condition or Patient or RelatedPerson or Practitioner or PractitionerRole or Organization)
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
