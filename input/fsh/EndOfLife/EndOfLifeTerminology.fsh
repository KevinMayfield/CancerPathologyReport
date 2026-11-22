// Palliative Care Record value sets.
// Order of precedence: SCCI1580 Palliative Care Co-ordination: Core Content
// (Amd 11/2015, v4.0, with the January 2016 corrigendum), then the PRSB
// Palliative and End of Life Care Standard. Codes checked on tx.fhir.org against
// SNOMED CT UK edition 20261021; inactive codes are left out and listed in comments.

RuleSet: SCCI1580ValueSet(item)
* ^status = #draft
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement. Codes from SCCI1580 Palliative Care Co-ordination: Core Content, data item {item}."

// Consent status (1)

ValueSet:       EOLConsentStatus
Id:             eol-consent-status
Title:          "Palliative Care Consent Status"
Description:    "Proof of concept - not an authoritative source. How consent to create and share the end of life care co-ordination record was given, or that it was withdrawn. SCCI1580 data item 1 Consent status."
* insert SCCI1580ValueSet(1 Consent status)
* $sct#882921000000109 "Consent given for sharing end of life care coordination record"
* $sct#882941000000102 "Withdrawal of consent for sharing end of life care coordination record"
* $sct#882961000000101 "Best interests decision taken (Mental Capacity Act 2005) for sharing end of life care coordination record"
* $sct#883001000000106 "Consent given by appointed person with lasting power of attorney for personal welfare (Mental Capacity Act 2005) for sharing end of life care coordination record"

// Person gender (11)

ValueSet:       EOLPersonGender
Id:             eol-person-gender
Title:          "Palliative Care Person Gender"
Description:    "Proof of concept - not an authoritative source. SCCI1580 data item 11 Person gender, SNOMED CT option. SCCI1580 also allows the NHS Data Model and Dictionary codes 1 Male, 2 Female, 9 Indeterminate."
* insert SCCI1580ValueSet(11 Person gender)
* $sct#248152002 "Female"
* $sct#248153007 "Male"

// Need for an interpreter (14)

ValueSet:       EOLInterpreterNeeded
Id:             eol-interpreter-needed
Title:          "Palliative Care Need for an Interpreter"
Description:    "Proof of concept - not an authoritative source. SCCI1580 data item 14 Need for an interpreter."
* insert SCCI1580ValueSet(14 Need for an interpreter)
* $sct#315594003 "Interpreter needed"
* $sct#315595002 "Interpreter not needed"

// Main carer (16)

ValueSet:       EOLCarerAvailability
Id:             eol-carer-availability
Title:          "Palliative Care Availability of Carer Support"
Description:    "Proof of concept - not an authoritative source. Whether the person has a carer; the coded content is mandatory, and unknown is recorded as text. SCCI1580 data item 16 Main carer name."
* insert SCCI1580ValueSet(16 Main carer name)
* $sct#184156005 "Has a carer"
* $sct#414041006 "Does not have a carer"

// Is main carer aware of person's prognosis? (18)

