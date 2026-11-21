// End of Life Care Questionnaire (FHIR SDC).
// Order of precedence: SCCI1580 Palliative Care Co-ordination: Core Content, then
// the PRSB Palliative and End of Life Care Standard (items marked PRSB).
// linkIds are the SCCI1580 data item numbers. Items with a code (SCCI1580 data
// item) are extracted as Observations (SDC observation-based extraction); the
// rest map to resources: demographics and GP to Patient, contacts to RelatedPerson,
// key worker and care workers (21-25) to CareTeam, diagnoses (26-27) to Condition,
// addressed by the end of life care CarePlan.
// Each item's definition points to the EndOfLifeCareRecord logical model.

Alias: $refResource = http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource
Alias: $minValue = http://hl7.org/fhir/StructureDefinition/minValue
Alias: $maxValue = http://hl7.org/fhir/StructureDefinition/maxValue
Alias: $observationExtract = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract

Instance:       EndOfLifeCareQuestionnaire
InstanceOf:     Questionnaire
Title:          "End of Life Care"
Description:    "Proof of concept - not an authoritative source. SCCI1580 Palliative Care Co-ordination: Core Content as an SDC Questionnaire, with PRSB Palliative and End of Life Care Standard items where SCCI1580 is silent. Answers to coded items are extracted as Observations."
Usage:          #definition
* url = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Questionnaire/EndOfLifeCareQuestionnaire"
* name = "EndOfLifeCare"
* title = "End of Life Care"
* status = #draft
* experimental = true
* subjectType = #Patient
* derivedFrom = "https://fhir.nhs.uk/STU3/Questionnaire/CareConnect-EOLC-1"
* description = "Proof of concept - not an authoritative source. SCCI1580 Palliative Care Co-ordination: Core Content (v4.0), then the PRSB Palliative and End of Life Care Standard. linkIds are the SCCI1580 data item numbers."
* extension[+].url = $observationExtract
* extension[=].valueBoolean = true

// 1 Consent

* item[+].linkId = "s1"
* item[=].text = "1 Consent"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.consentStatus"
* item[=]
  * item[+].linkId = "1"
  * item[=].text = "Consent status"
  * item[=].type = #choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.consentStatus"
  * item[=].required = true
  * item[=].code = EOLDataItemCS#1
  * item[=].answerValueSet = Canonical(EOLConsentStatus)

// 2 Record

* item[+].linkId = "s2"
* item[=].text = "2 Record"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.recordCreationDate"
* item[=]
  * item[+].linkId = "2"
  * item[=].text = "Record creation date"
  * item[=].type = #date
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.recordCreationDate"
  * item[=].required = true
  * item[+].linkId = "4"
  * item[=].text = "Date and time of last amendment"
  * item[=].type = #dateTime
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.lastAmended"
  * item[=].required = true

// 3 Plan and requested actions

* item[+].linkId = "s3"
* item[=].text = "3 Plan and requested actions"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.plannedReviewDate"
* item[=]
  * item[+].linkId = "3"
  * item[=].text = "Planned review date"
  * item[=].type = #date
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.plannedReviewDate"
  * item[+].linkId = "cpr"
  * item[=].text = "Cardiopulmonary resuscitation decision"
  * item[=].type = #group
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.cprDecision"
  * item[=]
    * item[+].linkId = "44"
    * item[=].text = "Cardiopulmonary resuscitation decision"
    * item[=].type = #open-choice
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.cprDecision.decision"
    * item[=].code = EOLDataItemCS#44
    * item[=].answerValueSet = Canonical(EOLCPRDecision)
    * item[+].linkId = "45"
    * item[=].text = "Date of cardiopulmonary resuscitation decision"
    * item[=].type = #date
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.cprDecision.date"
    * item[=].code = EOLDataItemCS#45
    * item[+].linkId = "46"
    * item[=].text = "Date for review of cardiopulmonary resuscitation decision"
    * item[=].type = #date
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.cprDecision.reviewDate"
    * item[=].code = EOLDataItemCS#46
    * item[+].linkId = "47"
    * item[=].text = "Location of cardiopulmonary resuscitation documentation"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.cprDecision.documentLocation"
    * item[=].code = EOLDataItemCS#47
    * item[+].linkId = "prsb-cpr-involvement"
    * item[=].text = "Involvement in CPR decision (PRSB)"
    * item[=].type = #group
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.cprDecision.involvement"
    * item[=].repeats = true
    * item[=]
      * item[+].linkId = "prsb-cpr-involvement-name"
      * item[=].text = "Name"
      * item[=].type = #string
      * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.cprDecision.involvement.name"
      * item[+].linkId = "prsb-cpr-involvement-relationship"
      * item[=].text = "Relationship"
      * item[=].type = #open-choice
      * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.cprDecision.involvement.relationship"
      * item[+].linkId = "prsb-cpr-involvement-role"
      * item[=].text = "Role"
      * item[=].type = #string
      * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.cprDecision.involvement.role"
    * item[+].linkId = "prsb-cpr-review"
    * item[=].text = "Responsibility for review (PRSB)"
    * item[=].type = #reference
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.cprDecision.responsibleForReview"
    * item[=].extension[+].url = $refResource
    * item[=].extension[=].valueCode = #Practitioner
    * item[=].extension[+].url = $refResource
    * item[=].extension[=].valueCode = #PractitionerRole

