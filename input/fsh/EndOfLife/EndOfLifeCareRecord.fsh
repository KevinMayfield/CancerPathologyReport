Logical:        EndOfLifeCareRecord
Id:             EndOfLifeCareRecord
Title:          "End of Life Care Record"
Description:    """
**Proof of concept - not an authoritative source.**

The core content of an electronic palliative care co-ordination (EPaCCS) record.
Sources, in order of precedence:

1. **SCCI1580 Palliative Care Co-ordination: Core Content** (Amd 11/2015, v4.0,
   with the January 2016 corrigendum) - the 16 sections and 60 data items. Each
   element shows its SCCI1580 data item number, and cardinality follows the SCCI1580
   data entry status (Mandatory 1.., Required and Optional 0..).
2. **PRSB Palliative and End of Life Care Standard** (build 11.0) - only for content
   SCCI1580 does not define, marked **(PRSB)**.

The NHS Digital End of Life Care API (alpha, FHIR STU3, 2019) is shown as a mapping.
See [End of Life Care](EndOfLifeCare.html).
"""
Characteristics: #can-be-target

* ^experimental = true

// 1 Consent

* consentStatus 1..1 CodeableConcept "Consent status (1)" "How consent to create and share the record was given - explicit, best interests decision or lasting power of attorney - or that it was withdrawn. Mandatory"
* consentStatus from EOLConsentStatus (extensible)

// 2 Record creation and amendment

* recordCreationDate 1..1 date "Record creation date (2)" "Date the record was created. Mandatory"
* lastAmended 1..1 dateTime "Date and time of last amendment (4)" "Date and time the record was last amended. Mandatory"

// 3 Plan and requested actions

* plannedReviewDate 0..1 date "Planned review date (3)" "Date the record should next be reviewed. Required"
* cprDecision 0..1 BackboneElement "Cardiopulmonary resuscitation decision" "Whether a decision has been made, the decision, date of decision, location of the documentation and date for review (SCCI1580 section 3)"
  * decision 0..1 CodeableConcept "Cardiopulmonary resuscitation decision (44)" "For or not for CPR; 'resuscitation status unknown' as text. Optional"
  * decision from EOLCPRDecision (extensible)
  * date 0..1 date "Date of cardiopulmonary resuscitation decision (45)" "Optional"
  * reviewDate 0..1 date "Date for review of cardiopulmonary resuscitation decision (46)" "Optional"
  * documentLocation 0..1 string "Location of cardiopulmonary resuscitation documentation (47)" "Optional"
  * involvement 0..* BackboneElement "Involvement in CPR decision (PRSB)" "The person, their legitimate representative, family member or carer involved in the decision"
    * name 0..1 string "Name (PRSB)" "Name of the person involved"
    * relationship 0..* CodeableConcept "Relationship (PRSB)" "Relationship to the person"
    * role 0..1 string "Role (PRSB)" "Role in the decision"
  * responsibleForReview 0..1 Reference(Practitioner or PractitionerRole) "Responsibility for review (PRSB)" "The professional responsible for reviewing the decision"

// 4 Person demographics

* person 1..1 BackboneElement "Person demographics" "SCCI1580 section 4"
  * familyName 1..1 string "Person family name (5)" "Mandatory"
  * forename 1..1 string "Person forename (6)" "Mandatory"
  * preferredName 0..1 string "Person preferred name (7)" "Optional"
  * birthDate 1..1 date "Person birth date (8)" "Mandatory"
  * nhsNumber 1..1 Identifier "NHS number (9)" "Mandatory"
  * nhsNumberStatus 1..1 CodeableConcept "NHS number status indicator code (10)" "NHS Data Model and Dictionary NHS NUMBER STATUS INDICATOR CODE. Mandatory"
  * gender 0..1 CodeableConcept "Person gender (11)" "Optional"
  * gender from EOLPersonGender (extensible)
  * address 1..1 Address "Person address (12)" "Usual address. Mandatory"
  * telephone 0..* ContactPoint "Person telephone numbers (13)" "Home and mobile. Optional"