ValueSet:       EOLCarerAwareOfPrognosis
Id:             eol-carer-aware-of-prognosis
Title:          "Palliative Care Main Carer Aware of Prognosis"
Description:    "Proof of concept - not an authoritative source. SCCI1580 data item 18 Is main carer aware of person's prognosis?, with 473316003 replacing 751961000000104 per the January 2016 corrigendum."
* insert SCCI1580ValueSet(18 Is main carer aware of person's prognosis?)
* $sct#473316003 "Relative aware of prognosis"
* $sct#760101000000101 "Relative unaware of prognosis"
* $sct#473301001 "Caregiver aware of prognosis"
// 711951000000105 Carer unaware of prognosis - inactive in UK edition 20261021

// Care workers involved in care: professional group (24)

ValueSet:       EOLCareWorkerGroup
Id:             eol-care-worker-group
Title:          "Palliative Care Worker Professional Group"
Description:    "Proof of concept - not an authoritative source. SCCI1580 data item 24 Care workers involved in care: professional group. SCCI1580 also allows free text or a local pick list."
* insert SCCI1580ValueSet(24 Care workers involved in care: professional group)
* $sct#305602008 "Under care of dietician"
* $sct#305578001 "Under care of district nurse"
* $sct#305574004 "Under care of community based nurse"
* $sct#305554006 "Under care of nurse"
* $sct#305556008 "Under care of clinical nurse specialist"
* $sct#850951000000107 "Under care of palliative care specialist nurse"
* $sct#853741000000104 "Has healthcare support worker"
* $sct#305496007 "Under care of palliative care physician"
* $sct#851011000000103 "Under care of oncologist"
* $sct#305469009 "Under care of pain management specialist"
* $sct#305490001 "Under care of care of the elderly physician"
* $sct#305476004 "Under care of respiratory physician"
* $sct#305472002 "Under care of cardiologist"
* $sct#305494005 "Under care of neurologist"
* $sct#305493004 "Under care of nephrologist"
// 852031000000100 Under care of physician - inactive in UK edition 20261021
* $sct#305616003 "Under care of speech and language therapist"
* $sct#305525000 "Under care of surgeon"
* $sct#851821000000100 "Has spiritual and cultural support"
* $sct#305605005 "Under care of occupational therapist"
* $sct#305613006 "Under care of physiotherapist"
* $sct#850931000000100 "Has social services care manager"
* $sct#405775000 "Under care of social worker"
* $sct#851851000000105 "Has social care assessor"
* $sct#853721000000106 "Has direct care worker"

// Disability (28)

ValueSet:       EOLDisability
Id:             eol-disability
Title:          "Palliative Care Disability"
Description:    "Proof of concept - not an authoritative source. SCCI1580 data item 28 Disability. SCCI1580 also allows the NHS Data Model and Dictionary disability codes or free text."
* insert SCCI1580ValueSet(28 Disability)
* $sct#15188001 "Hearing loss"
* $sct#397540003 "Visual impairment"
* $sct#288579009 "Difficulty communicating"
* $sct#386806002 "Impaired cognition"
* $sct#325541000000106 "Unable to summon help in emergency"
* $sct#914271000000103 "Impaired ability to recognise safety risks"
* $sct#750691000000106 "No known disability"

// EoLC tool in use (33)

ValueSet:       EOLToolInUse
Id:             eol-tool-in-use
Title:          "End of Life Care Tool in Use"
Description:    "Proof of concept - not an authoritative source. SCCI1580 data item 33 EoLC tool in use? (eg GSF, PPC, other)."
* insert SCCI1580ValueSet(33 EoLC tool in use)
* $sct#414937009 "On gold standards palliative care framework"
* $sct#785091000000102 "Preferred priorities for care document completed"

// Likely prognosis (34)

ValueSet:       EOLLikelyPrognosis
Id:             eol-likely-prognosis
Title:          "Palliative Care Likely Prognosis"
Description:    "Proof of concept - not an authoritative source. A clinical judgement of the anticipated time until death: days (< 1 week), weeks (< 1 month) or months (< 1 year). SCCI1580 data item 34 Likely prognosis, with 968211000000101 confirmed by the January 2016 corrigendum."
* insert SCCI1580ValueSet(34 Likely prognosis)
* $sct#511401000000102 "Last days of life"
* $sct#955231000000109 "Last weeks of life"
* $sct#968211000000101 "Last months of life"

// Anticipatory medicines/just in case box issued (31)

ValueSet:       EOLAnticipatoryMedicines
Id:             eol-anticipatory-medicines
Title:          "Palliative Care Anticipatory Medicines"
Description:    "Proof of concept - not an authoritative source. Anticipatory medicines or a just in case box have been issued. SCCI1580 data item 31 Anticipatory medicines/just in case box issued."
* insert SCCI1580ValueSet(31 Anticipatory medicines/just in case box issued)
* $sct#376201000000102 "Issue of palliative care anticipatory medication box"
* $sct#871021000000106 "Prescription of palliative care anticipatory medication"

// Advance statement (35)

ValueSet:       EOLAdvanceStatement
Id:             eol-advance-statement
Title:          "Palliative Care Advance Statement"
Description:    "Proof of concept - not an authoritative source. SCCI1580 data item 35 Advance statement requests and preferences."
* insert SCCI1580ValueSet(35 Advance statement requests and preferences)
* $sct#816281000000101 "Has advance statement (Mental Capacity Act 2005)"

// Advance decision to refuse treatment (49)

ValueSet:       EOLADRT
Id:             eol-adrt
Title:          "Palliative Care Advance Decision to Refuse Treatment"
Description:    "Proof of concept - not an authoritative source. SCCI1580 data item 49 Person has made an advance decision to refuse treatment."
* insert SCCI1580ValueSet(49 Person has made an advance decision to refuse treatment)
* $sct#816301000000100 "Has advance decision to refuse treatment (Mental Capacity Act 2005)"
* $sct#816321000000109 "Has advance decision to refuse life sustaining treatment (Mental Capacity Act 2005)"
* $sct#820621000000107 "Has involved healthcare professional in discussion about advance decision to refuse treatment (Mental Capacity Act 2005)"

// Authority of LPA (52)

ValueSet:       EOLLPAAuthority
Id:             eol-lpa-authority
Title:          "Palliative Care Authority of Lasting Power of Attorney"
Description:    "Proof of concept - not an authoritative source. Whether the person appointed with a lasting power of attorney for personal welfare has authority for life sustaining decisions. SCCI1580 data item 52 Authority of LPA."
* insert SCCI1580ValueSet(52 Authority of LPA)
* $sct#816361000000101 "Has appointed person with personal welfare lasting power of attorney (Mental Capacity Act 2005)"
* $sct#816381000000105 "Has appointed person with personal welfare lasting power of attorney with authority for life sustaining decisions (Mental Capacity Act 2005)"

// Death location type (36, 40, 60)

CodeSystem:     EOLDeathLocationTypeCS
Id:             eol-death-location-type
Title:          "Death Location Type"
Description:    "Proof of concept - not an authoritative source. Death location type, as listed in SCCI1580 data items 36 Preferred place of death 1st choice and 60 Actual place of death (NHS Data Model and Dictionary DEATH LOCATION TYPE CODE). Defined locally here because no FHIR code system for it was found - To confirm."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete
* #10 "Hospital" "Acute, community or other hospital"
* #20 "Private residence"
* #21 "Patient's own home"
* #22 "Other private residence" "e.g. relative's home, carer's home"
* #30 "Hospice" "Inpatient specialist palliative care"
* #40 "Care home"
* #50 "Other" "Free text, e.g. secure and detained settings"

ValueSet:       EOLPreferredPlaceOfDeath
Id:             eol-preferred-place-of-death
Title:          "Palliative Care Preferred Place of Death"
Description:    "Proof of concept - not an authoritative source. The death location type, or a SNOMED CT code for when no preference can be recorded. SCCI1580 data items 36 Preferred place of death 1st choice and 40 Preferred place of death 2nd choice."
* insert SCCI1580ValueSet(36 and 40 Preferred place of death)
* include codes from system EOLDeathLocationTypeCS
* $sct#517111000000103 "Preferred place of death: patient unable to express preference"
* $sct#517131000000106 "Preferred place of death: discussion not appropriate"
* $sct#517161000000101 "Preferred place of death: patient undecided"
// 766391000000108 Preferred place of death: patient declined discussion - inactive in UK edition 20261021

ValueSet:       EOLActualPlaceOfDeath
Id:             eol-actual-place-of-death
Title:          "Palliative Care Actual Place of Death"
Description:    "Proof of concept - not an authoritative source. SCCI1580 data item 60 Actual place of death."
* ^status = #draft
* ^experimental = true
* include codes from system EOLDeathLocationTypeCS

// Cardiopulmonary resuscitation decision (44) and awareness (48)

ValueSet:       EOLCPRDecision
Id:             eol-cpr-decision
Title:          "Palliative Care Cardiopulmonary Resuscitation Decision"
Description:    "Proof of concept - not an authoritative source. SCCI1580 data item 44 Cardiopulmonary resuscitation decision. 'Resuscitation status unknown' is recorded as text."
* insert SCCI1580ValueSet(44 Cardiopulmonary resuscitation decision)
* $sct#450475007 "For cardiopulmonary resuscitation"
* $sct#450476008 "Not for cardiopulmonary resuscitation"

ValueSet:       EOLCPRAwareness
Id:             eol-cpr-awareness
Title:          "Palliative Care Awareness of CPR Decision"
Description:    "Proof of concept - not an authoritative source. Whether the person, family or carer is aware of the CPR decision. SCCI1580 data item 48 Awareness of cardiopulmonary resuscitation decision, with the codes confirmed by the January 2016 corrigendum."
* insert SCCI1580ValueSet(48 Awareness of cardiopulmonary resuscitation decision)
* $sct#845151000000104 "Not aware of do not attempt cardiopulmonary resuscitation clinical decision"
* $sct#975291000000108 "Family member informed of cardiopulmonary resuscitation clinical decision"
* $sct#975311000000109 "Carer informed of cardiopulmonary resuscitation clinical decision"

// Palliative care register (PRSB)

ValueSet:       EOLRegister
Id:             eol-register
Title:          "Palliative Care Register"
Description:    "Proof of concept - not an authoritative source. The person is on the palliative care register (PRSB Palliative and End of Life Care Standard; not an SCCI1580 data item). Code from the NHS Digital End of Life Care API value set EOL-Register-Code-1."
* ^status = #draft
* ^experimental = true
* $sct#526631000000108 "On end of life care register"

// SCCI1580 data items (1-60) - used as Questionnaire.item.code and Observation.code

CodeSystem:     EOLDataItemCS
Id:             scci1580-data-item
Title:          "SCCI1580 Data Item Code System"
Description:    "Proof of concept - not an authoritative source. The 60 data items of SCCI1580 Palliative Care Co-ordination: Core Content (Amd 11/2015, v4.0), numbered as in the standard. Used here to code Questionnaire items and the Observations extracted from them. A local code system proposal - SCCI1580 publishes no code system for its data items."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete
* #1 "Consent status"
* #2 "Record creation date"
* #3 "Planned review date"
* #4 "Date and time of last amendment"
* #5 "Person family name"
* #6 "Person forename"
* #7 "Person preferred name"
* #8 "Person birth date"
* #9 "NHS number"
* #10 "NHS number status indicator code"
* #11 "Person gender"
* #12 "Person address"
* #13 "Person telephone numbers"
* #14 "Need for an interpreter"
* #15 "Preferred spoken language"
* #16 "Main carer name"
* #17 "Main carer telephone numbers"
* #18 "Is main carer aware of person's prognosis?"
* #19 "Usual GP name"
* #20 "Practice details including phone and fax numbers"
* #21 "Key worker name if not usual GP"
* #22 "Key worker telephone number"
* #23 "Care workers involved in care: name"
* #24 "Care workers involved in care: professional group"
* #25 "Telephone numbers for care workers involved in care"
* #26 "Primary end of life care diagnosis"
* #27 "Other relevant end of life care diagnoses and clinical issues"
* #28 "Disability"
* #29 "Functional status"
* #30 "Allergies/adverse drug reactions"
* #31 "Anticipatory medicines/just in case box issued"
* #32 "Location of anticipatory medicines/just in case box"
* #33 "EoLC tool in use? (eg GSF, PPC, other)"
* #34 "Likely prognosis"
* #35 "Advance statement requests and preferences"
* #36 "Preferred place of death 1st choice"
* #37 "Preferred place of death organisation name (1st choice)"
* #38 "Preferred place of death address (1st choice)"
* #39 "Preferred place of death (1st choice) is usual place of residence"
* #40 "Preferred place of death 2nd choice"
* #41 "Preferred place of death organisation name (2nd choice)"
* #42 "Preferred place of death address (2nd choice)"
* #43 "Preferred place of death (2nd choice) is usual place of residence"
* #44 "Cardiopulmonary resuscitation decision"
* #45 "Date of cardiopulmonary resuscitation decision"
* #46 "Date for review of cardiopulmonary resuscitation decision"
* #47 "Location of cardiopulmonary resuscitation documentation"
* #48 "Awareness of cardiopulmonary resuscitation decision"
* #49 "Person has made an advance decision to refuse treatment"
* #50 "Location of advance decision to refuse treatment documentation"
* #51 "Name of Lasting Power of Attorney for personal welfare"
* #52 "Authority of LPA"
* #53 "Telephone number(s) concerning Lasting Power of Attorney"
* #54 "Name of additional person to be involved in decisions (1)"
* #55 "Telephone number of person (1) to be involved in decisions"
* #56 "Name of additional person to be involved in decisions (2)"
* #57 "Telephone number of person (2) to be involved in decisions"
* #58 "Other relevant issues or preferences about provision of care"
* #59 "Date of death"
* #60 "Actual place of death"