// 4 Person demographics

* item[+].linkId = "s4"
* item[=].text = "4 Person demographics"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.person"
* item[=]
  * item[+].linkId = "5"
  * item[=].text = "Person family name"
  * item[=].type = #string
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.person.familyName"
  * item[=].required = true
  * item[+].linkId = "6"
  * item[=].text = "Person forename"
  * item[=].type = #string
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.person.forename"
  * item[=].required = true
  * item[+].linkId = "7"
  * item[=].text = "Person preferred name"
  * item[=].type = #string
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.person.preferredName"
  * item[+].linkId = "8"
  * item[=].text = "Person birth date"
  * item[=].type = #date
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.person.birthDate"
  * item[=].required = true
  * item[+].linkId = "9"
  * item[=].text = "NHS number"
  * item[=].type = #string
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.person.nhsNumber"
  * item[=].required = true
  * item[+].linkId = "10"
  * item[=].text = "NHS number status indicator code"
  * item[=].type = #open-choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.person.nhsNumberStatus"
  * item[=].required = true
  * item[+].linkId = "11"
  * item[=].text = "Person gender"
  * item[=].type = #choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.person.gender"
  * item[=].answerValueSet = Canonical(EOLPersonGender)
  * item[+].linkId = "12"
  * item[=].text = "Person address"
  * item[=].type = #text
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.person.address"
  * item[=].required = true
  * item[+].linkId = "13"
  * item[=].text = "Person telephone numbers"
  * item[=].type = #string
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.person.telephone"
  * item[=].repeats = true
  * item[+].linkId = "carer"
  * item[=].text = "Main carer"
  * item[=].type = #group
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.mainCarer"
  * item[=]
    * item[+].linkId = "16"
    * item[=].text = "Availability of carer support"
    * item[=].type = #open-choice
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.mainCarer.availability"
    * item[=].required = true
    * item[=].code = EOLDataItemCS#16
    * item[=].answerValueSet = Canonical(EOLCarerAvailability)
    * item[+].linkId = "16.name"
    * item[=].text = "Main carer name"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.mainCarer.name"
    * item[+].linkId = "17"
    * item[=].text = "Main carer telephone numbers"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.mainCarer.telephone"
    * item[=].repeats = true

// 5 Special requirements

* item[+].linkId = "s5"
* item[=].text = "5 Special requirements"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.interpreterNeeded"
* item[=]
  * item[+].linkId = "14"
  * item[=].text = "Need for an interpreter"
  * item[=].type = #choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.interpreterNeeded"
  * item[=].code = EOLDataItemCS#14
  * item[=].answerValueSet = Canonical(EOLInterpreterNeeded)
  * item[+].linkId = "15"
  * item[=].text = "Preferred spoken language"
  * item[=].type = #open-choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.preferredLanguage"
  * item[=].code = EOLDataItemCS#15
  * item[+].linkId = "29"
  * item[=].text = "Functional status (Australia-modified Karnofsky Performance Status score 0-100)"
  * item[=].type = #integer
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.functionalStatus"
  * item[=].code = EOLDataItemCS#29
  * item[=].extension[+].url = $minValue
  * item[=].extension[=].valueInteger = 0
  * item[=].extension[+].url = $maxValue
  * item[=].extension[=].valueInteger = 100
  * item[+].linkId = "28"
  * item[=].text = "Disability"
  * item[=].type = #open-choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.disability"
  * item[=].repeats = true
  * item[=].code = EOLDataItemCS#28
  * item[=].answerValueSet = Canonical(EOLDisability)
  * item[+].linkId = "33"
  * item[=].text = "EoLC tool in use"
  * item[=].type = #open-choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.eolcToolInUse"
  * item[=].repeats = true
  * item[=].code = EOLDataItemCS#33
  * item[=].answerValueSet = Canonical(EOLToolInUse)
  * item[+].linkId = "prsb-register"
  * item[=].text = "Person is on the palliative care register (PRSB)"
  * item[=].type = #choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.palliativeCareRegister"
  * item[=].answerValueSet = Canonical(EOLRegister)

