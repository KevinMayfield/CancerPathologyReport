// Fictitious examples for the Palliative Care Record - generated from the
// Palliative Care Record Questionnaire. Version 1: first completion; version 2: amendment.

Instance:   EolQuestionnaireResponse1
InstanceOf: QuestionnaireResponse
Title:      "Palliative Care Record - QuestionnaireResponse (first completion)"
Description: "Fictitious example. Answers to the Palliative Care Record Questionnaire for Ned LIVERPOOL."
Usage:      #example
* questionnaire = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Questionnaire/PalliativeCareRecordQuestionnaire"
* status = #completed
* subject = Reference(EolPatient)
* authored = "2026-10-12T14:00:00+00:00"
* author = Reference(EolPalliativeConsultant)
* item[+].linkId = "s1"
* item[=].text = "1 Consent"
* item[=]
  * item[+].linkId = "1"
  * item[=].text = "Consent status"
  * item[=].answer[+].valueCoding = $sct#882921000000109 "Consent given for sharing end of life care coordination record"
* item[+].linkId = "s2"
* item[=].text = "2 Record"
* item[=]
  * item[+].linkId = "2"
  * item[=].text = "Record creation date"
  * item[=].answer[+].valueDate = "2026-10-12"
  * item[+].linkId = "4"
  * item[=].text = "Date and time of last amendment"
  * item[=].answer[+].valueDateTime = "2026-10-12T14:00:00+00:00"
* item[+].linkId = "s3"
* item[=].text = "3 Plan and requested actions"
* item[=]
  * item[+].linkId = "3"
  * item[=].text = "Planned review date"
  * item[=].answer[+].valueDate = "2026-11-09"
  * item[+].linkId = "cpr"
  * item[=].text = "Cardiopulmonary resuscitation decision"
  * item[=]
    * item[+].linkId = "44"
    * item[=].text = "Cardiopulmonary resuscitation decision"
    * item[=].answer[+].valueCoding = $sct#450476008 "Not for cardiopulmonary resuscitation"
    * item[+].linkId = "45"
    * item[=].text = "Date of cardiopulmonary resuscitation decision"
    * item[=].answer[+].valueDate = "2026-10-12"
    * item[+].linkId = "46"
    * item[=].text = "Date for review of cardiopulmonary resuscitation decision"
    * item[=].answer[+].valueDate = "2026-11-09"
    * item[+].linkId = "47"
    * item[=].text = "Location of cardiopulmonary resuscitation documentation"
    * item[=].answer[+].valueString = "ReSPECT form in the folder on the kitchen table"
    * item[+].linkId = "prsb-cpr-involvement"
    * item[=].text = "Involvement in CPR decision (PRSB)"
    * item[=]
      * item[+].linkId = "prsb-cpr-involvement-name"
      * item[=].text = "Name"
      * item[=].answer[+].valueString = "Joan LIVERPOOL"
      * item[+].linkId = "prsb-cpr-involvement-relationship"
      * item[=].text = "Relationship"
      * item[=].answer[+].valueString = "Wife"
      * item[+].linkId = "prsb-cpr-involvement-role"
      * item[=].text = "Role"
      * item[=].answer[+].valueString = "Present at the discussion"
* item[+].linkId = "s4"
* item[=].text = "4 Person demographics"
* item[=]
  * item[+].linkId = "5"
  * item[=].text = "Person family name"
  * item[=].answer[+].valueString = "LIVERPOOL"
  * item[+].linkId = "6"
  * item[=].text = "Person forename"
  * item[=].answer[+].valueString = "Ned"
  * item[+].linkId = "7"
  * item[=].text = "Person preferred name"
  * item[=].answer[+].valueString = "Ned"
  * item[+].linkId = "8"
  * item[=].text = "Person birth date"
  * item[=].answer[+].valueDate = "1942-06-18"
  * item[+].linkId = "9"
  * item[=].text = "NHS number"
  * item[=].answer[+].valueString = "9737383206"
  * item[+].linkId = "10"
  * item[=].text = "NHS number status indicator code"
  * item[=].answer[+].valueString = "01 Number present and verified"
  * item[+].linkId = "11"
  * item[=].text = "Person gender"
  * item[=].answer[+].valueCoding = $sct#248153007 "Male"
  * item[+].linkId = "12"
  * item[=].text = "Person address"
  * item[=].answer[+].valueString = "20 Forthlin Road, LIVERPOOL, L18 9TN"
  * item[+].linkId = "13"
  * item[=].text = "Person telephone numbers"
  * item[=].answer[+].valueString = "0151 496 0201"
  * item[+].linkId = "carer"
  * item[=].text = "Main carer"
  * item[=]
    * item[+].linkId = "16"
    * item[=].text = "Availability of carer support"
    * item[=].answer[+].valueCoding = $sct#184156005 "Has a carer"
    * item[+].linkId = "16.name"
    * item[=].text = "Main carer name"
    * item[=].answer[+].valueString = "Joan LIVERPOOL"
    * item[+].linkId = "17"
    * item[=].text = "Main carer telephone numbers"
    * item[=].answer[+].valueString = "07700 900123"
* item[+].linkId = "s5"
* item[=].text = "5 Special requirements"
* item[=]
  * item[+].linkId = "14"
  * item[=].text = "Need for an interpreter"
  * item[=].answer[+].valueCoding = $sct#315595002 "Interpreter not needed"
  * item[+].linkId = "15"
  * item[=].text = "Preferred spoken language"
  * item[=].answer[+].valueCoding = $sct#315570003 "Main spoken language English"
  * item[+].linkId = "29"
  * item[=].text = "Functional status (Australia-modified Karnofsky Performance Status score 0-100)"
  * item[=].answer[+].valueInteger = 50
  * item[+].linkId = "28"
  * item[=].text = "Disability"
  * item[=].answer[+].valueCoding = $sct#750691000000106 "No known disability"
  * item[+].linkId = "33"
  * item[=].text = "EoLC tool in use"
  * item[=].answer[+].valueCoding = $sct#414937009 "On gold standards palliative care framework"
  * item[+].linkId = "prsb-register"
  * item[=].text = "Person is on the palliative care register (PRSB)"
  * item[=].answer[+].valueCoding = $sct#526631000000108 "On end of life care register"
* item[+].linkId = "s6"
* item[=].text = "6 Information and advice given"
* item[=]
  * item[+].linkId = "18"
  * item[=].text = "Is main carer aware of person's prognosis?"
  * item[=].answer[+].valueCoding = $sct#473316003 "Relative aware of prognosis"
  * item[+].linkId = "48"
  * item[=].text = "Awareness of cardiopulmonary resuscitation decision"
  * item[=].answer[+].valueCoding = $sct#975291000000108 "Family member informed of cardiopulmonary resuscitation clinical decision"
* item[+].linkId = "s7"
* item[=].text = "7 GP practice"
* item[=]
  * item[+].linkId = "19"
  * item[=].text = "Usual GP name"
  * item[=].answer[+].valueString = "Dr Rachel FICTITIOUS"
  * item[+].linkId = "20"
  * item[=].text = "Practice details (ODS code)"
  * item[=].answer[+].valueString = "GP001 - FICTITIOUS Medical Practice"
* item[+].linkId = "s8"
* item[=].text = "8 Key worker"
* item[=]
  * item[+].linkId = "21"
  * item[=].text = "Key worker name if not usual GP"
  * item[=].answer[+].valueString = "Sarah FICTITIOUS, district nurse"
  * item[+].linkId = "22"
  * item[=].text = "Key worker telephone number"
  * item[=].answer[+].valueString = "0151 496 0123"
* item[+].linkId = "s9"
* item[=].text = "9 Services and care"
* item[=]
  * item[+].linkId = "23"
  * item[=].text = "Care workers involved in care: name"
  * item[=].answer[+].valueString = "Community Specialist Palliative Care Team"
  * item[+].linkId = "24"
  * item[=].text = "Care workers involved in care: professional group"
  * item[=].answer[+].valueCoding = $sct#850951000000107 "Under care of palliative care specialist nurse"
  * item[+].linkId = "25"
  * item[=].text = "Telephone numbers for care workers involved in care"
  * item[=].answer[+].valueString = "0151 496 0456"