* mainCarer 1..1 BackboneElement "Main carer" "SCCI1580 section 4 Relevant contacts. The availability of carer support is mandatory"
  * availability 1..1 CodeableConcept "Availability of carer support (16)" "Has a carer, does not have a carer; unknown as text. Coded content is mandatory"
  * availability from EOLCarerAvailability (extensible)
  * name 0..1 string "Main carer name (16)" "Name of the main carer"
  * telephone 0..* ContactPoint "Main carer telephone numbers (17)" "Optional"

// 5 Special requirements

* interpreterNeeded 0..1 CodeableConcept "Need for an interpreter (14)" "Optional"
* interpreterNeeded from EOLInterpreterNeeded (extensible)
* preferredLanguage 0..1 CodeableConcept "Preferred spoken language (15)" "Optional"
* functionalStatus 0..1 integer "Functional status (29)" "Australia-modified Karnofsky Performance Status score, 0 to 100 (SNOMED CT 901671000000100). Optional"
* disability 0..* CodeableConcept "Disability (28)" "Required"
* disability from EOLDisability (extensible)
* eolcToolInUse 0..* CodeableConcept "EoLC tool in use (33)" "e.g. Gold Standards Framework, Preferred Priorities for Care. Optional"
* eolcToolInUse from EOLToolInUse (extensible)
* palliativeCareRegister 0..1 CodeableConcept "Person is on the palliative care register (PRSB)" "Whether the person is on the palliative care register"
* palliativeCareRegister from EOLRegister (extensible)

// 6 Information and advice given

* carerAwareOfPrognosis 0..1 CodeableConcept "Is main carer aware of person's prognosis? (18)" "Optional"
* carerAwareOfPrognosis from EOLCarerAwareOfPrognosis (extensible)
* cprDecisionAwareness 0..* CodeableConcept "Awareness of cardiopulmonary resuscitation decision (48)" "Whether the person, family member or carer is aware of, or has been informed of, the CPR decision. Optional"
* cprDecisionAwareness from EOLCPRAwareness (extensible)

// 7 GP practice

* gp 1..1 BackboneElement "GP practice" "SCCI1580 section 7"
  * name 1..1 string "Usual GP name (19)" "Mandatory"
  * practice 1..1 Identifier "Practice details (20)" "GP practice ODS code; with name, address, phone and fax numbers. Mandatory"

// 8 Key worker

* keyWorker 0..1 BackboneElement "Key worker" "SCCI1580 section 8"
  * name 0..1 string "Key worker name if not usual GP (21)" "Optional"
  * telephone 0..1 ContactPoint "Key worker telephone number (22)" "Optional"

// 9 Services and care

* careWorker 0..* BackboneElement "Care workers involved in care" "SCCI1580 section 9"
  * name 0..1 string "Care workers involved in care: name (23)" "Optional"
  * professionalGroup 0..1 CodeableConcept "Care workers involved in care: professional group (24)" "Optional"
  * professionalGroup from EOLCareWorkerGroup (extensible)
  * telephone 0..* ContactPoint "Telephone numbers for care workers involved in care (25)" "Optional"

// 10 Diagnoses

* primaryDiagnosis 1..1 CodeableConcept "Primary end of life care diagnosis (26)" "Coded whenever possible, or text. Mandatory"
* otherDiagnosis 0..* CodeableConcept "Other relevant end of life care diagnoses and clinical issues (27)" "Optional"
* likelyPrognosis 0..1 CodeableConcept "Likely prognosis (34)" "Last days, weeks or months of life. Only the key worker, GP or responsible clinician can complete it. Optional"
* likelyPrognosis from EOLLikelyPrognosis (extensible)

// 11 Allergies or adverse reactions

* allergy 0..* CodeableConcept "Allergies/adverse drug reactions (30)" "Coded or free text. Required"

// 12 Medications and medical devices