// 6 Information and advice given

* item[+].linkId = "s6"
* item[=].text = "6 Information and advice given"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.carerAwareOfPrognosis"
* item[=]
  * item[+].linkId = "18"
  * item[=].text = "Is main carer aware of person's prognosis?"
  * item[=].type = #choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.carerAwareOfPrognosis"
  * item[=].code = EOLDataItemCS#18
  * item[=].answerValueSet = Canonical(EOLCarerAwareOfPrognosis)
  * item[+].linkId = "48"
  * item[=].text = "Awareness of cardiopulmonary resuscitation decision"
  * item[=].type = #choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.cprDecisionAwareness"
  * item[=].repeats = true
  * item[=].code = EOLDataItemCS#48
  * item[=].answerValueSet = Canonical(EOLCPRAwareness)

// 7 GP practice

* item[+].linkId = "s7"
* item[=].text = "7 GP practice"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.gp"
* item[=]
  * item[+].linkId = "19"
  * item[=].text = "Usual GP name"
  * item[=].type = #string
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.gp.name"
  * item[=].required = true
  * item[+].linkId = "20"
  * item[=].text = "Practice details (ODS code)"
  * item[=].type = #string
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.gp.practice"
  * item[=].required = true

// 8 Key worker

* item[+].linkId = "s8"
* item[=].text = "8 Key worker"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.keyWorker"
* item[=]
  * item[+].linkId = "21"
  * item[=].text = "Key worker name if not usual GP"
  * item[=].type = #string
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.keyWorker.name"
  * item[+].linkId = "22"
  * item[=].text = "Key worker telephone number"
  * item[=].type = #string
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.keyWorker.telephone"

// 9 Services and care

* item[+].linkId = "s9"
* item[=].text = "9 Services and care"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.careWorker"
* item[=].repeats = true
* item[=]
  * item[+].linkId = "23"
  * item[=].text = "Care workers involved in care: name"
  * item[=].type = #string
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.careWorker.name"
  * item[+].linkId = "24"
  * item[=].text = "Care workers involved in care: professional group"
  * item[=].type = #open-choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.careWorker.professionalGroup"
  * item[=].answerValueSet = Canonical(EOLCareWorkerGroup)
  * item[+].linkId = "25"
  * item[=].text = "Telephone numbers for care workers involved in care"
  * item[=].type = #string
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.careWorker.telephone"
  * item[=].repeats = true

// 10 Diagnoses

* item[+].linkId = "s10"
* item[=].text = "10 Diagnoses"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.primaryDiagnosis"
* item[=]
  * item[+].linkId = "26"
  * item[=].text = "Primary end of life care diagnosis"
  * item[=].type = #open-choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.primaryDiagnosis"
  * item[=].required = true
  * item[=].answerValueSet = "http://snomed.info/sct?fhir_vs"
  * item[+].linkId = "27"
  * item[=].text = "Other relevant end of life care diagnoses and clinical issues"
  * item[=].type = #open-choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.otherDiagnosis"
  * item[=].repeats = true
  * item[=].answerValueSet = "http://snomed.info/sct?fhir_vs"
  * item[+].linkId = "34"
  * item[=].text = "Likely prognosis"
  * item[=].type = #choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.likelyPrognosis"
  * item[=].code = EOLDataItemCS#34
  * item[=].answerValueSet = Canonical(EOLLikelyPrognosis)

// 11 Allergies or adverse reactions

* item[+].linkId = "s11"
* item[=].text = "11 Allergies or adverse reactions"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.allergy"
* item[=]
  * item[+].linkId = "30"
  * item[=].text = "Allergies/adverse drug reactions"
  * item[=].type = #open-choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.allergy"
  * item[=].repeats = true
  * item[=].code = EOLDataItemCS#30
  * item[=].answerValueSet = "http://snomed.info/sct?fhir_vs"

// 12 Medications and medical devices

* item[+].linkId = "s12"
* item[=].text = "12 Medications and medical devices"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.anticipatoryMedicines"
* item[=]
  * item[+].linkId = "31"
  * item[=].text = "Anticipatory medicines/just in case box issued"
  * item[=].type = #choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.anticipatoryMedicines"
  * item[=].code = EOLDataItemCS#31
  * item[=].answerValueSet = Canonical(EOLAnticipatoryMedicines)
  * item[+].linkId = "32"
  * item[=].text = "Location of anticipatory medicines/just in case box"
  * item[=].type = #string
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.anticipatoryMedicinesLocation"
  * item[=].code = EOLDataItemCS#32