* item[+].linkId = "s10"
* item[=].text = "10 Diagnoses"
* item[=]
  * item[+].linkId = "26"
  * item[=].text = "Primary end of life care diagnosis"
  * item[=].answer[+].valueCoding = $sct#363350007 "Malignant neoplasm of caecum"
  * item[+].linkId = "27"
  * item[=].text = "Other relevant end of life care diagnoses and clinical issues"
  * item[=].answer[+].valueCoding = $sct#94381002 "Metastatic malignant neoplasm to liver"
  * item[+].linkId = "34"
  * item[=].text = "Likely prognosis"
  * item[=].answer[+].valueCoding = $sct#968211000000101 "Last months of life"
* item[+].linkId = "s11"
* item[=].text = "11 Allergies or adverse reactions"
* item[=]
  * item[+].linkId = "30"
  * item[=].text = "Allergies/adverse drug reactions"
  * item[=].answer[+].valueCoding = $sct#716186003 "No known allergy"
* item[+].linkId = "s12"
* item[=].text = "12 Medications and medical devices"
* item[=]
  * item[+].linkId = "31"
  * item[=].text = "Anticipatory medicines/just in case box issued"
  * item[=].answer[+].valueCoding = $sct#376201000000102 "Issue of palliative care anticipatory medication box"
  * item[+].linkId = "32"
  * item[=].text = "Location of anticipatory medicines/just in case box"
  * item[=].answer[+].valueString = "Just in case box in the kitchen cupboard"
* item[+].linkId = "s13"
* item[=].text = "13 Legal information"
* item[=]
  * item[+].linkId = "advance-statement"
  * item[=].text = "Advance statement"
  * item[=]
    * item[+].linkId = "35"
    * item[=].text = "Has advance statement"
    * item[=].answer[+].valueCoding = $sct#816281000000101 "Has advance statement (Mental Capacity Act 2005)"
    * item[+].linkId = "35.text"
    * item[=].text = "Advance statement requests and preferences"
    * item[=].answer[+].valueString = "Wishes to stay at home with his family, and does not want to go back into hospital."
  * item[+].linkId = "lpa"
  * item[=].text = "Lasting power of attorney for personal welfare"
  * item[=]
    * item[+].linkId = "51"
    * item[=].text = "Name of Lasting Power of Attorney for personal welfare"
    * item[=].answer[+].valueString = "Joan LIVERPOOL"
    * item[+].linkId = "52"
    * item[=].text = "Authority of LPA"
    * item[=].answer[+].valueCoding = $sct#816361000000101 "Has appointed person with personal welfare lasting power of attorney (Mental Capacity Act 2005)"
    * item[+].linkId = "53"
    * item[=].text = "Telephone number(s) concerning Lasting Power of Attorney"
    * item[=].answer[+].valueString = "07700 900123"
* item[+].linkId = "s14"
* item[=].text = "14 Person and carers' concerns, expectations and wishes"
* item[=]
  * item[+].linkId = "ppd1"
  * item[=].text = "Preferred place of death 1st choice"
  * item[=]
    * item[+].linkId = "36"
    * item[=].text = "Preferred place of death 1st choice"
    * item[=].answer[+].valueCoding = EOLDeathLocationTypeCS#21 "Patient's own home"
    * item[+].linkId = "39"
    * item[=].text = "Preferred place of death (1st choice) is usual place of residence"
    * item[=].answer[+].valueBoolean = true
  * item[+].linkId = "ppd2"
  * item[=].text = "Preferred place of death 2nd choice"
  * item[=]
    * item[+].linkId = "40"
    * item[=].text = "Preferred place of death 2nd choice"
    * item[=].answer[+].valueCoding = EOLDeathLocationTypeCS#30 "Hospice"
    * item[+].linkId = "41"
    * item[=].text = "Preferred place of death organisation name (2nd choice)"
    * item[=].answer[+].valueString = "FICTITIOUS Hospice"
  * item[+].linkId = "58"
  * item[=].text = "Other relevant issues or preferences about provision of care"
  * item[=].answer[+].valueString = "Key safe by the front door - the code is held by the district nursing team. Ned's dog is friendly."
  * item[+].linkId = "prsb-contingency"
  * item[=].text = "Contingency plans (PRSB)"
  * item[=]
    * item[+].linkId = "prsb-contingency-name"
    * item[=].text = "Contingency plan name"
    * item[=].answer[+].valueString = "Treatment escalation plan"
    * item[+].linkId = "prsb-contingency-trigger"
    * item[=].text = "Trigger factors"
    * item[=].answer[+].valueString = "Increasing pain, vomiting or new confusion"
    * item[+].linkId = "prsb-contingency-action"
    * item[=].text = "What should happen"
    * item[=].answer[+].valueString = "Contact the community palliative care team, or the GP out of hours service. Manage at home using the anticipatory medicines. Hospital admission only for symptoms that cannot be controlled at home."
    * item[+].linkId = "prsb-contingency-updated"
    * item[=].text = "Date this plan was last updated"
    * item[=].answer[+].valueDate = "2026-10-12"

Instance:   EolQuestionnaireResponse2
InstanceOf: QuestionnaireResponse
Title:      "Palliative Care Record - QuestionnaireResponse (amendment)"
Description: "Fictitious example. Answers to the Palliative Care Record Questionnaire for Ned LIVERPOOL."
Usage:      #example
* questionnaire = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Questionnaire/PalliativeCareRecordQuestionnaire"
* status = #amended
* subject = Reference(EolPatient)
* authored = "2026-11-02T10:00:00+00:00"
* author = Reference(EolPalliativeConsultant)
* item[+].linkId = "s1"
* item[=].text = "1 Consent"
* item[=]
  * item[+].linkId = "1"
  * item[=].text = "Consent status"
  * item[=].answer[+].valueCoding = $sct#882921000000109 "Consent given for sharing end of life care coordination record"
* item[+].linkId = "s2"
* item[=].text = "2 Record"
* item[=]
  * item[+].linkId = "2"
  * item[=].text = "Record creation date"
  * item[=].answer[+].valueDate = "2026-10-12"
  * item[+].linkId = "4"
  * item[=].text = "Date and time of last amendment"
  * item[=].answer[+].valueDateTime = "2026-11-02T10:00:00+00:00"
* item[+].linkId = "s3"
* item[=].text = "3 Plan and requested actions"
* item[=]
  * item[+].linkId = "3"
  * item[=].text = "Planned review date"
  * item[=].answer[+].valueDate = "2026-11-16"
  * item[+].linkId = "cpr"
  * item[=].text = "Cardiopulmonary resuscitation decision"
  * item[=]
    * item[+].linkId = "44"
    * item[=].text = "Cardiopulmonary resuscitation decision"
    * item[=].answer[+].valueCoding = $sct#450476008 "Not for cardiopulmonary resuscitation"
    * item[+].linkId = "45"
    * item[=].text = "Date of cardiopulmonary resuscitation decision"
    * item[=].answer[+].valueDate = "2026-10-12"
    * item[+].linkId = "46"
    * item[=].text = "Date for review of cardiopulmonary resuscitation decision"
    * item[=].answer[+].valueDate = "2026-11-16"
    * item[+].linkId = "47"
    * item[=].text = "Location of cardiopulmonary resuscitation documentation"
    * item[=].answer[+].valueString = "ReSPECT form in the folder on the kitchen table"
    * item[+].linkId = "prsb-cpr-involvement"
    * item[=].text = "Involvement in CPR decision (PRSB)"
    * item[=]
      * item[+].linkId = "prsb-cpr-involvement-name"
      * item[=].text = "Name"
      * item[=].answer[+].valueString = "Joan LIVERPOOL"
      * item[+].linkId = "prsb-cpr-involvement-relationship"
      * item[=].text = "Relationship"
      * item[=].answer[+].valueString = "Wife"
      * item[+].linkId = "prsb-cpr-involvement-role"
      * item[=].text = "Role"
      * item[=].answer[+].valueString = "Present at the discussion"
