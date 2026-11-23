Profile:        PathologyTestResultComposition
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Composition-eu-lab
Id:             PathologyTestResultComposition
Title:          "Pathology Test Result Composition"
Description:    """
**Proof of concept - not an authoritative source.**

The Composition of a pathology test result (blood sciences, microbiology, cellular pathology
screening) sent as a FHIR Document. Based on HL7 Europe Laboratory `Composition-eu-lab` and
the [NHS England Pathology FHIR IG 0.5.1 examples](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/Examples/Examples-Index?version=0.5.1):
a level 1 section for the laboratory specialty, a level 2 section for each report item
(battery, specimen study or individual test) coded with the PaLM SNOMED CT code and LOINC,
and the HL7 Europe annotations section.
"""
* ^experimental = true
* type MS
* type ^short = "LOINC 11502-2 Laboratory report; SNOMED CT 721981007 Diagnostic studies report may be added as a second coding"
* category MS
* category[studyType] 1..* MS
* category[studyType] ^short = "LOINC study type - the same code as the level 1 section (e.g. 18723-7 Hematology studies)"
* category[specialty] MS
* category[specialty] ^short = "SNOMED CT laboratory specialty (e.g. 394916005 Hematopathology; NHS England examples: 394915009 General pathology)"
* subject 1..1 MS
* subject only Reference($EuPatient)
* author MS
* author ^short = "Reporting laboratory (ODS code) or authorising practitioner"
* custodian MS
* custodian ^short = "Reporting laboratory (ODS code)"
* attester MS
* attester ^short = "Authorising clinical scientist or pathologist, if the report is authorised by a person"
* section MS
* section ^short = "Level 1: laboratory specialty, coded with the HL7 Europe study type (lab-studyType-eu-lab); or the annotations section (48767-8)"
* section ^comment = "Each level 1 section other than annotations carries a narrative summary and one level 2 section per report item. A specialty with one report item may instead hold the narrative and entries itself (HL7 Europe Laboratory leaf section)."
* section.section MS
* section.section ^short = "Level 2: report item - a battery, specimen study or individual test, coded with the PaLM SNOMED CT code and/or LOINC"
* section.section ^comment = "Narrative table of the results (test, result, units, reference range, flag) and entries for the Observations: the battery Observation (with hasMember) or each result Observation. Groups inside a report item (e.g. microscopy, culture and susceptibility) are Observation.hasMember, not further sections - HL7 Europe Laboratory allows two levels of sections."
* section.section.entry MS
* section.section.section 0..0