* anticipatoryMedicines 0..1 CodeableConcept "Anticipatory medicines/just in case box issued (31)" "Optional"
* anticipatoryMedicines from EOLAnticipatoryMedicines (extensible)
* anticipatoryMedicinesLocation 0..1 string "Location of anticipatory medicines/just in case box (32)" "Optional"

// 13 Legal information

* advanceStatement 0..1 BackboneElement "Advance statement" "SCCI1580 section 13"
  * code 0..1 CodeableConcept "Has advance statement (35)" "Optional"
  * code from EOLAdvanceStatement (extensible)
  * requestsAndPreferences 0..1 string "Advance statement requests and preferences (35)" "Free text. Optional"
  * documentLocation 0..1 string "Location of document (PRSB)" "Where the advance statement can be found"
* adrt 0..1 BackboneElement "Advance decision to refuse treatment" "Whether a decision has been made, the decision and the location of the documentation (SCCI1580 section 13)"
  * decision 0..1 CodeableConcept "Person has made an advance decision to refuse treatment (49)" "Optional"
  * decision from EOLADRT (extensible)
  * documentLocation 0..1 string "Location of advance decision to refuse treatment documentation (50)" "Optional"
* lastingPowerOfAttorney 0..1 BackboneElement "Lasting power of attorney for personal welfare" "SCCI1580 section 13"
  * name 0..1 string "Name of Lasting Power of Attorney for personal welfare (51)" "Optional"
  * authority 0..1 CodeableConcept "Authority of LPA (52)" "With or without authority for life sustaining decisions. Optional"
  * authority from EOLLPAAuthority (extensible)
  * telephone 0..* ContactPoint "Telephone number(s) concerning Lasting Power of Attorney (53)" "Optional"
  * relationship 0..1 CodeableConcept "Relationship (PRSB)" "Relationship of the appointed person to the person"
  * documentLocation 0..1 string "Location of document (PRSB)" "Where the LPA document can be found"
* mentalCapacityAssessment 0..* BackboneElement "Mental capacity assessment (PRSB)" "Whether an assessment of mental capacity has been undertaken, what decision it relates to and the outcome"
  * assessment 0..1 string "Mental capacity assessment (PRSB)" "The assessment and its outcome"
  * documentLocation 0..1 string "Location of document (PRSB)" "Where the assessment can be found"

// 14 Person and carers' concerns, expectations and wishes

* preferredPlaceOfDeath 0..2 BackboneElement "Preferred place of death" "1st and 2nd choices, if made (SCCI1580 section 14)"
  * choice 1..1 positiveInt "Choice" "1 = 1st choice (36-39), 2 = 2nd choice (40-43)"
  * type 0..1 CodeableConcept "Preferred place of death (36 / 40)" "Death location type, or a code for when no preference can be recorded, plus free text. Optional"
  * type from EOLPreferredPlaceOfDeath (extensible)
  * organisationName 0..1 string "Preferred place of death organisation name (37 / 41)" "Optional"
  * address 0..1 Address "Preferred place of death address (38 / 42)" "Optional"
  * isUsualPlaceOfResidence 0..1 boolean "Preferred place of death is usual place of residence (39 / 43)" "SNOMED CT 819211000000102. Optional"
* personInvolvedInDecisions 0..2 BackboneElement "Others to be involved in decisions" "People (one and two) the person wants to be involved in decisions about their care (SCCI1580 section 14)"
  * name 0..1 string "Name of additional person to be involved in decisions (54 / 56)" "Optional"
  * telephone 0..* ContactPoint "Telephone number of person to be involved in decisions (55 / 57)" "Optional"
* otherIssuesOrPreferences 0..1 string "Other relevant issues or preferences about provision of care (58)" "Free text. Optional"
* contingencyPlan 0..* BackboneElement "Contingency plans (PRSB)" "Things to do and people to contact if health or circumstances get worse - including treatment escalation and emergency treatment recommendations"
  * name 0..1 CodeableConcept "Contingency plan name (PRSB)" "e.g. treatment escalation plan, ReSPECT"
  * triggerFactors 0..1 CodeableConcept "Trigger factors (PRSB)" "Signs that may indicate a significant change"
  * whatShouldHappen 0..* CodeableConcept "What should happen (PRSB)" "Actions or interventions that may be required or should be avoided"
  * lastUpdated 0..1 date "Date this plan was last updated (PRSB)" ""
  * plannedReview 0..1 date "Planned review date (PRSB)" ""