* item[+].linkId = "s4"
* item[=].text = "4 Person demographics"
* item[=]
  * item[+].linkId = "5"
  * item[=].text = "Person family name"
  * item[=].answer[+].valueString = "LIVERPOOL"
  * item[+].linkId = "6"
  * item[=].text = "Person forename"
  * item[=].answer[+].valueString = "Ned"
  * item[+].linkId = "7"
  * item[=].text = "Person preferred name"
  * item[=].answer[+].valueString = "Ned"
  * item[+].linkId = "8"
  * item[=].text = "Person birth date"
  * item[=].answer[+].valueDate = "1942-06-18"
  * item[+].linkId = "9"
  * item[=].text = "NHS number"
  * item[=].answer[+].valueString = "9737383206"
  * item[+].linkId = "10"
  * item[=].text = "NHS number status indicator code"
  * item[=].answer[+].valueString = "01 Number present and verified"
  * item[+].linkId = "11"
  * item[=].text = "Person gender"
  * item[=].answer[+].valueCoding = $sct#248153007 "Male"
  * item[+].linkId = "12"
  * item[=].text = "Person address"
  * item[=].answer[+].valueString = "20 Forthlin Road, LIVERPOOL, L18 9TN"
  * item[+].linkId = "13"
  * item[=].text = "Person telephone numbers"
  * item[=].answer[+].valueString = "0151 496 0201"
  * item[+].linkId = "carer"
  * item[=].text = "Main carer"
  * item[=]
    * item[+].linkId = "16"
    * item[=].text = "Availability of carer support"
    * item[=].answer[+].valueCoding = $sct#184156005 "Has a carer"
    * item[+].linkId = "16.name"
    * item[=].text = "Main carer name"
    * item[=].answer[+].valueString = "Joan LIVERPOOL"
    * item[+].linkId = "17"
    * item[=].text = "Main carer telephone numbers"
    * item[=].answer[+].valueString = "07700 900123"
* item[+].linkId = "s5"
* item[=].text = "5 Special requirements"
* item[=]
  * item[+].linkId = "14"
  * item[=].text = "Need for an interpreter"
  * item[=].answer[+].valueCoding = $sct#315595002 "Interpreter not needed"
  * item[+].linkId = "15"
  * item[=].text = "Preferred spoken language"
  * item[=].answer[+].valueCoding = $sct#315570003 "Main spoken language English"
  * item[+].linkId = "29"
  * item[=].text = "Functional status (Australia-modified Karnofsky Performance Status score 0-100)"
  * item[=].answer[+].valueInteger = 30
  * item[+].linkId = "28"
  * item[=].text = "Disability"
  * item[=].answer[+].valueCoding = $sct#750691000000106 "No known disability"
  * item[+].linkId = "33"
  * item[=].text = "EoLC tool in use"
  * item[=].answer[+].valueCoding = $sct#414937009 "On gold standards palliative care framework"
  * item[+].linkId = "prsb-register"
  * item[=].text = "Person is on the palliative care register (PRSB)"
  * item[=].answer[+].valueCoding = $sct#526631000000108 "On end of life care register"
* item[+].linkId = "s6"
* item[=].text = "6 Information and advice given"
* item[=]
  * item[+].linkId = "18"
  * item[=].text = "Is main carer aware of person's prognosis?"
  * item[=].answer[+].valueCoding = $sct#473316003 "Relative aware of prognosis"
  * item[+].linkId = "48"
  * item[=].text = "Awareness of cardiopulmonary resuscitation decision"
  * item[=].answer[+].valueCoding = $sct#975291000000108 "Family member informed of cardiopulmonary resuscitation clinical decision"
* item[+].linkId = "s7"
* item[=].text = "7 GP practice"
* item[=]
  * item[+].linkId = "19"
  * item[=].text = "Usual GP name"
  * item[=].answer[+].valueString = "Dr Rachel FICTITIOUS"
  * item[+].linkId = "20"
  * item[=].text = "Practice details (ODS code)"
  * item[=].answer[+].valueString = "GP001 - FICTITIOUS Medical Practice"
* item[+].linkId = "s8"
* item[=].text = "8 Key worker"
* item[=]
  * item[+].linkId = "21"
  * item[=].text = "Key worker name if not usual GP"
  * item[=].answer[+].valueString = "Sarah FICTITIOUS, district nurse"
  * item[+].linkId = "22"
  * item[=].text = "Key worker telephone number"
  * item[=].answer[+].valueString = "0151 496 0123"
* item[+].linkId = "s9"
* item[=].text = "9 Services and care"
* item[=]
  * item[+].linkId = "23"
  * item[=].text = "Care workers involved in care: name"
  * item[=].answer[+].valueString = "Community Specialist Palliative Care Team"
  * item[+].linkId = "24"
  * item[=].text = "Care workers involved in care: professional group"
  * item[=].answer[+].valueCoding = $sct#850951000000107 "Under care of palliative care specialist nurse"
  * item[+].linkId = "25"
  * item[=].text = "Telephone numbers for care workers involved in care"
  * item[=].answer[+].valueString = "0151 496 0456"
* item[+].linkId = "s10"
* item[=].text = "10 Diagnoses"
* item[=]
  * item[+].linkId = "26"
  * item[=].text = "Primary end of life care diagnosis"
  * item[=].answer[+].valueCoding = $sct#363350007 "Malignant neoplasm of caecum"
  * item[+].linkId = "27"
  * item[=].text = "Other relevant end of life care diagnoses and clinical issues"
  * item[=].answer[+].valueCoding = $sct#94381002 "Metastatic malignant neoplasm to liver"
  * item[+].linkId = "34"
  * item[=].text = "Likely prognosis"
  * item[=].answer[+].valueCoding = $sct#955231000000109 "Last weeks of life"
* item[+].linkId = "s11"
* item[=].text = "11 Allergies or adverse reactions"
* item[=]
  * item[+].linkId = "30"
  * item[=].text = "Allergies/adverse drug reactions"
  * item[=].answer[+].valueCoding = $sct#716186003 "No known allergy"
* item[+].linkId = "s12"
* item[=].text = "12 Medications and medical devices"
* item[=]
  * item[+].linkId = "31"
  * item[=].text = "Anticipatory medicines/just in case box issued"
  * item[=].answer[+].valueCoding = $sct#376201000000102 "Issue of palliative care anticipatory medication box"
  * item[+].linkId = "32"
  * item[=].text = "Location of anticipatory medicines/just in case box"
  * item[=].answer[+].valueString = "Just in case box in the kitchen cupboard"
* item[+].linkId = "s13"
* item[=].text = "13 Legal information"
* item[=]
  * item[+].linkId = "advance-statement"
  * item[=].text = "Advance statement"
  * item[=]
    * item[+].linkId = "35"
    * item[=].text = "Has advance statement"
    * item[=].answer[+].valueCoding = $sct#816281000000101 "Has advance statement (Mental Capacity Act 2005)"
    * item[+].linkId = "35.text"
    * item[=].text = "Advance statement requests and preferences"
    * item[=].answer[+].valueString = "Wishes to stay at home with his family, and does not want to go back into hospital."
  * item[+].linkId = "lpa"
  * item[=].text = "Lasting power of attorney for personal welfare"
  * item[=]
    * item[+].linkId = "51"
    * item[=].text = "Name of Lasting Power of Attorney for personal welfare"
    * item[=].answer[+].valueString = "Joan LIVERPOOL"
    * item[+].linkId = "52"
    * item[=].text = "Authority of LPA"
    * item[=].answer[+].valueCoding = $sct#816361000000101 "Has appointed person with personal welfare lasting power of attorney (Mental Capacity Act 2005)"
    * item[+].linkId = "53"
    * item[=].text = "Telephone number(s) concerning Lasting Power of Attorney"
    * item[=].answer[+].valueString = "07700 900123"