// 13 Legal information

* item[+].linkId = "s13"
* item[=].text = "13 Legal information"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.advanceStatement"
* item[=]
  * item[+].linkId = "advance-statement"
  * item[=].text = "Advance statement"
  * item[=].type = #group
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.advanceStatement"
  * item[=]
    * item[+].linkId = "35"
    * item[=].text = "Has advance statement"
    * item[=].type = #choice
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.advanceStatement.code"
    * item[=].code = EOLDataItemCS#35
    * item[=].answerValueSet = Canonical(EOLAdvanceStatement)
    * item[+].linkId = "35.text"
    * item[=].text = "Advance statement requests and preferences"
    * item[=].type = #text
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.advanceStatement.requestsAndPreferences"
    * item[+].linkId = "prsb-advance-statement-location"
    * item[=].text = "Location of document (PRSB)"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.advanceStatement.documentLocation"
  * item[+].linkId = "adrt"
  * item[=].text = "Advance decision to refuse treatment"
  * item[=].type = #group
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.adrt"
  * item[=]
    * item[+].linkId = "49"
    * item[=].text = "Person has made an advance decision to refuse treatment"
    * item[=].type = #choice
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.adrt.decision"
    * item[=].code = EOLDataItemCS#49
    * item[=].answerValueSet = Canonical(EOLADRT)
    * item[+].linkId = "50"
    * item[=].text = "Location of advance decision to refuse treatment documentation"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.adrt.documentLocation"
    * item[=].code = EOLDataItemCS#50
  * item[+].linkId = "lpa"
  * item[=].text = "Lasting power of attorney for personal welfare"
  * item[=].type = #group
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.lastingPowerOfAttorney"
  * item[=]
    * item[+].linkId = "51"
    * item[=].text = "Name of Lasting Power of Attorney for personal welfare"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.lastingPowerOfAttorney.name"
    * item[+].linkId = "52"
    * item[=].text = "Authority of LPA"
    * item[=].type = #choice
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.lastingPowerOfAttorney.authority"
    * item[=].code = EOLDataItemCS#52
    * item[=].answerValueSet = Canonical(EOLLPAAuthority)
    * item[+].linkId = "53"
    * item[=].text = "Telephone number(s) concerning Lasting Power of Attorney"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.lastingPowerOfAttorney.telephone"
    * item[=].repeats = true
    * item[+].linkId = "prsb-lpa-relationship"
    * item[=].text = "Relationship (PRSB)"
    * item[=].type = #open-choice
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.lastingPowerOfAttorney.relationship"
    * item[+].linkId = "prsb-lpa-location"
    * item[=].text = "Location of document (PRSB)"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.lastingPowerOfAttorney.documentLocation"
  * item[+].linkId = "prsb-mca"
  * item[=].text = "Mental capacity assessment (PRSB)"
  * item[=].type = #group
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.mentalCapacityAssessment"
  * item[=].repeats = true
  * item[=]
    * item[+].linkId = "prsb-mca-assessment"
    * item[=].text = "Mental capacity assessment"
    * item[=].type = #text
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.mentalCapacityAssessment.assessment"
    * item[+].linkId = "prsb-mca-location"
    * item[=].text = "Location of document"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.mentalCapacityAssessment.documentLocation"

// 14 Person and carers' concerns, expectations and wishes