// 15 Actual place of death, 16 Date of death

* actualPlaceOfDeath 0..1 CodeableConcept "Actual place of death (60)" "Death location type. Optional"
* actualPlaceOfDeath from EOLActualPlaceOfDeath (extensible)
* dateOfDeath 0..1 date "Date of death (59)" "Required"

Mapping:        EndOfLifeCareRecord-SCCI1580
Source:         EndOfLifeCareRecord
Target:         "https://standards.nhs.uk/published-standards/palliative-care-coordination-core-content"
Id:             scci1580
Title:          "SCCI1580 Palliative Care Co-ordination: Core Content (v4.0)"
* consentStatus -> "1 Consent status"
* recordCreationDate -> "2 Record creation date"
* plannedReviewDate -> "3 Planned review date"
* lastAmended -> "4 Date and time of last amendment"
* person.familyName -> "5 Person family name"
* person.forename -> "6 Person forename"
* person.preferredName -> "7 Person preferred name"
* person.birthDate -> "8 Person birth date"
* person.nhsNumber -> "9 NHS number"
* person.nhsNumberStatus -> "10 NHS number status indicator code"
* person.gender -> "11 Person gender"
* person.address -> "12 Person address"
* person.telephone -> "13 Person telephone numbers"
* interpreterNeeded -> "14 Need for an interpreter"
* preferredLanguage -> "15 Preferred spoken language"
* mainCarer.availability -> "16 Main carer name (coded content)"
* mainCarer.name -> "16 Main carer name"
* mainCarer.telephone -> "17 Main carer telephone numbers"
* carerAwareOfPrognosis -> "18 Is main carer aware of person's prognosis?"
* gp.name -> "19 Usual GP name"
* gp.practice -> "20 Practice details including phone and fax numbers"
* keyWorker.name -> "21 Key worker name if not usual GP"
* keyWorker.telephone -> "22 Key worker telephone number"
* careWorker.name -> "23 Care workers involved in care: name"
* careWorker.professionalGroup -> "24 Care workers involved in care: professional group"
* careWorker.telephone -> "25 Telephone numbers for care workers involved in care"
* primaryDiagnosis -> "26 Primary end of life care diagnosis"
* otherDiagnosis -> "27 Other relevant end of life care diagnoses and clinical issues"
* disability -> "28 Disability"
* functionalStatus -> "29 Functional status"
* allergy -> "30 Allergies/adverse drug reactions"
* anticipatoryMedicines -> "31 Anticipatory medicines/just in case box issued"
* anticipatoryMedicinesLocation -> "32 Location of anticipatory medicines/just in case box"
* eolcToolInUse -> "33 EoLC tool in use? (eg GSF, PPC, other)"
* likelyPrognosis -> "34 Likely prognosis"
* advanceStatement.code -> "35 Advance statement requests and preferences"
* advanceStatement.requestsAndPreferences -> "35 Advance statement requests and preferences"
* preferredPlaceOfDeath.type -> "36 Preferred place of death 1st choice; 40 2nd choice"
* preferredPlaceOfDeath.organisationName -> "37 Preferred place of death organisation name (1st choice); 41 (2nd choice)"
* preferredPlaceOfDeath.address -> "38 Preferred place of death address (1st choice); 42 (2nd choice)"
* preferredPlaceOfDeath.isUsualPlaceOfResidence -> "39 Preferred place of death (1st choice) is usual place of residence; 43 (2nd choice)"
* cprDecision.decision -> "44 Cardiopulmonary resuscitation decision"
* cprDecision.date -> "45 Date of cardiopulmonary resuscitation decision"
* cprDecision.reviewDate -> "46 Date for review of cardiopulmonary resuscitation decision"
* cprDecision.documentLocation -> "47 Location of cardiopulmonary resuscitation documentation"
* cprDecisionAwareness -> "48 Awareness of cardiopulmonary resuscitation decision"
* adrt.decision -> "49 Person has made an advance decision to refuse treatment"
* adrt.documentLocation -> "50 Location of advance decision to refuse treatment documentation"
* lastingPowerOfAttorney.name -> "51 Name of Lasting Power of Attorney for personal welfare"
* lastingPowerOfAttorney.authority -> "52 Authority of LPA"
* lastingPowerOfAttorney.telephone -> "53 Telephone number(s) concerning Lasting Power of Attorney"
* personInvolvedInDecisions.name -> "54 Name of additional person to be involved in decisions (1); 56 (2)"
* personInvolvedInDecisions.telephone -> "55 Telephone number of person (1) to be involved in decisions; 57 (2)"
* otherIssuesOrPreferences -> "58 Other relevant issues or preferences about provision of care"
* dateOfDeath -> "59 Date of death"
* actualPlaceOfDeath -> "60 Actual place of death"