* item[+].linkId = "s14"
* item[=].text = "14 Person and carers' concerns, expectations and wishes"
* item[=]
  * item[+].linkId = "ppd1"
  * item[=].text = "Preferred place of death 1st choice"
  * item[=]
    * item[+].linkId = "36"
    * item[=].text = "Preferred place of death 1st choice"
    * item[=].answer[+].valueCoding = EOLDeathLocationTypeCS#30 "Hospice"
    * item[+].linkId = "39"
    * item[=].text = "Preferred place of death (1st choice) is usual place of residence"
    * item[=].answer[+].valueBoolean = false
  * item[+].linkId = "ppd2"
  * item[=].text = "Preferred place of death 2nd choice"
  * item[=]
    * item[+].linkId = "40"
    * item[=].text = "Preferred place of death 2nd choice"
    * item[=].answer[+].valueCoding = EOLDeathLocationTypeCS#21 "Patient's own home"
  * item[+].linkId = "58"
  * item[=].text = "Other relevant issues or preferences about provision of care"
  * item[=].answer[+].valueString = "Ned now wishes to be cared for in the hospice if his symptoms cannot be controlled at home. Key safe by the front door - the code is held by the district nursing team."
  * item[+].linkId = "prsb-contingency"
  * item[=].text = "Contingency plans (PRSB)"
  * item[=]
    * item[+].linkId = "prsb-contingency-name"
    * item[=].text = "Contingency plan name"
    * item[=].answer[+].valueString = "Treatment escalation plan"
    * item[+].linkId = "prsb-contingency-trigger"
    * item[=].text = "Trigger factors"
    * item[=].answer[+].valueString = "Increasing pain, vomiting or new confusion"
    * item[+].linkId = "prsb-contingency-action"
    * item[=].text = "What should happen"
    * item[=].answer[+].valueString = "Contact the community palliative care team, or the GP out of hours service. Manage at home using the anticipatory medicines. Hospital admission only for symptoms that cannot be controlled at home."
    * item[+].linkId = "prsb-contingency-updated"
    * item[=].text = "Date this plan was last updated"
    * item[=].answer[+].valueDate = "2026-11-02"

Instance:   EolObs1-1
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 1 Consent status"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#1
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#882921000000109 "Consent given for sharing end of life care coordination record"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-44
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 44 Cardiopulmonary resuscitation decision"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#44
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#450476008 "Not for cardiopulmonary resuscitation"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-45
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 45 Date of cardiopulmonary resuscitation decision"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#45
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueDateTime = "2026-10-12"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-46
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 46 Date for review of cardiopulmonary resuscitation decision"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#46
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueDateTime = "2026-11-09"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-47
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 47 Location of cardiopulmonary resuscitation documentation"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#47
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueString = "ReSPECT form in the folder on the kitchen table"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-16
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 16 Availability of carer support"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#16
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#184156005 "Has a carer"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-14
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 14 Need for an interpreter"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#14
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#315595002 "Interpreter not needed"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-15
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 15 Preferred spoken language"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#15
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#315570003 "Main spoken language English"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-29
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 29 Functional status (Australia-modified Karnofsky Performance Status score 0-100)"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#29
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueInteger = 50
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-28
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 28 Disability"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#28
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#750691000000106 "No known disability"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-33
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 33 EoLC tool in use"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#33
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#414937009 "On gold standards palliative care framework"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-18
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 18 Is main carer aware of person's prognosis?"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#18
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#473316003 "Relative aware of prognosis"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-48
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 48 Awareness of cardiopulmonary resuscitation decision"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#48
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#975291000000108 "Family member informed of cardiopulmonary resuscitation clinical decision"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-34
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 34 Likely prognosis"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#34
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#968211000000101 "Last months of life"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-30
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 30 Allergies/adverse drug reactions"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#30
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#716186003 "No known allergy"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-31
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 31 Anticipatory medicines/just in case box issued"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#31
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#376201000000102 "Issue of palliative care anticipatory medication box"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-32
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 32 Location of anticipatory medicines/just in case box"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#32
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueString = "Just in case box in the kitchen cupboard"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-35
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 35 Has advance statement"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#35
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#816281000000101 "Has advance statement (Mental Capacity Act 2005)"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-52
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 52 Authority of LPA"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#52
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#816361000000101 "Has appointed person with personal welfare lasting power of attorney (Mental Capacity Act 2005)"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-36
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 36 Preferred place of death 1st choice"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#36
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = EOLDeathLocationTypeCS#21 "Patient's own home"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-39
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 39 Preferred place of death (1st choice) is usual place of residence"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#39
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueBoolean = true
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-40
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 40 Preferred place of death 2nd choice"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#40
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = EOLDeathLocationTypeCS#30 "Hospice"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-41
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 41 Preferred place of death organisation name (2nd choice)"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#41
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueString = "FICTITIOUS Hospice"
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs1-58
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 58 Other relevant issues or preferences about provision of care"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse1."
Usage:      #example
* status = #final
* code = EOLDataItemCS#58
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-10-12T14:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueString = "Key safe by the front door - the code is held by the district nursing team. Ned's dog is friendly."
* derivedFrom = Reference(EolQuestionnaireResponse1)

Instance:   EolObs2-46
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 46 Date for review of cardiopulmonary resuscitation decision"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse2."
Usage:      #example
* status = #amended
* code = EOLDataItemCS#46
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-11-02T10:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueDateTime = "2026-11-16"
* derivedFrom = Reference(EolQuestionnaireResponse2)

Instance:   EolObs2-29
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 29 Functional status (Australia-modified Karnofsky Performance Status score 0-100)"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse2."
Usage:      #example
* status = #amended
* code = EOLDataItemCS#29
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-11-02T10:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueInteger = 30
* derivedFrom = Reference(EolQuestionnaireResponse2)

Instance:   EolObs2-34
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 34 Likely prognosis"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse2."
Usage:      #example
* status = #amended
* code = EOLDataItemCS#34
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-11-02T10:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = $sct#955231000000109 "Last weeks of life"
* derivedFrom = Reference(EolQuestionnaireResponse2)

Instance:   EolObs2-36
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 36 Preferred place of death 1st choice"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse2."
Usage:      #example
* status = #amended
* code = EOLDataItemCS#36
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-11-02T10:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = EOLDeathLocationTypeCS#30 "Hospice"
* derivedFrom = Reference(EolQuestionnaireResponse2)

Instance:   EolObs2-39
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 39 Preferred place of death (1st choice) is usual place of residence"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse2."
Usage:      #example
* status = #amended
* code = EOLDataItemCS#39
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-11-02T10:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueBoolean = false
* derivedFrom = Reference(EolQuestionnaireResponse2)

Instance:   EolObs2-40
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 40 Preferred place of death 2nd choice"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse2."
Usage:      #example
* status = #amended
* code = EOLDataItemCS#40
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-11-02T10:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueCodeableConcept = EOLDeathLocationTypeCS#21 "Patient's own home"
* derivedFrom = Reference(EolQuestionnaireResponse2)

Instance:   EolObs2-58
InstanceOf: PalliativeCareRecordObservation
Title:      "SCCI1580 58 Other relevant issues or preferences about provision of care"
Description: "Fictitious example. Extracted from EolQuestionnaireResponse2."
Usage:      #example
* status = #amended
* code = EOLDataItemCS#58
* subject = Reference(EolPatient)
* effectiveDateTime = "2026-11-02T10:00:00+00:00"
* performer = Reference(EolPalliativeConsultant)
* valueString = "Ned now wishes to be cared for in the hospice if his symptoms cannot be controlled at home. Key safe by the front door - the code is held by the district nursing team."
* derivedFrom = Reference(EolQuestionnaireResponse2)

