Profile:        CancerPathologyComposition
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Composition-eu-lab
Id:             CancerPathologyComposition
Title:          "Cancer Pathology Composition"
Description:    """
**Proof of concept - not an authoritative source.**

The Composition of a cancer pathology report sent as a FHIR Document, for document
sharing. Based on HL7 Europe Laboratory `Composition-eu-lab`, following the
[inferred layout](PathologyReport.html#inferred-layout): a narrative surgical
pathology section using the NAACCR Volume V LOINC section codes, a synoptic report
section whose entries are the COSD Pathology coded results, and the HL7 Europe
annotations section. Plays the same role as the US Pathology Composition in the HL7
US Cancer Pathology Data Sharing IG.
"""
* ^experimental = true
* type = $loinc#60567-5 "Comprehensive pathology report panel"
* subject 1..1 MS
* subject only Reference($EuPatient)
* author MS
* author ^short = "Reporting pathologist (pCR7130/pCR7140)"
* custodian MS
* custodian ^short = "Reporting laboratory (pCR0800)"
* attester MS
* attester ^short = "Authorising pathologist; attester.time is the Investigation Result Date (pCR0780)"
* relatesTo MS
* relatesTo ^short = "Supplementary report or second opinion (pCR0960 code 5) - relatesTo code appends or replaces"

* section contains
    surgicalPathology 0..1 MS and
    synopticReport 0..1 MS

* section[surgicalPathology] ^short = "Surgical pathology study - the narrative report"
* section[surgicalPathology].code = $loinc#11529-5 "Surgical pathology study"
* section[surgicalPathology].text 1..1
* section[surgicalPathology].entry 0..0
* section[surgicalPathology].section ^short = "Narrative subsections, coded with the NAACCR Volume V LOINC section codes: 22636-5 clinical history, 22633-2 site of origin (entry: Cancer Pathology Specimen), 22634-0 gross description, 22635-7 microscopic observation, 22637-3 final diagnosis (pCR1020; entry: Primary Cancer Condition)"

* section[synopticReport] ^short = "Pathology synoptic report - COSD Pathology core content"
* section[synopticReport].code = $loinc#60568-3 "Pathology synoptic report"
* section[synopticReport].text 1..1
* section[synopticReport].entry 1..* MS
* section[synopticReport].entry only Reference(CancerPathologySpecimen or PrimaryCancerCondition or HistologicBehaviorAndType or HistologicGrade or TumorSize or TNMPrimaryTumorCategory or TNMRegionalNodesCategory or TNMDistantMetastasesCategory or TNMStageGroup or TumorMarkerTest or http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab)
* section[synopticReport].entry ^comment = "The same resources the Cancer Pathology Diagnostic Report references in result and specimen. Second-level sections for the COSD groups (specimen, diagnosis, tumour, lymph nodes, stage, biomarkers) would need local section codes - not assigned."
