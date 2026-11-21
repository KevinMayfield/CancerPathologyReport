// End of Life Care Document - Composition sections in the ReSPECT form's section
// order, entries are the Observations extracted from the Questionnaire.

CodeSystem:     EOLDocumentSectionCS
Id:             eol-document-section
Title:          "End of Life Care Document Section"
Description:    "Proof of concept - not an authoritative source. Sections of the End of Life Care Document. Sections 1 to 9 follow the section order and headings of the ReSPECT form (version 3, Resuscitation Council UK, licensed CC BY-NC-ND 4.0); only the headings are used. Two further sections hold SCCI1580 content not on the ReSPECT form. A local code system - no published section codes were found."
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

Profile:        EndOfLifeCareObservation
Parent:         Observation
Id:             EndOfLifeCareObservation
Title:          "End of Life Care Observation"
Description:    """
**Proof of concept - not an authoritative source.**

One answer from the [End of Life Care Questionnaire](Questionnaire-EndOfLifeCareQuestionnaire.html),
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

Profile:        EndOfLifeCareComposition
Parent:         Composition
Id:             EndOfLifeCareComposition
Title:          "End of Life Care Composition"
Description:    """
**Proof of concept - not an authoritative source.**

The Composition of the End of Life Care Document - the shared and printable form of
the [End of Life Care Record](StructureDefinition-EndOfLifeCareRecord.html)
(SCCI1580 Palliative Care Co-ordination: Core Content). Its sections follow the
**ReSPECT form's section order**, so the rendered and printed record reads like the
form clinicians and families know; each section has a narrative for display and the
extracted [Observations](StructureDefinition-EndOfLifeCareObservation.html) as
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
* section.entry only Reference(EndOfLifeCareObservation or Patient or RelatedPerson or Practitioner or PractitionerRole or Organization)
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