Instance:   EolComposition1
InstanceOf: PalliativeCareRecordComposition
Title:      "Palliative Care Record for Ned LIVERPOOL (version 1)"
Description: "Fictitious example. Palliative Care Record Document Composition: sections in ReSPECT order, with International Patient Summary coded subsections."
Usage:      #inline
* identifier.system = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/eol-record"
* identifier.value = "EOL-0001-v1"
* status = #final
* subject = Reference(EolPatient)
* date = "2026-10-12T14:00:00+00:00"
* author = Reference(EolPalliativeConsultant)
* title = "Palliative Care Record"
* attester.mode = #professional
* attester.time = "2026-10-12T14:00:00+00:00"
* attester.party = Reference(EolPalliativeConsultant)
* custodian = Reference(EolProvider)
* section[planBelongsTo].title = "1. This plan belongs to"
* section[planBelongsTo].code = EOLDocumentSectionCS#respect-1
* section[planBelongsTo].text.status = #generated
* section[planBelongsTo].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Person family name</td><td>LIVERPOOL</td></tr><tr><td>Person forename</td><td>Ned</td></tr><tr><td>Person preferred name</td><td>Ned</td></tr><tr><td>Person birth date</td><td>1942-06-18</td></tr><tr><td>NHS number</td><td>9737383206</td></tr><tr><td>NHS number status indicator code</td><td>01 Number present and verified</td></tr><tr><td>Person gender</td><td>Male</td></tr><tr><td>Person address</td><td>20 Forthlin Road, LIVERPOOL, L18 9TN</td></tr><tr><td>Person telephone numbers</td><td>0151 496 0201</td></tr></table></div>"
* section[planBelongsTo].entry[+] = Reference(EolPatient)
* section[sharedUnderstanding].title = "2. Shared understanding of my health and current condition"
* section[sharedUnderstanding].code = EOLDocumentSectionCS#respect-2
* section[sharedUnderstanding].text.status = #generated
* section[sharedUnderstanding].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Likely prognosis</td><td>Last months of life</td></tr><tr><td>EoLC tool in use</td><td>On gold standards palliative care framework</td></tr><tr><td>Person is on the palliative care register (PRSB)</td><td>On end of life care register</td></tr></table></div>"
* section[sharedUnderstanding].entry[+] = Reference(EolObs1-34)
* section[sharedUnderstanding].entry[+] = Reference(EolObs1-33)
* section[sharedUnderstanding].section[problems].title = "Problems"
* section[sharedUnderstanding].section[problems].code = http://loinc.org#11450-4 "Problem list - Reported"
* section[sharedUnderstanding].section[problems].text.status = #generated
* section[sharedUnderstanding].section[problems].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Primary end of life care diagnosis</td><td>Malignant neoplasm of caecum</td></tr><tr><td>Other relevant end of life care diagnoses and clinical issues</td><td>Metastatic malignant neoplasm to liver</td></tr></table></div>"
* section[sharedUnderstanding].section[problems].entry[+] = Reference(PathPrimaryCancerCondition)
* section[sharedUnderstanding].section[problems].entry[+] = Reference(EolLiverMetastases)
* section[sharedUnderstanding].section[allergies].title = "Allergies and intolerances"
* section[sharedUnderstanding].section[allergies].code = http://loinc.org#48765-2 "Allergies and adverse reactions Document"
* section[sharedUnderstanding].section[allergies].text.status = #generated
* section[sharedUnderstanding].section[allergies].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Allergies/adverse drug reactions</td><td>No known allergy</td></tr></table></div>"
* section[sharedUnderstanding].section[allergies].entry[+] = Reference(EolObs1-30)
* section[sharedUnderstanding].section[medications].title = "Medicines"
* section[sharedUnderstanding].section[medications].code = http://loinc.org#10160-0 "History of Medication use Narrative"
* section[sharedUnderstanding].section[medications].text.status = #generated
* section[sharedUnderstanding].section[medications].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Anticipatory medicines/just in case box issued</td><td>Issue of palliative care anticipatory medication box</td></tr><tr><td>Location of anticipatory medicines/just in case box</td><td>Just in case box in the kitchen cupboard</td></tr></table></div>"
* section[sharedUnderstanding].section[medications].entry[+] = Reference(EolObs1-31)
* section[sharedUnderstanding].section[medications].entry[+] = Reference(EolObs1-32)
* section[sharedUnderstanding].section[functionalStatus].title = "Functional status"
* section[sharedUnderstanding].section[functionalStatus].code = http://loinc.org#47420-5 "Functional Status Assessment Note"
* section[sharedUnderstanding].section[functionalStatus].text.status = #generated
* section[sharedUnderstanding].section[functionalStatus].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Functional status (Australia-modified Karnofsky Performance Status score 0-100)</td><td>50</td></tr><tr><td>Disability</td><td>No known disability</td></tr></table></div>"
* section[sharedUnderstanding].section[functionalStatus].entry[+] = Reference(EolObs1-29)
* section[sharedUnderstanding].section[functionalStatus].entry[+] = Reference(EolObs1-28)
* section[sharedUnderstanding].section[advanceDirectives].title = "Advance directives"
* section[sharedUnderstanding].section[advanceDirectives].code = http://loinc.org#42348-3 "Advance Healthcare Directives"
* section[sharedUnderstanding].section[advanceDirectives].text.status = #generated
* section[sharedUnderstanding].section[advanceDirectives].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Has advance statement</td><td>Has advance statement (Mental Capacity Act 2005)</td></tr><tr><td>Authority of LPA</td><td>Has appointed person with personal welfare lasting power of attorney (Mental Capacity Act 2005)</td></tr></table></div>"
* section[sharedUnderstanding].section[advanceDirectives].entry[+] = Reference(EolObs1-35)
* section[sharedUnderstanding].section[advanceDirectives].entry[+] = Reference(EolObs1-52)
* section[whatMattersToMe].title = "3. What matters to me in decisions about my treatment and care"
* section[whatMattersToMe].code = EOLDocumentSectionCS#respect-3
* section[whatMattersToMe].text.status = #generated
* section[whatMattersToMe].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Recorded in the subsections below.</p></div>"
* section[whatMattersToMe].section[patientStory].title = "My preferences"
* section[whatMattersToMe].section[patientStory].code = http://loinc.org#81338-6 "Patient Goals, Preferences, and Priorities for Care Experience"
* section[whatMattersToMe].section[patientStory].text.status = #generated
* section[whatMattersToMe].section[patientStory].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Advance statement requests and preferences</td><td>Wishes to stay at home with his family, and does not want to go back into hospital.</td></tr><tr><td>Preferred place of death 1st choice</td><td>Patient&#x27;s own home</td></tr><tr><td>Preferred place of death (1st choice) is usual place of residence</td><td>Yes</td></tr><tr><td>Preferred place of death 2nd choice</td><td>Hospice</td></tr><tr><td>Preferred place of death organisation name (2nd choice)</td><td>FICTITIOUS Hospice</td></tr><tr><td>Other relevant issues or preferences about provision of care</td><td>Key safe by the front door - the code is held by the district nursing team. Ned&#x27;s dog is friendly.</td></tr></table></div>"
* section[whatMattersToMe].section[patientStory].entry[+] = Reference(EolObs1-36)
* section[whatMattersToMe].section[patientStory].entry[+] = Reference(EolObs1-39)
* section[whatMattersToMe].section[patientStory].entry[+] = Reference(EolObs1-40)
* section[whatMattersToMe].section[patientStory].entry[+] = Reference(EolObs1-41)
* section[whatMattersToMe].section[patientStory].entry[+] = Reference(EolObs1-58)
* section[clinicalRecommendations].title = "4. Clinical recommendations for emergency care and treatment"
* section[clinicalRecommendations].code = EOLDocumentSectionCS#respect-4
* section[clinicalRecommendations].text.status = #generated
* section[clinicalRecommendations].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Cardiopulmonary resuscitation decision</td><td>Not for cardiopulmonary resuscitation</td></tr><tr><td>Date of cardiopulmonary resuscitation decision</td><td>2026-10-12</td></tr><tr><td>Location of cardiopulmonary resuscitation documentation</td><td>ReSPECT form in the folder on the kitchen table</td></tr></table></div>"
* section[clinicalRecommendations].entry[+] = Reference(EolObs1-44)
* section[clinicalRecommendations].entry[+] = Reference(EolObs1-45)
* section[clinicalRecommendations].entry[+] = Reference(EolObs1-47)
* section[clinicalRecommendations].section[planOfCare].title = "Care plan and contingency plans"
* section[clinicalRecommendations].section[planOfCare].code = http://loinc.org#18776-5 "Plan of Care Note"
* section[clinicalRecommendations].section[planOfCare].text.status = #generated
* section[clinicalRecommendations].section[planOfCare].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Contingency plan name</td><td>Treatment escalation plan</td></tr><tr><td>Trigger factors</td><td>Increasing pain, vomiting or new confusion</td></tr><tr><td>What should happen</td><td>Contact the community palliative care team, or the GP out of hours service. Manage at home using the anticipatory medicines. Hospital admission only for symptoms that cannot be controlled at home.</td></tr><tr><td>Date this plan was last updated</td><td>2026-10-12</td></tr></table></div>"
* section[clinicalRecommendations].section[planOfCare].entry[+] = Reference(EolCarePlan)
* section[capacity].title = "5. Capacity for involvement in making this plan"
* section[capacity].code = EOLDocumentSectionCS#respect-5
* section[capacity].text.status = #generated
* section[capacity].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Consent status</td><td>Consent given for sharing end of life care coordination record</td></tr></table></div>"
* section[capacity].entry[+] = Reference(EolObs1-1)
* section[involvement].title = "6. Involvement in making this plan"
* section[involvement].code = EOLDocumentSectionCS#respect-6
* section[involvement].text.status = #generated
* section[involvement].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Awareness of cardiopulmonary resuscitation decision</td><td>Family member informed of cardiopulmonary resuscitation clinical decision</td></tr><tr><td>Is main carer aware of person&#x27;s prognosis?</td><td>Relative aware of prognosis</td></tr><tr><td>Name</td><td>Joan LIVERPOOL</td></tr><tr><td>Relationship</td><td>Wife</td></tr><tr><td>Role</td><td>Present at the discussion</td></tr></table></div>"
* section[involvement].entry[+] = Reference(EolObs1-48)
* section[involvement].entry[+] = Reference(EolObs1-18)
* section[clinicianSignatures].title = "7. Clinicians' signatures"
* section[clinicianSignatures].code = EOLDocumentSectionCS#respect-7
* section[clinicianSignatures].text.status = #generated
* section[clinicianSignatures].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Clinician</td><td>Dr Priya FICTITIOUS, Consultant in Palliative Medicine (GMC C5678901)</td></tr><tr><td>Date and time</td><td>2026-10-12T14:00:00+00:00</td></tr></table></div>"
* section[emergencyContacts].title = "8. Emergency contacts and those involved in discussing this plan"
* section[emergencyContacts].code = EOLDocumentSectionCS#respect-8
* section[emergencyContacts].text.status = #generated
* section[emergencyContacts].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Name of Lasting Power of Attorney for personal welfare</td><td>Joan LIVERPOOL</td></tr><tr><td>Telephone number(s) concerning Lasting Power of Attorney</td><td>07700 900123</td></tr><tr><td>Usual GP name</td><td>Dr Rachel FICTITIOUS</td></tr><tr><td>Practice details (ODS code)</td><td>GP001 - FICTITIOUS Medical Practice</td></tr><tr><td>Key worker name if not usual GP</td><td>Sarah FICTITIOUS, district nurse</td></tr><tr><td>Key worker telephone number</td><td>0151 496 0123</td></tr><tr><td>Care workers involved in care: name</td><td>Community Specialist Palliative Care Team</td></tr><tr><td>Care workers involved in care: professional group</td><td>Under care of palliative care specialist nurse</td></tr><tr><td>Telephone numbers for care workers involved in care</td><td>0151 496 0456</td></tr></table></div>"
* section[emergencyContacts].entry[+] = Reference(EolCareTeam)
* section[emergencyContacts].section[socialHistory].title = "Main carer"
* section[emergencyContacts].section[socialHistory].code = http://loinc.org#29762-2 "Social history note"
* section[emergencyContacts].section[socialHistory].text.status = #generated
* section[emergencyContacts].section[socialHistory].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Availability of carer support</td><td>Has a carer</td></tr><tr><td>Main carer name</td><td>Joan LIVERPOOL</td></tr><tr><td>Main carer telephone numbers</td><td>07700 900123</td></tr></table></div>"
* section[emergencyContacts].section[socialHistory].entry[+] = Reference(EolCarer)
* section[emergencyContacts].section[socialHistory].entry[+] = Reference(EolObs1-16)
* section[formReviewed].title = "9. Form reviewed and remains relevant"
* section[formReviewed].code = EOLDocumentSectionCS#respect-9
* section[formReviewed].text.status = #generated
* section[formReviewed].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Planned review date</td><td>2026-11-09</td></tr><tr><td>Date and time of last amendment</td><td>2026-10-12T14:00:00+00:00</td></tr><tr><td>Date for review of cardiopulmonary resuscitation decision</td><td>2026-11-09</td></tr></table></div>"
* section[formReviewed].entry[+] = Reference(EolObs1-46)