* item[+].linkId = "s14"
* item[=].text = "14 Person and carers' concerns, expectations and wishes"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.preferredPlaceOfDeath"
* item[=]
  * item[+].linkId = "ppd1"
  * item[=].text = "Preferred place of death 1st choice"
  * item[=].type = #group
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.preferredPlaceOfDeath"
  * item[=]
    * item[+].linkId = "36"
    * item[=].text = "Preferred place of death 1st choice"
    * item[=].type = #open-choice
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.preferredPlaceOfDeath.type"
    * item[=].code = EOLDataItemCS#36
    * item[=].answerValueSet = Canonical(EOLPreferredPlaceOfDeath)
    * item[+].linkId = "37"
    * item[=].text = "Preferred place of death organisation name (1st choice)"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.preferredPlaceOfDeath.organisationName"
    * item[=].code = EOLDataItemCS#37
    * item[+].linkId = "38"
    * item[=].text = "Preferred place of death address (1st choice)"
    * item[=].type = #text
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.preferredPlaceOfDeath.address"
    * item[=].code = EOLDataItemCS#38
    * item[+].linkId = "39"
    * item[=].text = "Preferred place of death (1st choice) is usual place of residence"
    * item[=].type = #boolean
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.preferredPlaceOfDeath.isUsualPlaceOfResidence"
    * item[=].code = EOLDataItemCS#39
  * item[+].linkId = "ppd2"
  * item[=].text = "Preferred place of death 2nd choice"
  * item[=].type = #group
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.preferredPlaceOfDeath"
  * item[=]
    * item[+].linkId = "40"
    * item[=].text = "Preferred place of death 2nd choice"
    * item[=].type = #open-choice
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.preferredPlaceOfDeath.type"
    * item[=].code = EOLDataItemCS#40
    * item[=].answerValueSet = Canonical(EOLPreferredPlaceOfDeath)
    * item[+].linkId = "41"
    * item[=].text = "Preferred place of death organisation name (2nd choice)"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.preferredPlaceOfDeath.organisationName"
    * item[=].code = EOLDataItemCS#41
    * item[+].linkId = "42"
    * item[=].text = "Preferred place of death address (2nd choice)"
    * item[=].type = #text
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.preferredPlaceOfDeath.address"
    * item[=].code = EOLDataItemCS#42
    * item[+].linkId = "43"
    * item[=].text = "Preferred place of death (2nd choice) is usual place of residence"
    * item[=].type = #boolean
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.preferredPlaceOfDeath.isUsualPlaceOfResidence"
    * item[=].code = EOLDataItemCS#43
  * item[+].linkId = "decisions1"
  * item[=].text = "Additional person to be involved in decisions (1)"
  * item[=].type = #group
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.personInvolvedInDecisions"
  * item[=]
    * item[+].linkId = "54"
    * item[=].text = "Name of additional person to be involved in decisions (1)"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.personInvolvedInDecisions.name"
    * item[+].linkId = "55"
    * item[=].text = "Telephone number of person (1) to be involved in decisions"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.personInvolvedInDecisions.telephone"
  * item[+].linkId = "decisions2"
  * item[=].text = "Additional person to be involved in decisions (2)"
  * item[=].type = #group
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.personInvolvedInDecisions"
  * item[=]
    * item[+].linkId = "56"
    * item[=].text = "Name of additional person to be involved in decisions (2)"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.personInvolvedInDecisions.name"
    * item[+].linkId = "57"
    * item[=].text = "Telephone number of person (2) to be involved in decisions"
    * item[=].type = #string
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.personInvolvedInDecisions.telephone"
  * item[+].linkId = "58"
  * item[=].text = "Other relevant issues or preferences about provision of care"
  * item[=].type = #text
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.otherIssuesOrPreferences"
  * item[=].code = EOLDataItemCS#58
  * item[+].linkId = "prsb-contingency"
  * item[=].text = "Contingency plans (PRSB)"
  * item[=].type = #group
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.contingencyPlan"
  * item[=].repeats = true
  * item[=]
    * item[+].linkId = "prsb-contingency-name"
    * item[=].text = "Contingency plan name"
    * item[=].type = #open-choice
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.contingencyPlan.name"
    * item[+].linkId = "prsb-contingency-trigger"
    * item[=].text = "Trigger factors"
    * item[=].type = #text
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.contingencyPlan.triggerFactors"
    * item[+].linkId = "prsb-contingency-action"
    * item[=].text = "What should happen"
    * item[=].type = #text
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.contingencyPlan.whatShouldHappen"
    * item[+].linkId = "prsb-contingency-updated"
    * item[=].text = "Date this plan was last updated"
    * item[=].type = #date
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.contingencyPlan.lastUpdated"
    * item[+].linkId = "prsb-contingency-review"
    * item[=].text = "Planned review date"
    * item[=].type = #date
    * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.contingencyPlan.plannedReview"

// 15 and 16 After death

* item[+].linkId = "s15"
* item[=].text = "15 and 16 After death"
* item[=].type = #group
* item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.dateOfDeath"
* item[=]
  * item[+].linkId = "60"
  * item[=].text = "Actual place of death"
  * item[=].type = #choice
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.actualPlaceOfDeath"
  * item[=].code = EOLDataItemCS#60
  * item[=].answerValueSet = Canonical(EOLActualPlaceOfDeath)
  * item[+].linkId = "59"
  * item[=].text = "Date of death"
  * item[=].type = #date
  * item[=].definition = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/EndOfLifeCareRecord#EndOfLifeCareRecord.dateOfDeath"
  * item[=].code = EOLDataItemCS#59