Mapping:        EndOfLifeCareRecord-PRSB
Source:         EndOfLifeCareRecord
Target:         "https://theprsb.org/standards/palliativeandendoflifecare/"
Id:             prsb-peolc
Title:          "PRSB Palliative and End of Life Care Standard (build 11.0)"
* consentStatus -> "No equivalent element"
* person -> "Person demographics"
* mainCarer -> "Personal contacts"
* gp -> "GP practice"
* keyWorker -> "Professional contacts: Key worker"
* careWorker -> "Professional contacts"
* primaryDiagnosis -> "Primary palliative care diagnosis"
* otherDiagnosis -> "Problem list"
* allergy -> "Allergies and adverse reactions"
* disability -> "Individual requirements: Impairments"
* palliativeCareRegister -> "Palliative and end of life care: Person is on the Palliative Care Register"
* likelyPrognosis -> "Palliative and end of life care: Estimated prognosis"
* anticipatoryMedicines -> "Palliative and end of life care: Anticipatory medicines/equipment"
* anticipatoryMedicinesLocation -> "Palliative and end of life care: Statement on anticipatory medicines/equipment"
* cprDecision -> "Palliative and end of life care: Cardio-pulmonary resuscitation (CPR) decision"
* cprDecision.involvement -> "Cardio-pulmonary resuscitation (CPR) decision: Involvement in CPR Decision"
* cprDecision.responsibleForReview -> "Cardio-pulmonary resuscitation (CPR) decision: Responsibility for review"
* preferredPlaceOfDeath -> "Palliative and end of life care: Preferred place of death"
* advanceStatement -> "Advance statement"
* adrt -> "Legal information: Advance decision to refuse treatment (ADRT)"
* lastingPowerOfAttorney -> "Legal information: Lasting power of attorney for health and welfare"
* mentalCapacityAssessment -> "Legal information: Mental capacity assessment"
* contingencyPlan -> "Contingency plans"
* actualPlaceOfDeath -> "After death: Actual place of death"
* dateOfDeath -> "After death: Date of death"