Instance:   EolComposition2
InstanceOf: PalliativeCareRecordComposition
Title:      "Palliative Care Record for Ned LIVERPOOL (version 2)"
Description: "Fictitious example. Palliative Care Record Document Composition: sections in ReSPECT order, with International Patient Summary coded subsections."
Usage:      #inline
* identifier.system = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/eol-record"
* identifier.value = "EOL-0001-v2"
* status = #final
* subject = Reference(EolPatient)
* date = "2026-11-02T10:00:00+00:00"
* author = Reference(EolPalliativeConsultant)
* title = "Palliative Care Record"
* attester.mode = #professional
* attester.time = "2026-11-02T10:00:00+00:00"
* attester.party = Reference(EolPalliativeConsultant)
* custodian = Reference(EolProvider)
* relatesTo.code = #replaces
* relatesTo.targetIdentifier.system = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/eol-record"
* relatesTo.targetIdentifier.value = "EOL-0001-v1"
* section[planBelongsTo].title = "1. This plan belongs to"
* section[planBelongsTo].code = EOLDocumentSectionCS#respect-1
* section[planBelongsTo].text.status = #generated
* section[planBelongsTo].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Person family name</td><td>LIVERPOOL</td></tr><tr><td>Person forename</td><td>Ned</td></tr><tr><td>Person preferred name</td><td>Ned</td></tr><tr><td>Person birth date</td><td>1942-06-18</td></tr><tr><td>NHS number</td><td>9737383206</td></tr><tr><td>NHS number status indicator code</td><td>01 Number present and verified</td></tr><tr><td>Person gender</td><td>Male</td></tr><tr><td>Person address</td><td>20 Forthlin Road, LIVERPOOL, L18 9TN</td></tr><tr><td>Person telephone numbers</td><td>0151 496 0201</td></tr></table></div>"
* section[planBelongsTo].entry[+] = Reference(EolPatient)
* section[sharedUnderstanding].title = "2. Shared understanding of my health and current condition"
* section[sharedUnderstanding].code = EOLDocumentSectionCS#respect-2
* section[sharedUnderstanding].text.status = #generated
* section[sharedUnderstanding].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Likely prognosis</td><td>Last weeks of life</td></tr><tr><td>EoLC tool in use</td><td>On gold standards palliative care framework</td></tr><tr><td>Person is on the palliative care register (PRSB)</td><td>On end of life care register</td></tr></table></div>"
* section[sharedUnderstanding].entry[+] = Reference(EolObs2-34)
* section[sharedUnderstanding].entry[+] = Reference(EolObs1-33)
* section[sharedUnderstanding].section[problems].title = "Problems"
* section[sharedUnderstanding].section[problems].code = http://loinc.org#11450-4 "Problem list - Reported"
* section[sharedUnderstanding].section[problems].text.status = #generated
* section[sharedUnderstanding].section[problems].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Primary end of life care diagnosis</td><td>Malignant neoplasm of caecum</td></tr><tr><td>Other relevant end of life care diagnoses and clinical issues</td><td>Metastatic malignant neoplasm to liver</td></tr></table></div>"
* section[sharedUnderstanding].section[problems].entry[+] = Reference(PathPrimaryCancerCondition)
* section[sharedUnderstanding].section[problems].entry[+] = Reference(EolLiverMetastases)
* section[sharedUnderstanding].section[allergies].title = "Allergies and intolerances"
* section[sharedUnderstanding].section[allergies].code = http://loinc.org#48765-2 "Allergies and adverse reactions Document"
* section[sharedUnderstanding].section[allergies].text.status = #generated
* section[sharedUnderstanding].section[allergies].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Allergies/adverse drug reactions</td><td>No known allergy</td></tr></table></div>"
* section[sharedUnderstanding].section[allergies].entry[+] = Reference(EolObs1-30)
* section[sharedUnderstanding].section[medications].title = "Medicines"
* section[sharedUnderstanding].section[medications].code = http://loinc.org#10160-0 "History of Medication use Narrative"
* section[sharedUnderstanding].section[medications].text.status = #generated
* section[sharedUnderstanding].section[medications].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Anticipatory medicines/just in case box issued</td><td>Issue of palliative care anticipatory medication box</td></tr><tr><td>Location of anticipatory medicines/just in case box</td><td>Just in case box in the kitchen cupboard</td></tr></table></div>"
* section[sharedUnderstanding].section[medications].entry[+] = Reference(EolObs1-31)
* section[sharedUnderstanding].section[medications].entry[+] = Reference(EolObs1-32)
* section[sharedUnderstanding].section[functionalStatus].title = "Functional status"
* section[sharedUnderstanding].section[functionalStatus].code = http://loinc.org#47420-5 "Functional Status Assessment Note"
* section[sharedUnderstanding].section[functionalStatus].text.status = #generated
* section[sharedUnderstanding].section[functionalStatus].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Functional status (Australia-modified Karnofsky Performance Status score 0-100)</td><td>30</td></tr><tr><td>Disability</td><td>No known disability</td></tr></table></div>"
* section[sharedUnderstanding].section[functionalStatus].entry[+] = Reference(EolObs2-29)
* section[sharedUnderstanding].section[functionalStatus].entry[+] = Reference(EolObs1-28)
* section[sharedUnderstanding].section[advanceDirectives].title = "Advance directives"
* section[sharedUnderstanding].section[advanceDirectives].code = http://loinc.org#42348-3 "Advance Healthcare Directives"
* section[sharedUnderstanding].section[advanceDirectives].text.status = #generated
* section[sharedUnderstanding].section[advanceDirectives].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Has advance statement</td><td>Has advance statement (Mental Capacity Act 2005)</td></tr><tr><td>Authority of LPA</td><td>Has appointed person with personal welfare lasting power of attorney (Mental Capacity Act 2005)</td></tr></table></div>"
* section[sharedUnderstanding].section[advanceDirectives].entry[+] = Reference(EolObs1-35)
* section[sharedUnderstanding].section[advanceDirectives].entry[+] = Reference(EolObs1-52)
* section[whatMattersToMe].title = "3. What matters to me in decisions about my treatment and care"
* section[whatMattersToMe].code = EOLDocumentSectionCS#respect-3
* section[whatMattersToMe].text.status = #generated
* section[whatMattersToMe].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Recorded in the subsections below.</p></div>"
* section[whatMattersToMe].section[patientStory].title = "My preferences"
* section[whatMattersToMe].section[patientStory].code = http://loinc.org#81338-6 "Patient Goals, Preferences, and Priorities for Care Experience"
* section[whatMattersToMe].section[patientStory].text.status = #generated
* section[whatMattersToMe].section[patientStory].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Advance statement requests and preferences</td><td>Wishes to stay at home with his family, and does not want to go back into hospital.</td></tr><tr><td>Preferred place of death 1st choice</td><td>Hospice</td></tr><tr><td>Preferred place of death (1st choice) is usual place of residence</td><td>No</td></tr><tr><td>Preferred place of death 2nd choice</td><td>Patient&#x27;s own home</td></tr><tr><td>Other relevant issues or preferences about provision of care</td><td>Ned now wishes to be cared for in the hospice if his symptoms cannot be controlled at home. Key safe by the front door - the code is held by the district nursing team.</td></tr></table></div>"
* section[whatMattersToMe].section[patientStory].entry[+] = Reference(EolObs2-36)
* section[whatMattersToMe].section[patientStory].entry[+] = Reference(EolObs2-39)
* section[whatMattersToMe].section[patientStory].entry[+] = Reference(EolObs2-40)
* section[whatMattersToMe].section[patientStory].entry[+] = Reference(EolObs2-58)
* section[clinicalRecommendations].title = "4. Clinical recommendations for emergency care and treatment"
* section[clinicalRecommendations].code = EOLDocumentSectionCS#respect-4
* section[clinicalRecommendations].text.status = #generated
* section[clinicalRecommendations].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Cardiopulmonary resuscitation decision</td><td>Not for cardiopulmonary resuscitation</td></tr><tr><td>Date of cardiopulmonary resuscitation decision</td><td>2026-10-12</td></tr><tr><td>Location of cardiopulmonary resuscitation documentation</td><td>ReSPECT form in the folder on the kitchen table</td></tr></table></div>"
* section[clinicalRecommendations].entry[+] = Reference(EolObs1-44)
* section[clinicalRecommendations].entry[+] = Reference(EolObs1-45)
* section[clinicalRecommendations].entry[+] = Reference(EolObs1-47)
* section[clinicalRecommendations].section[planOfCare].title = "Care plan and contingency plans"
* section[clinicalRecommendations].section[planOfCare].code = http://loinc.org#18776-5 "Plan of Care Note"
* section[clinicalRecommendations].section[planOfCare].text.status = #generated
* section[clinicalRecommendations].section[planOfCare].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Contingency plan name</td><td>Treatment escalation plan</td></tr><tr><td>Trigger factors</td><td>Increasing pain, vomiting or new confusion</td></tr><tr><td>What should happen</td><td>Contact the community palliative care team, or the GP out of hours service. Manage at home using the anticipatory medicines. Hospital admission only for symptoms that cannot be controlled at home.</td></tr><tr><td>Date this plan was last updated</td><td>2026-11-02</td></tr></table></div>"
* section[clinicalRecommendations].section[planOfCare].entry[+] = Reference(EolCarePlan)
* section[capacity].title = "5. Capacity for involvement in making this plan"
* section[capacity].code = EOLDocumentSectionCS#respect-5
* section[capacity].text.status = #generated
* section[capacity].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Consent status</td><td>Consent given for sharing end of life care coordination record</td></tr></table></div>"
* section[capacity].entry[+] = Reference(EolObs1-1)
* section[involvement].title = "6. Involvement in making this plan"
* section[involvement].code = EOLDocumentSectionCS#respect-6
* section[involvement].text.status = #generated
* section[involvement].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Awareness of cardiopulmonary resuscitation decision</td><td>Family member informed of cardiopulmonary resuscitation clinical decision</td></tr><tr><td>Is main carer aware of person&#x27;s prognosis?</td><td>Relative aware of prognosis</td></tr><tr><td>Name</td><td>Joan LIVERPOOL</td></tr><tr><td>Relationship</td><td>Wife</td></tr><tr><td>Role</td><td>Present at the discussion</td></tr></table></div>"
* section[involvement].entry[+] = Reference(EolObs1-48)
* section[involvement].entry[+] = Reference(EolObs1-18)
* section[clinicianSignatures].title = "7. Clinicians' signatures"
* section[clinicianSignatures].code = EOLDocumentSectionCS#respect-7
* section[clinicianSignatures].text.status = #generated
* section[clinicianSignatures].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Clinician</td><td>Dr Priya FICTITIOUS, Consultant in Palliative Medicine (GMC C5678901)</td></tr><tr><td>Date and time</td><td>2026-11-02T10:00:00+00:00</td></tr></table></div>"
* section[emergencyContacts].title = "8. Emergency contacts and those involved in discussing this plan"
* section[emergencyContacts].code = EOLDocumentSectionCS#respect-8
* section[emergencyContacts].text.status = #generated
* section[emergencyContacts].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Name of Lasting Power of Attorney for personal welfare</td><td>Joan LIVERPOOL</td></tr><tr><td>Telephone number(s) concerning Lasting Power of Attorney</td><td>07700 900123</td></tr><tr><td>Usual GP name</td><td>Dr Rachel FICTITIOUS</td></tr><tr><td>Practice details (ODS code)</td><td>GP001 - FICTITIOUS Medical Practice</td></tr><tr><td>Key worker name if not usual GP</td><td>Sarah FICTITIOUS, district nurse</td></tr><tr><td>Key worker telephone number</td><td>0151 496 0123</td></tr><tr><td>Care workers involved in care: name</td><td>Community Specialist Palliative Care Team</td></tr><tr><td>Care workers involved in care: professional group</td><td>Under care of palliative care specialist nurse</td></tr><tr><td>Telephone numbers for care workers involved in care</td><td>0151 496 0456</td></tr></table></div>"
* section[emergencyContacts].entry[+] = Reference(EolCareTeam)
* section[emergencyContacts].section[socialHistory].title = "Main carer"
* section[emergencyContacts].section[socialHistory].code = http://loinc.org#29762-2 "Social history note"
* section[emergencyContacts].section[socialHistory].text.status = #generated
* section[emergencyContacts].section[socialHistory].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Availability of carer support</td><td>Has a carer</td></tr><tr><td>Main carer name</td><td>Joan LIVERPOOL</td></tr><tr><td>Main carer telephone numbers</td><td>07700 900123</td></tr></table></div>"
* section[emergencyContacts].section[socialHistory].entry[+] = Reference(EolCarer)
* section[emergencyContacts].section[socialHistory].entry[+] = Reference(EolObs1-16)
* section[formReviewed].title = "9. Form reviewed and remains relevant"
* section[formReviewed].code = EOLDocumentSectionCS#respect-9
* section[formReviewed].text.status = #generated
* section[formReviewed].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td>Planned review date</td><td>2026-11-16</td></tr><tr><td>Date and time of last amendment</td><td>2026-11-02T10:00:00+00:00</td></tr><tr><td>Date for review of cardiopulmonary resuscitation decision</td><td>2026-11-16</td></tr></table></div>"
* section[formReviewed].entry[+] = Reference(EolObs2-46)

Instance:   EolDocument1
InstanceOf: Bundle
Title:      "Palliative Care Record Document for Ned LIVERPOOL (version 1)"
Description: "Fictitious example. The Palliative Care Record Document - a Bundle of type document."
Usage:      #example
* identifier.system = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/eol-document"
* identifier.value = "EOL-0001-v1"
* type = #document
* timestamp = "2026-10-12T14:05:00+00:00"
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Composition/EolComposition1"
* entry[=].resource = EolComposition1
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Patient/EolPatient"
* entry[=].resource = EolPatient
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Practitioner/EolPalliativeConsultant"
* entry[=].resource = EolPalliativeConsultant
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Organization/EolProvider"
* entry[=].resource = EolProvider
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Organization/EolGPPractice"
* entry[=].resource = EolGPPractice
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/RelatedPerson/EolCarer"
* entry[=].resource = EolCarer
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/CarePlan/EolCarePlan"
* entry[=].resource = EolCarePlan
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/CareTeam/EolCareTeam"
* entry[=].resource = EolCareTeam
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Practitioner/EolKeyWorker"
* entry[=].resource = EolKeyWorker
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Organization/EolPalliativeCareService"
* entry[=].resource = EolPalliativeCareService
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Condition/EolLiverMetastases"
* entry[=].resource = EolLiverMetastases
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Condition/PathPrimaryCancerCondition"
* entry[=].resource = PathPrimaryCancerCondition
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/PathHistologicType"
* entry[=].resource = PathHistologicType
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Specimen/PathSpecimenH23-41022"
* entry[=].resource = PathSpecimenH23-41022
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Practitioner/PathPathologist"
* entry[=].resource = PathPathologist
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Organization/PathLaboratory"
* entry[=].resource = PathLaboratory
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/QuestionnaireResponse/EolQuestionnaireResponse1"
* entry[=].resource = EolQuestionnaireResponse1
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-1"
* entry[=].resource = EolObs1-1
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-44"
* entry[=].resource = EolObs1-44
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-45"
* entry[=].resource = EolObs1-45
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-46"
* entry[=].resource = EolObs1-46
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-47"
* entry[=].resource = EolObs1-47
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-16"
* entry[=].resource = EolObs1-16
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-14"
* entry[=].resource = EolObs1-14
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-15"
* entry[=].resource = EolObs1-15
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-29"
* entry[=].resource = EolObs1-29
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-28"
* entry[=].resource = EolObs1-28
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-33"
* entry[=].resource = EolObs1-33
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-18"
* entry[=].resource = EolObs1-18
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-48"
* entry[=].resource = EolObs1-48
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-34"
* entry[=].resource = EolObs1-34
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-30"
* entry[=].resource = EolObs1-30
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-31"
* entry[=].resource = EolObs1-31
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-32"
* entry[=].resource = EolObs1-32
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-35"
* entry[=].resource = EolObs1-35
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-52"
* entry[=].resource = EolObs1-52
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-36"
* entry[=].resource = EolObs1-36
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-39"
* entry[=].resource = EolObs1-39
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-40"
* entry[=].resource = EolObs1-40
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-41"
* entry[=].resource = EolObs1-41
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-58"
* entry[=].resource = EolObs1-58