Mapping:        EndOfLifeCareRecord-EOLAPI
Source:         EndOfLifeCareRecord
Target:         "https://developer.nhs.uk/apis/eol-alpha/"
Id:             eol-api
Title:          "End of Life Care API (alpha, STU3, 2019)"
* consentStatus -> "EOL-Consent-1.status and consentDecisionDetails (CON)"
* person -> "EOL-Patient-1 (Demographics)"
* mainCarer -> "EOL-Patient-1.contact"
* palliativeCareRegister -> "EOL-Register-Flag-1.code (EOL)"
* cprDecision.decision -> "EOL-CPRStatus-Flag-1.code (CPR001.1)"
* cprDecision.date -> "EOL-CPRStatus-Flag-1.period.start"
* cprDecision.reviewDate -> "EOL-CPRStatus-Flag-1.period.end"
* cprDecision.involvement -> "personsInvolvedInDiscussion (CPR001.6)"
* cprDecisionAwareness -> "awarenessOfDecision (CPR001.7)"
* functionalStatus -> "CareConnect-EOL-FunctionalStatus-Observation-1 (FUN)"
* disability -> "CareConnect-ProblemHeader-Condition-1.code (DIS001.1)"
* likelyPrognosis -> "EOL-Prognosis-ClinicalImpression-1.prognosisCodeableConcept (PRO)"
* carerAwareOfPrognosis -> "EOL-Prognosis-ClinicalImpression-1.awarenessOfPrognosis"
* anticipatoryMedicines -> "CareConnect-EOL-Procedure-1.code (ATP001.2)"
* anticipatoryMedicinesLocation -> "CareConnect-Location-1.name"
* adrt.decision -> "EOL-ADRT-Flag-1.code (ATP001.3)"
* lastingPowerOfAttorney -> "EOL-LPA-Flag-1, EOL-LPA-RelatedPerson-1 (LPA)"
* preferredPlaceOfDeath.type -> "item.preferredPlaceOfDeathCoded / Text (PRE001.1)"
* otherIssuesOrPreferences -> "item.preferencesAndWishes, item.domesticAccessAndInformation (PRE001.2, PRE001.3)"
* contingencyPlan -> "EOL-ATP-CarePlan-1, EOL-ATPProblemHeader-Condition-1 (ATP001.1)"

Mapping:        EndOfLifeCareRecord-FHIR
Source:         EndOfLifeCareRecord
Target:         "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport"
Id:             fhir
Title:          "FHIR (this IG)"
* -> "EndOfLifeCarePlan, with the EndOfLifeCareObservations as supportingInfo; shared as EndOfLifeCareComposition"
* consentStatus -> "EndOfLifeCareObservation (code 1)"
* recordCreationDate -> "EndOfLifeCarePlan.period.start"
* lastAmended -> "EndOfLifeCareComposition.date"
* plannedReviewDate -> "EndOfLifeCareComposition section respect-9 (not coded)"
* cprDecision.decision -> "EndOfLifeCareObservation (code 44)"
* cprDecision.date -> "EndOfLifeCareObservation (code 45)"
* cprDecision.reviewDate -> "EndOfLifeCareObservation (code 46)"
* cprDecision.documentLocation -> "EndOfLifeCareObservation (code 47)"
* person -> "Patient"
* person.familyName -> "Patient.name.family"
* person.forename -> "Patient.name.given"
* person.birthDate -> "Patient.birthDate"
* person.nhsNumber -> "Patient.identifier (https://fhir.nhs.uk/Id/nhs-number)"
* person.address -> "Patient.address"
* person.telephone -> "Patient.telecom"
* mainCarer.availability -> "EndOfLifeCareObservation (code 16)"
* mainCarer.name -> "RelatedPerson.name"
* mainCarer.telephone -> "RelatedPerson.telecom"
* gp -> "Patient.generalPractitioner"
* keyWorker -> "EndOfLifeCareTeam.participant (role 719240009 Has end of life care key worker)"
* keyWorker.name -> "EndOfLifeCareTeam.participant.member (Practitioner)"
* keyWorker.telephone -> "Practitioner.telecom"
* careWorker -> "EndOfLifeCareTeam.participant"
* careWorker.name -> "EndOfLifeCareTeam.participant.member"
* careWorker.professionalGroup -> "EndOfLifeCareTeam.participant.role"
* careWorker.telephone -> "Practitioner.telecom or Organization.telecom"
* primaryDiagnosis -> "EndOfLifeCarePlan.addresses (Condition), first"
* otherDiagnosis -> "EndOfLifeCarePlan.addresses (Condition)"
* likelyPrognosis -> "EndOfLifeCareObservation (code 34)"
* lastingPowerOfAttorney.name -> "RelatedPerson (relationship HPOWATT)"
* actualPlaceOfDeath -> "EndOfLifeCareObservation (code 60)"
* dateOfDeath -> "EndOfLifeCareObservation (code 59); EndOfLifeCarePlan.period.end"