Instance:   EolDocument2
InstanceOf: Bundle
Title:      "Palliative Care Record Document for Ned LIVERPOOL (version 2)"
Description: "Fictitious example. The Palliative Care Record Document - a Bundle of type document."
Usage:      #example
* identifier.system = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/eol-document"
* identifier.value = "EOL-0001-v2"
* type = #document
* timestamp = "2026-11-02T10:05:00+00:00"
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Composition/EolComposition2"
* entry[=].resource = EolComposition2
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Patient/EolPatient"
* entry[=].resource = EolPatient
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Practitioner/EolPalliativeConsultant"
* entry[=].resource = EolPalliativeConsultant
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Organization/EolProvider"
* entry[=].resource = EolProvider
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Organization/EolGPPractice"
* entry[=].resource = EolGPPractice
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/RelatedPerson/EolCarer"
* entry[=].resource = EolCarer
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/CarePlan/EolCarePlan"
* entry[=].resource = EolCarePlan
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/CareTeam/EolCareTeam"
* entry[=].resource = EolCareTeam
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Practitioner/EolKeyWorker"
* entry[=].resource = EolKeyWorker
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Organization/EolPalliativeCareService"
* entry[=].resource = EolPalliativeCareService
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Condition/EolLiverMetastases"
* entry[=].resource = EolLiverMetastases
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Condition/PathPrimaryCancerCondition"
* entry[=].resource = PathPrimaryCancerCondition
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/PathHistologicType"
* entry[=].resource = PathHistologicType
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Specimen/PathSpecimenH23-41022"
* entry[=].resource = PathSpecimenH23-41022
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Practitioner/PathPathologist"
* entry[=].resource = PathPathologist
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Organization/PathLaboratory"
* entry[=].resource = PathLaboratory
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/QuestionnaireResponse/EolQuestionnaireResponse1"
* entry[=].resource = EolQuestionnaireResponse1
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/QuestionnaireResponse/EolQuestionnaireResponse2"
* entry[=].resource = EolQuestionnaireResponse2
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-1"
* entry[=].resource = EolObs1-1
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-44"
* entry[=].resource = EolObs1-44
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-45"
* entry[=].resource = EolObs1-45
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs2-46"
* entry[=].resource = EolObs2-46
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-47"
* entry[=].resource = EolObs1-47
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-16"
* entry[=].resource = EolObs1-16
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-14"
* entry[=].resource = EolObs1-14
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-15"
* entry[=].resource = EolObs1-15
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs2-29"
* entry[=].resource = EolObs2-29
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-28"
* entry[=].resource = EolObs1-28
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-33"
* entry[=].resource = EolObs1-33
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-18"
* entry[=].resource = EolObs1-18
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-48"
* entry[=].resource = EolObs1-48
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs2-34"
* entry[=].resource = EolObs2-34
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-30"
* entry[=].resource = EolObs1-30
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-31"
* entry[=].resource = EolObs1-31
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-32"
* entry[=].resource = EolObs1-32
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-35"
* entry[=].resource = EolObs1-35
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs1-52"
* entry[=].resource = EolObs1-52
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs2-36"
* entry[=].resource = EolObs2-36
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs2-39"
* entry[=].resource = EolObs2-39
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs2-40"
* entry[=].resource = EolObs2-40
* entry[+].fullUrl = "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/Observation/EolObs2-58"
* entry[=].resource = EolObs2-58

