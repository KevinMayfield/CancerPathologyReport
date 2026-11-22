<div class="alert alert-danger" role="alert">
<b>Proof of concept.</b> This implementation guide is a demonstration only. It is
<b>not</b> an authoritative source, is not endorsed by NHS England, the National
Disease Registration Service or HL7, and must not be used for implementation or
clinical purposes. The authoritative sources are the standards each page references -
for example the <a href="https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology">COSD Pathology User Guide</a>
or <a href="https://standards.nhs.uk/published-standards/palliative-care-coordination-core-content">SCCI1580</a>.
</div>

<div class="alert alert-info" role="alert">
This page follows the NHS North West Genomics <a href="https://nw-gmsa.github.io/en/hl7v2.html">HL7 v2</a>
page and shows <b>pathology examples only</b>. Message structures, segment and data type
definitions, and conventions (ODS codes as assigning authorities, LOINC and SNOMED CT
coding) are defined there and are not repeated here. HL7 v2.5.1. All examples are
fictitious; report PDFs are shortened (<code>JVBERi0x...</code>).
</div>

### Summary of Changes

How these messages differ from a typical NHS laboratory HL7 v2 interface. **Order
Filler** means the laboratory (LIMS) sending a report, including a laboratory that
places a reflex or subcontracted order.

| # | Change | HL7 v2 | Guidance |
|---|---|---|---|
| 1 | **Based on the HL7 Europe Laboratory Report, the NHS England HL7 v2 ADT specification and the DHCW `ORU_R01` specification** - not UK Core, whose diagnostics profiles are still draft | All segments | [HL7 Europe Laboratory Report](https://hl7.eu/fhir/laboratory/) for the content; [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) for `MSH`, `PID`, `PV1` and the data types; [DHCW HL7 ORU_R01 2.5.1](https://nw-gmsa.github.io/DHCW-HL7-v2-5-1-ORUR01-Specification.pdf) for the report |
| 2 | **Specimen type is SNOMED CT** - the main change from following HL7 Europe | `SPM-4` | Coded from the HL7 Europe [Specimen Types](https://hl7.eu/fhir/laboratory/ValueSet-lab-specimenType-eu-lab.html) value set (`Specimen.type`), not HL7 v2 table 0487 - e.g. `119297000^Blood specimen^SNM3` |
| 3 | **Hospital Spell strongly suggested, as an Account Number** | `PV1-19` (`CX`, identifier type `AN`) | The NHS England Hospital Provider Spell, with the ODS code as assigning authority - e.g. `SP2308140915^^^R0A^AN`. Using a visit or consultant episode identifier for `PV1` is **discouraged**. The Order Filler should populate it in the report if it was supplied in the order |
| 4 | **Medical Record Number strongly recommended** | `PID-3` (`CX`, identifier type `MR`) | The hospital number, with the ODS code of the organisation that assigned it - e.g. `7742315^^^R0A^MR`, alongside the NHS number (`^^^NHS^NH`). Use of the [Local Patient Identifier](https://www.datadictionary.nhs.uk/attributes/local_patient_identifier.html) (no assigning organisation) is **discouraged** |
| 5 | **Order Placer Number recommended - for both the reflex order and the original order** | `ORC-2`, `OBR-2` (`EI`); original order in `ORC-8` and `OBR-29` (parent, `EIP`) | With the ODS code of the organisation that placed it - e.g. `1583320^R0A`. An Order Filler should include it in the report if it was provided in the order. A reflex order carries its own placer number and the original order's (see the [LAB-35](LAB-35.html#example-lynch-syndrome) example) |
| 6 | **Placer Group Number recommended - for reflex and subcontracted orders** | `ORC-4` (`EI`) | Groups the orders placed together. An Order Filler should include it in the report if it was provided in the order |
| 7 | **LOINC or SNOMED CT for observations encouraged** - including LOINC as well as SNOMED CT is encouraged | `OBX-3`, and `OBR-4` for the test or panel (`CWE`, LOINC and SNOMED CT as primary and alternate codes) | LOINC resolves practical issues, such as a test with no SNOMED CT code - for example the COSD items and most genomic tests. The SNOMED CT **UK edition** pathology concepts (used by the NHS England examples) and the concepts from the **LOINC - SNOMED CT collaboration** are not currently the same, so the two cannot be assumed to be interchangeable - e.g. `718-7^Hemoglobin [Mass/volume] in Blood^LN^1107511000000100^Haemoglobin mass concentration in blood^SCT`. Local codes remain common in practice and are kept in the converted examples |
{:.grid}

The examples on this page follow these recommendations where the source example has the
information; the NHS England and DHCW examples are converted, so some (for example a
Hospital Spell) are not available.

### OML_O21 Laboratory Order

#### References

- NW Genomics HL7 v2 - [OML_O21 Laboratory Order](https://nw-gmsa.github.io/en/hl7v2.html#oml_o21-laboratory-order) - message structure and segments
- [Laboratory Testing Workflow (LTW)](LTW.html) and [Inter-Laboratory Workflow (ILW)](ILW.html)

#### Examples

##### Laboratory Order (LAB-1)

[LAB-1](LAB-1.html): Manchester University NHS Foundation Trust (`R0A`) orders histopathology
from the Manchester Royal Infirmary laboratory (`690S0`) for Ned LIVERPOOL's colonoscopic
biopsies of a caecal mass - the start of the [Lynch syndrome](index.html#worked-example-lynch-syndrome)
example. The order number `1583320^R0A` is the one the laboratory's report and the reflex
order to genomics refer back to.

```
MSH|^~\&|EPR|R0A|LIMS|690S0|20230814101500+0000||OML^O21^OML_O21|urn:uuid:3d6f2b1e-8c4a-4e57-9a0b-1f2e3d4c5b6a|T|2.5.1|||AL
PID|1||9737383206^^^NHS^NH~7742315^^^R0A^MR||LIVERPOOL^Ned^^^^^L||19420618|M|||20 Forthlin Road^^LIVERPOOL^^L18 9TN
PV1|1|O|^^^R0A02^^^^^^^R0A||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||301^Gastroenterology^2.16.840.1.113883.2.1.6.8|||||||C3456789^Darwin^Samuel^^^Dr^^^GMC||SP2308140915^^^R0A^AN|||||||||||||||||||||||||20230814080000+0000
ORC|NW|1583320^R0A|||||||20230814101500+0000|||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
OBR|1|1583320^R0A||HISTO^Histopathology^690S0|||20230814100000+0000|||||||||C3456789^Darwin^Samuel^^^Dr^^^GMC
NTE|1||Change in bowel habit. Colonoscopy: ulcerated mass in the caecum.
SPM|1|1583320-A&R0A||258415003^Biopsy specimen^SNM3||BF10^Buffered 10% formalin^HL70371|86273004^Biopsy^SNM3|32713005^Caecum structure^SNM3||||||A: Caecal mass, colonoscopic biopsies|||20230814100000+0000|||Y
```

> FHIR Message Example: [Bundle Message - Laboratory Order (LAB-1) - Histopathology](Bundle-HL7v2Msg-LAB1-Histopathology.html)

> FHIR: [Cancer Pathology Specimen](StructureDefinition-CancerPathologySpecimen.html) - example [Specimen A](Specimen-PathSpecimenH23-41022.html)

##### Sub-order (LAB-35)

[LAB-35](LAB-35.html): the same laboratory reflexes MLH1 promoter hypermethylation (`M1.5`) to
the North West GLH, sending the pathology report as prior results. The full message is on the
[LAB-35](LAB-35.html#example-lynch-syndrome) page and the NW Genomics
[HL7 v2](https://nw-gmsa.github.io/en/hl7v2.html#sub-order-lab-35) page.

> FHIR Message Example (NW Genomics IG): [Bundle Message - Genomic Reflex Order M1.5](https://nw-gmsa.github.io/en/Bundle-GenomicsOrderMessage-LynchReflex.html)

### ORU_R01 Unsolicited transmission of an observation message

#### References

- NW Genomics HL7 v2 - [ORU_R01](https://nw-gmsa.github.io/en/hl7v2.html#oru_r01-unsolicited-transmission-of-an-observation-message) - message structure and segments
- [Order Results Management [LAB-3]](LAB-3.html) - NAACCR Volume V, and the proposed coding of COSD Pathology items in `OBX`
- [Cancer Pathology Report](PathologyReport.html) - the content of a histopathology report
- NHS England [Pathology FHIR Implementation Guide - Examples](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/Examples/Examples-Index?version=0.5.1) (0.5.1) - source of the [NHS England examples](#laboratory-report-lab-3---nhs-england-pathology-fhir-ig-examples) below
- [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](https://nw-gmsa.github.io/DHCW-HL7-v2-5-1-ORUR01-Specification.pdf) (v2.0.0) - source of the [DHCW examples](#laboratory-report-lab-3---dhcw-examples-adapted) below, re-cast as Cheshire and Merseyside laboratories reporting to a Welsh health board

#### Examples

##### Laboratory Report (LAB-3) - Histopathology

[LAB-3](LAB-3.html): the Manchester Royal Infirmary laboratory reports Ned LIVERPOOL's biopsy
to the requester. One `OBR` per part of the report, each linked to the first through
`OBR-29` (parent): the report (`HISTO`) with the primary site and the PDF, the tumour
morphology panel (`77753-2`), and the mismatch repair immunohistochemistry (`MMR`). Each
COSD item is coded with LOINC in `OBX-3`, with the COSD `pCR` code as the alternate code.
These are the same segments sent as prior results in the [LAB-35](LAB-35.html#example-lynch-syndrome)
reflex order, except that the morphology uses the current SNOMED CT code `1187332001`
(`35917007` is inactive).

```
MSH|^~\&|LIMS|690S0|EPR|R0A|20230821090500+0000||ORU^R01^ORU_R01|urn:uuid:8b2c4e71-0f3d-4a6e-b5c9-7d8e9f0a1b2c|T|2.5.1|||AL
PID|1||9737383206^^^NHS^NH~7742315^^^R0A^MR||LIVERPOOL^Ned^^^^^L||19420618|M|||20 Forthlin Road^^LIVERPOOL^^L18 9TN
PV1|1|O|^^^R0A02^^^^^^^R0A||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||301^Gastroenterology^2.16.840.1.113883.2.1.6.8|||||||C3456789^Darwin^Samuel^^^Dr^^^GMC||SP2308140915^^^R0A^AN|||||||||||||||||||||||||20230814080000+0000
ORC|RE|1583320^R0A|H23-41022^690S0||CM|||||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
OBR|1|1583320^R0A|H23-41022^690S0|HISTO^Histopathology^690S0|||20230814100000+0000|||||||||C3456789^Darwin^Samuel^^^Dr^^^GMC||||||20230821090000+0000|||F
OBX|1|CWE|21855-2^Primary site Cancer^LN^pCR6410^Topography (SNOMED)^COSD||C18.0^Cecum^ICDO3^32713005^Caecum structure^SNM3||||||F
OBX|2|ED|1054291000000102^Cellular pathology report^SNM3||^application^pdf^Base64^JVBERi0x...||||||F
SPM|1|H23-41022-A&690S0|1583320-A&R0A|258415003^Biopsy specimen^SNM3||BF10^Buffered 10% formalin^HL70371|86273004^Biopsy^SNM3|32713005^Caecum structure^SNM3||||||A: Caecal mass, colonoscopic biopsies|||20230814100000+0000|20230814150000+0000
OBR|2|1583320^R0A|H23-41022^690S0|77753-2^Tumor morphology panel Cancer^LN|||20230814100000+0000|||||||||||||||20230821090000+0000|||F||||1583320&R0A^H23-41022&690S0
OBX|1|CWE|31205-8^Histology ICD-O-3 Cancer^LN^pCR6420^Morphology (SNOMED)^COSD||8140^Adenocarcinoma, NOS^ICDO3^1187332001^Adenocarcinoma^SNM3||||||F
OBX|2|CWE|31206-6^Behavior ICD-O-3 Cancer^LN||3^Malignant, primary site^ICDO3||||||F
OBR|3|1583320^R0A|H23-41022^690S0|MMR^Mismatch repair immunohistochemistry^690S0|||20230814100000+0000|||||||||||||||20230821090000+0000|||F||||1583320&R0A^H23-41022&690S0
OBX|1|CWE|81691-8^MLH-1 Ag [Presence] in Cancer specimen by Immune stain^LN^pCR7020^MLH1 Nuclear Expression Intact^COSD||LA9634-2^Absent^LN||||||F
OBX|2|CWE|81694-2^PMS2 Ag [Presence] in Cancer specimen by Immune stain^LN^pCR7030^PMS2 Nuclear Expression Intact^COSD||LA9634-2^Absent^LN||||||F
OBX|3|CWE|81692-6^MSH-2 Ag [Presence] in Cancer specimen by Immune stain^LN^pCR7040^MSH2 Nuclear Expression Intact^COSD||LA9633-4^Present^LN||||||F
OBX|4|CWE|81693-4^MSH-6 Ag [Presence] in Cancer specimen by Immune stain^LN^pCR7050^MSH6 Nuclear Expression Intact^COSD||LA9633-4^Present^LN||||||F
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - Histopathology](Bundle-HL7v2Msg-LAB3-Histopathology.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Cancer Pathology Report - Histopathology report H23-41022](Bundle-PathDocument.html) - [Cancer Pathology Composition](StructureDefinition-CancerPathologyComposition.html) and [Cancer Pathology Diagnostic Report](StructureDefinition-CancerPathologyDiagnosticReport.html); see [What the reader sees](PathologyReport.html#what-the-reader-sees)

The supplementary *tumour assessment for molecular testing* (block A1, tumour cell
content 40%) follows as a further `OBR` (`TMA`) - see the [LAB-35](LAB-35.html#example-lynch-syndrome)
message.

##### Laboratory Report (LAB-3) - Full Blood Count with Result Copy

[LAB-3](LAB-3.html): a child on chemotherapy has a full blood count taken at a Paediatric
Oncology Shared Care Unit; the Principal Treatment Centre is named as a result copy recipient
(`OBR-28`), so the laboratory sends the same report to both - option A of the
[Children's Cancer Shared Care](ChildrensCancerSharedCare.html#future-process) use case.
Results are LOINC coded with UCUM units, reference ranges and abnormal flags. `POS01`
(shared care unit), `POL01` (its laboratory) and `PTC01` (treatment centre) are
placeholders, not ODS codes.

```
MSH|^~\&|LIMS|POL01|EPR|POS01|20261118113000+0000||ORU^R01^ORU_R01|urn:uuid:c41e7a90-5b2d-4f83-9e16-2a7b8c9d0e1f|T|2.5.1|||AL
PID|1||9991000011^^^NHS^NH~P2219834^^^POS01^MR||PRESTON^Lily^^^^^L||20160302|F|||14 Fishergate^^PRESTON^^PR1 2NJ
ORC|RE|PO-26-11873^POS01|LB26-552901^POL01||CM|||||||C7654321^FICTITIOUS^Alex^^^Dr^^^GMC|||||||||FICTITIOUS SHARED CARE UNIT^^POS01^^^ODS
OBR|1|PO-26-11873^POS01|LB26-552901^POL01|58410-2^CBC panel - Blood by Automated count^LN|||20261118090000+0000|||||||||C7654321^FICTITIOUS^Alex^^^Dr^^^GMC||||||20261118112500+0000|||F|||C1234567^FICTITIOUS^Oliver^^^Dr^^^GMC^^^^^PTC01
OBX|1|NM|718-7^Hemoglobin [Mass/volume] in Blood^LN||98|g/L^gram per litre^UCUM|115-155|L|||F|||20261118112500+0000
OBX|2|NM|6690-2^Leukocytes [#/volume] in Blood by Automated count^LN||2.1|10*9/L^billion per litre^UCUM|4.5-13.5|L|||F|||20261118112500+0000
OBX|3|NM|751-8^Neutrophils [#/volume] in Blood by Automated count^LN||0.6|10*9/L^billion per litre^UCUM|1.5-8.0|L|||F|||20261118112500+0000
OBX|4|NM|777-3^Platelets [#/volume] in Blood by Automated count^LN||85|10*9/L^billion per litre^UCUM|150-450|L|||F|||20261118112500+0000
SPM|1|LB26-552901-1&POL01||119297000^Blood specimen^SNM3||EDTK^Potassium/K EDTA^HL70371|||||||||||20261118090000+0000|20261118100500+0000
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - Full Blood Count with Result Copy](Bundle-HL7v2Msg-LAB3-FBC-ResultCopy.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - Full Blood Count with Result Copy](Bundle-HL7v2Msg-LAB3-FBC-ResultCopy-Document.html)

The same message goes to the shared care unit (Order Placer) and to the treatment centre
(result copy). The neutropenia (neutrophils 0.6 x 10<sup>9</sup>/L) is the kind of result the
treatment centre acts on before the next cycle of chemotherapy.

##### Laboratory Report (LAB-3) - DHCW Examples, Adapted

Two examples from section 7 of the
[DHCW HL7 ORU_R01 2.5.1 Implementation Guide](https://nw-gmsa.github.io/DHCW-HL7-v2-5-1-ORUR01-Specification.pdf),
re-cast as **English laboratories in Cheshire and Merseyside reporting to a Welsh health
board** - Betsi Cadwaladr University Health Board (`7A1`), North Wales - and adapted to the
NW GMSA conventions, so they can be used to test the NW GMSA Regional Integration Engine
(RIE). The original DHCW messages are the Testing repository's `WALES_ORU_R01_FULL.txt` and
`WALES_ORU_R01_TX.txt`.

Patients and practitioners follow the NW GMSA Testing repository
[MRN-Mapping](https://github.com/nw-gmsa/Testing/blob/main/MRN-Mapping.md) and
[Practitioner-Mapping](https://github.com/nw-gmsa/Testing/blob/main/Practitioner-Mapping.md):

| | Pathology result (DHCW 7.2) | Text based report (DHCW 7.1) |
|---|---|---|
| Laboratory (Order Filler, `MSH-4`) | Liverpool University Hospitals (`REM`) - Merseyside | Mid Cheshire Hospitals (`RBT`) - Cheshire |
| Requester (Order Placer, `MSH-6`, `ORC-21`) | Betsi Cadwaladr UHB (`7A1`), clinic at Wrexham Maelor Hospital (`7A1A4`) | Betsi Cadwaladr UHB (`7A1`), Wrexham Maelor Hospital (`7A1A4`) |
| Patient | NW Genomics test patient **WREXHAM, Myrcella** - NHS `973 738 3257`, `REM` MRN `REM7676150` - the NW's Welsh test patient | NHS England EDI test patient **EDITESTPATIENT, FIVE** - NHS `999 999 9506`, `RBT` MRN `RBT4948902` - simulating a Welsh patient |
| Ordering provider (`ORC-12`, `OBR-16`) | FICTITIOUS, Andar - GMC `C9000115` (new, `7A1`) | FICTITIOUS, Jane - GMC `C9000116` (new, `7A1`) |
{:.grid}

Changes from the DHCW examples, to follow the NW GMSA conventions:

| Item | DHCW example | Adapted |
|---|---|---|
| Sending and receiving facility (`MSH-4`, `MSH-6`) | `CAV^7A4BV^L`, `NHSWales^RQFW3^L` | ODS codes of the laboratory's trust and the health board |
| Patient identifiers (`PID-3`) | `403281375^^^154^PI~5189214567^^^NHS^NH` | NW GMSA test patient: NHS number first, then the laboratory trust's MRN with its ODS code as assigning authority |
| Patient location (`PV1-3`) | Not sent | Site and organisation ODS codes, `^^^7A1A4^^^^^^^7A1` |
| Order control (`ORC-1`) | `OR`, `MC` | `RE` - observations to follow |
| Order Placer Number (`ORC-2`, `OBR-2`) | Not sent | Added, with the health board's ODS code: `880412^7A1` |
| Filler Order Number (`ORC-3`, `OBR-3`) | `914694928301` | With the laboratory's ODS code: `914694928301^REM` |
| Ordering facility (`ORC-21`) | Not sent (the pathology department is in `ORC-13`) | The health board, with its ODS code |
| Practitioners (`ORC-12`, `OBR-10`, `OBR-16`) | Names only | Fictitious practitioners; ordering providers with a GMC code |
| Test codes (`OBR-4`, `OBX-3`) | Local laboratory codes, coding system `L` (`B0300^White blood cell (WBC) count`) | Local codes kept - laboratories send local codes in practice - with the laboratory's ODS code as the coding system (`B0300^White blood cell (WBC) count^REM`) |
| Units (`OBX-6`) | `x10\S\9/L` | UCUM `10*9/L` |
| Specimen (`SPM-2`, `SPM-4`) | `^9146949283`, `BLOO^Blood^ACME` | `^9146949283&REM`, SNOMED CT `119297000^Blood specimen` |
{:.grid}

**Pathology result** (DHCW section 7.2) - an HbA1c, then a full blood count, from Liverpool
University Hospitals to Betsi Cadwaladr:

```
MSH|^~\&|LIMS|REM|EPR|7A1|20180309160000+0000||ORU^R01^ORU_R01|urn:uuid:6a1f0c3e-9b2d-4e7a-8c5f-3d1e2b4a6c80|T|2.5.1|||AL
PID|1||9737383257^^^NHS^NH~REM7676150^^^REM^MR||WREXHAM^Myrcella^^^^^L||19991013|F|||Ffordd, Mold Rd^Mold^WREXHAM^^LL11 2AH
PV1|1|O|^^^7A1A4^^^^^^^7A1
ORC|RE|880412^7A1|914694928301^REM||CM|||||||C9000115^FICTITIOUS^Andar^^^Dr^^^GMC|||||||||BETSI CADWALADR UNIVERSITY LOCAL HEALTH BOARD^^7A1^^^ODS
OBR|1|880412^7A1|914694928301^REM|B3051^HbA1c (IFCC traceable)^REM|||201803091500|||^FICTITIOUS^Angharad||||201803091500||C9000115^FICTITIOUS^Andar^^^Dr^^^GMC||||||201803091500|||C
NTE|1||For monitoring known diabetic patients, please follow NICE guidelines. If not a known diabetic and the patient is asymptomatic, a second confirmatory sample is required within 2 weeks (WEDS Guidance). HbA1c is unreliable for diagnostic and monitoring purposes in the context of several conditions, including some haemoglobinopathies, abnormal haemoglobin levels, chronic renal failure, recent transfusion, pregnancy, or alcoholism.
OBX|1|NM|B3553^HbA1c (IFCC traceable)^REM||49|mmol/mol^millimole per mole^UCUM|<48|H|||C|||201803091500
OBR|2|880412^7A1|914694928301^REM|B0001^Full blood count^REM|||201803091500|||^FICTITIOUS^Carl||||201803091500||C9000115^FICTITIOUS^Andar^^^Dr^^^GMC||||||201803091500|||F
TQ1|||||||201803091400|201803091500|S^^^^^^^^Urgent
OBX|1|NM|B0300^White blood cell (WBC) count^REM||3.5|10*9/L^billion per litre^UCUM|4.0-11.0|L|||F|||201803091500
OBX|2|NM|B0307^Haemoglobin (Hb)^REM||200|g/L^gram per litre^UCUM|130-180|H|||F|||201803091500
OBX|3|NM|B0314^Platelet (PLT) count^REM||500|10*9/L^billion per litre^UCUM|150-400|H|||F|||201803091500
OBX|4|NM|B0306^Red blood cell (RBC) count^REM||6.00|10*12/L^trillion per litre^UCUM|4.50-6.00|N|||F|||201803091500
OBX|5|NM|B0308^Haematocrit (Hct)^REM||0.60|L/L^litre per litre^UCUM|0.40-0.52|H|||F|||201803091500
OBX|6|NM|B0309^Mean cell volume (MCV)^REM||120|fL^femtolitre^UCUM|80-100|H|||F|||201803091500
OBX|7|NM|B0310^Mean cell haemoglobin (MCH)^REM||34.0|pg^picogram^UCUM|27.0-33.0|H|||F|||201803091500
SPM|1|^9146949283&REM||119297000^Blood specimen^SNM3|||||||||||||201803091400|201803091500
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - DHCW Pathology Result, adapted](Bundle-HL7v2Msg-DHCW-PathologyResult.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - DHCW Pathology Result, adapted](Bundle-HL7v2Msg-DHCW-PathologyResult-Document.html)

**Text based report** (DHCW section 7.1) - a urine microscopy, culture and sensitivity
report from Mid Cheshire Hospitals to Betsi Cadwaladr, sent as lines of text. The report
lines are kept as text (`TX`, formatting preserved) with a local code; a discrete, coded
version (organism and antibiotic susceptibility results) is a future step.

```
MSH|^~\&|LIMS|RBT|EPR|7A1|20180524120000+0000||ORU^R01^ORU_R01|urn:uuid:9e4b7d21-3c6a-4f08-b1d5-7a2c8e0f4b93|T|2.5.1|||AL
PID|1||9999999506^^^NHS^NH~RBT4948902^^^RBT^MR||EDITESTPATIENT^FIVE^^^^^L||19901019|M|||^^^^ZZ99 3VZ
PV1|1|U|^^^7A1A4^^^^^^^7A1
ORC|RE|880413^7A1|8005372251-1-M0007^RBT||CM|||||||C9000116^FICTITIOUS^Jane^^^Dr^^^GMC|||||||||BETSI CADWALADR UNIVERSITY LOCAL HEALTH BOARD^^7A1^^^ODS
OBR|1|880413^7A1|8005372251-1-M0007^RBT|M0007^Urine MC\T\S^RBT|||201805240000|||^FICTITIOUS^Dean||||201805240000||C9000116^FICTITIOUS^Jane^^^Dr^^^GMC||||||201805240000|||F
TQ1|||||||201805240000|201805240000|R^^^^^^^^Routine
OBX|1|TX|RPT^Report line^RBT|1|Specimen received: Mid Stream Urine||||||F|||201805240000
OBX|2|TX|RPT^Report line^RBT|2|||||||F|||201805240000
OBX|3|TX|RPT^Report line^RBT|3|Accession Number(s) U18S999001A||||||F|||201805240000
OBX|4|TX|RPT^Report line^RBT|4|White Blood Cell Count 10-99 x10\S\6/L||||||F|||201805240000
OBX|5|TX|RPT^Report line^RBT|5|Red Blood Cell Count >=100 x10\S\6/L||||||F|||201805240000
OBX|6|TX|RPT^Report line^RBT|6|||||||F|||201805240000
OBX|7|TX|RPT^Report line^RBT|7|>= 10\S\8 cfu/L Escherichia coli (ECOL)||||||F|||201805240000
OBX|8|TX|RPT^Report line^RBT|8|||||||F|||201805240000
OBX|9|TX|RPT^Report line^RBT|9| Antibiotic/Culture: ECOL||||||F|||201805240000
OBX|10|TX|RPT^Report line^RBT|10| ------------------- ------||||||F|||201805240000
OBX|11|TX|RPT^Report line^RBT|11| Nitrofurantoin      S||||||F|||201805240000
OBX|12|TX|RPT^Report line^RBT|12| Trimethoprim        S||||||F|||201805240000
OBX|13|TX|RPT^Report line^RBT|13| Amoxicillin         R||||||F|||201805240000
OBX|14|TX|RPT^Report line^RBT|14|||||||F|||201805240000
SPM|1|^8005372251&RBT||258574006^Mid-stream urine specimen^SNM3|||||||||||||201805240000|201805240000
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - DHCW Text Based Report, adapted](Bundle-HL7v2Msg-DHCW-TextReport.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - DHCW Text Based Report, adapted](Bundle-HL7v2Msg-DHCW-TextReport-Document.html)

**For the NW GMSA Testing repository:** the patient and trust pairs are existing
MRN-Mapping entries, so no new MRNs are needed. The two ordering providers are new
fictitious practitioners - FICTITIOUS, Andar (`C9000115`) and FICTITIOUS, Jane
(`C9000116`), both Betsi Cadwaladr (`7A1`) - to be added to Practitioner-Mapping, and the
messages could be added as RIE test fixtures alongside the original `WALES_ORU_R01_*.txt`.
Betsi Cadwaladr (`7A1`) has no column in MRN-Mapping yet; a Welsh MRN could be added to
`PID-3` once one is assigned.

The DHCW examples' other content - the cardiac catheter report and appointment letter
(PDF, Appendix C) and the chest X-ray (Appendix A) - is not pathology and is left out;
the PDF pattern (`OBX-2` `ED`) is shown in the [histopathology report](#laboratory-report-lab-3---histopathology).

##### Laboratory Report (LAB-3) - NHS England Pathology FHIR IG Examples

The examples from the NHS England
[Pathology FHIR Implementation Guide](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/Examples/Examples-Index?version=0.5.1)
(0.5.1) - reports from a pathology laboratory to a GP practice - converted to HL7 v2
`ORU_R01`. The conversion follows the NW GMSA conventions for identifiers (ODS codes as
assigning authorities for the order numbers and specimen identifiers) but **keeps the
examples' own coding** - SNOMED CT for the tests - as laboratories send their own codes in
practice. The laboratory (`Y8J7D`) and the requesting GP practice (Pickering Medical Practice,
`B82033`) are those of the NHS England examples.

The patients keep the **names and demographics of the NHS England examples**, but their NHS
numbers are replaced. The originals (for example `972 771 0638`) are not on the NHS England PDS INT
environment, so the messages could not be traced or used to test the NW GMSA RIE. Pathology
messaging has traditionally been tested with the
[NHS England EDI test patients](https://nw-gmsa.github.io/en/testing.html#nhs-england-edi--test-patients),
which are on PDS INT, so each patient is given an EDITESTPATIENT NHS number:

| Patient (NHS England example) | Original NHS number | NHS number used (EDI test patient) | Laboratory MRN (`PID-3`, `MR`) | Examples |
|---|---|---|---|---|
| WELSH, Joel (M, 23-Aug-1972) | `972 771 0638` | `999 999 9468` (EDITESTPATIENT ONE) | `Y8J7D0381527` | HbA1c, CRP, LFT and U&E, Lipids and HbA1c |
| MOXEY, Judy (F, 6-May-2004) | `972 771 0859` | `999 999 9549` (EDITESTPATIENT NINE) | `Y8J7D0592374` | FBC, HBsAg, HPV, GTT, Urine MC&S |
{:.grid}

Only the NHS number matches PDS INT: a PDS trace returns the EDITESTPATIENT demographics, not the
example's name, date of birth and address, so tests that check demographics against PDS will see a
mismatch. The laboratory medical record numbers (MRN, identifier type `MR` with the laboratory ODS code as assigning authority) are those of the earlier conversions of the same examples in
[PathologyAndLaboratory](https://github.com/KevinMayfield/PathologyAndLaboratory)
(`examples/hl7v2/ORU_R01/`); they are to be added to the NW GMSA Testing
[MRN-Mapping](https://github.com/nw-gmsa/Testing/blob/main/MRN-Mapping.md) `Y8J7D` column. The
original patients were taken from the examples in
[ryma2fhir/FHIR_IG_PATHOLOGY_TEST](https://github.com/ryma2fhir/FHIR_IG_PATHOLOGY_TEST/tree/main/examples)
(**To confirm** against 0.5.1).

Each example therefore has **two FHIR Documents**: the NHS England original, which the
`ORU_R01` was created from, and the FHIR Document generated here from the `ORU_R01`, which
follows the HL7 Europe Laboratory Report (`Bundle-eu-lab`, `Composition-eu-lab`). They
carry the same results, but their Compositions differ:

| | NHS England original | Generated from HL7 v2 (this guide) |
|---|---|---|
| Human-readable narrative | Not included | Included in every section - a FHIR Document requires it (`Composition.section.text`) |
| Section codes | Not the HL7 Europe codes | HL7 Europe Laboratory LOINC codes: `26436-6` Laboratory studies, with one subsection per `OBR` coded with the `OBR-4` test code, and `48767-8` for comments (`NTE`) |
| Grouping of observations | The original's grouping | One subsection per `OBR`, with that `OBR`'s `OBX` results as entries; a single `DiagnosticReport` for the whole report |
| Practitioners and organisations | Practitioner and Organization resources | Continues the HL7 v2 pattern of national identifiers, as FHIR identifier references (`Reference.identifier`): GMC number for practitioners, ODS code for organisations. No Practitioner resources; the requester is a PractitionerRole whose `practitioner` and `organization` are identifier references. The only Organization resource is the laboratory, as the Composition `author` and `custodian` |
{:.grid}

Where a recipient needs Practitioner or Organization resources, they can be looked up from the
identifiers using the NHS England directory APIs or downloads - for organisations the Organisation
Data Service ([ODS FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-terminology),
[ORD API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-ord) or
[CSV downloads](https://digital.nhs.uk/services/organisation-data-service/data-search-and-export/csv-downloads),
which also list GP practitioners). Which directory to use for GMC numbers of other practitioners is
**To confirm**.

The difference in grouping probably comes from how HL7 v2 is converted to FHIR: `ORU_R01`
has only two levels, the `OBR` test and its `OBX` results, so any further structure in the
original is not carried through (**To confirm**).


**HbA1c** - HbA1c (WELSH, Joel) - NHS England original: [Bundle-HbA1c-Report-Example](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/Profiles/Examples/Bundles/Bundle-HbA1c-Report-Example?version=0.5.1):

```
MSH|^~\&|LIMS|Y8J7D|GPSYSTEM|B82033|202203081209+0000||ORU^R01^ORU_R01|NHSE-EX-0001|P|2.5.1|||AL|||UNICODE UTF-8
PID|1||9999999468^^^NHS^NH~Y8J7D0381527^^^Y8J7D^MR||WELSH^Joel^^^^^L||19720823|M|||ACONBURY^LARPOOL DRIVE^WHITBY^^YO22 4ND|||||||||||||||||||||01
PV1|1|O|^^^^^^^^PICKERING MEDICAL PRACTICE^B82033|||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN
ORC|RE|REQ-20220129-000241^B82033|REP-20220130-007843^Y8J7D||CM||||202201291024+0000|||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN|||||||||PICKERING MEDICAL PRACTICE^^^^^^^^^B82033
OBR|1|REQ-20220129-000241^B82033|REP-20220130-007843^Y8J7D|999791000000106^Haemoglobin A1c level - International Federation of Clinical Chemistry and Laboratory Medicine standardised^SCT|||202201291018+0000|||||||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN||||||202201301248+0000||CH|F
OBX|1|NM|999791000000106^Haemoglobin A1c level - International Federation of Clinical Chemistry and Laboratory Medicine standardised^SCT||54|mmol/mol^mmol/mol^UCUM|||||F|||202201291018+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
NTE|1|L|DIAGNOSIS OF DIABETES MELLITUS:\.br\HbA1c of 48 mmol/mol and above is diagnostic of DM (WHO 2011)\.br\42 - 47 mmol/mol indicates high risk of DM (NICE Guidance PH38 2012)\.br\\.br\MONITORING OF DIABETES MELLITUS (ADULTS):\.br\Type 2 target values: 48 mmol/mol – 57 mmol/mol (NICE Guidelines NG28)\.br\Type 1 target values: 48 mmol/mol or lower (NICE Guidelines NG17)
SPM|1|SPC-REQ-20220129-000362&B82033^SPC-Lab-20220129-008927&Y8J7D||^^^^^^^^Venous blood specimen|||||||||||||202201291018+0000|202201291514+0000
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - NHS England HbA1c](Bundle-HL7v2Msg-NHSE-HbA1c.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - NHS England HbA1c](Bundle-HL7v2Msg-NHSE-HbA1c-Document.html)

**CRP** - C-reactive protein (WELSH, Joel) - NHS England original: [Bundle-CRP-Report-Example](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/Profiles/Examples/Bundles/Bundle-CRP-Report-Example?version=0.5.1):

```
MSH|^~\&|LIMS|Y8J7D|GPSYSTEM|B82033|202203081209+0000||ORU^R01^ORU_R01|NHSE-EX-0002|P|2.5.1|||AL|||UNICODE UTF-8
PID|1||9999999468^^^NHS^NH~Y8J7D0381527^^^Y8J7D^MR||WELSH^Joel^^^^^L||19720823|M|||ACONBURY^LARPOOL DRIVE^WHITBY^^YO22 4ND|||||||||||||||||||||01
PV1|1|O|^^^^^^^^PICKERING MEDICAL PRACTICE^B82033|||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN
ORC|RE|REQ-20220307-000142^B82033|REP-20220308-004205^Y8J7D||CM||||202201291024+0000|||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN|||||||||PICKERING MEDICAL PRACTICE^^^^^^^^^B82033
OBR|1|REQ-20220307-000142^B82033|REP-20220308-004205^Y8J7D|1001371000000100^Serum CRP (C reactive protein) level^SCT^1106741000000105^CRP (C reactive protein) mass concentration in serum^SCT|||202203071142+0000|||||||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN||||||202203081209+0000||CH|F
OBX|1|NM|1001371000000100^Serum CRP (C reactive protein) level^SCT^1106741000000105^CRP (C reactive protein) mass concentration in serum^SCT||200|^mg/L|0-5|H|||F|||202203071142+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
SPM|1|SPC-REQ-20220307-000105&B82033^SPC-Lab-20220307-007856&Y8J7D||^^^^^^^^Venous blood specimen|||||||||||||202203071142+0000|202203071458+0000
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - NHS England CRP](Bundle-HL7v2Msg-NHSE-CRP.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - NHS England CRP](Bundle-HL7v2Msg-NHSE-CRP-Document.html)

**LFT and U&E** - Liver function tests and urea and electrolytes - two ORDER_OBSERVATION groups (WELSH, Joel) - NHS England original: [Bundle-LFT-UandE-Report-Example](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/Profiles/Examples/Bundles/Bundle-LFT-UandE-Report-Example?version=0.5.1):

```
MSH|^~\&|LIMS|Y8J7D|GPSYSTEM|B82033|202203081209+0000||ORU^R01^ORU_R01|NHSE-EX-0007|P|2.5.1|||AL|||UNICODE UTF-8
PID|1||9999999468^^^NHS^NH~Y8J7D0381527^^^Y8J7D^MR||WELSH^Joel^^^^^L||19720823|M|||ACONBURY^LARPOOL DRIVE^WHITBY^^YO22 4ND|||||||||||||||||||||01
PV1|1|O|^^^^^^^^PICKERING MEDICAL PRACTICE^B82033|||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN
ORC|RE|REQ-20220307-000046-001^B82033|REP-20220308-008902^Y8J7D||CM||||202203070948+0000|||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN|||||||||PICKERING MEDICAL PRACTICE^^^^^^^^^B82033
OBR|1|REQ-20220307-000046-001^B82033|REP-20220308-008902^Y8J7D|1031081000000108^Liver function tests^SCT|||202203071002+0000|||||||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN||||||202203081423+0000||CH|F
OBX|1|NM|997591000000109^Serum total bilirubin level^SCT^1107221000000109^Total bilirubin substance concentration in serum^SCT||6|umol/L^umol/L^UCUM|<21||||F|||202203071002+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|2|NM|1000821000000103^Serum albumin level^SCT^1105861000000106^Albumin mass concentration in serum^SCT||47|g/L^g/L^UCUM|35-50||||F|||202203071002+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|3|NM|1000621000000104^Serum alkaline phosphatase level^SCT^1106051000000106^Alkaline phosphatase enzyme activity in serum^SCT||96|[iU]/L^iu/L^UCUM|30-130||||F|||202203071002+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|4|NM|1018251000000107^Serum alanine aminotransferase level^SCT^1106081000000100^Alanine aminotransferase enzyme activity in serum^SCT||15|[iU]/L^iu/L^UCUM|<40||||F|||202203071002+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
SPM|1|SPC-REQ-20220307-000014&B82033^SPC-Lab-20220307-007856&Y8J7D||^^^^^^^^Venous blood specimen|||||||||||||202203071002+0000|202203071454+0000
ORC|RE|REQ-20220307-000046-002^B82033|REP-20220308-008902^Y8J7D||CM||||202203070948+0000|||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN|||||||||PICKERING MEDICAL PRACTICE^^^^^^^^^B82033
OBR|2|REQ-20220307-000046-002^B82033|REP-20220308-008902^Y8J7D|1000971000000107^Urea and electrolytes level^SCT|||202203071002+0000|||||||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN||||||202203081423+0000||CH|F
OBX|1|NM|1000951000000103^Serum urea level^SCT^1110281000000107^Urea substance concentration in serum^SCT||3.7|mmol/L^mmol/L^UCUM|2.5-7.8||||F|||202203071002+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|2|NM|1000661000000107^Serum sodium level^SCT^1107871000000107^Sodium substance concentration in serum^SCT||139|mmol/L^mmol/L^UCUM|133-146||||F|||202203071002+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|3|NM|1000651000000109^Serum potassium level^SCT^1107761000000109^Potassium substance concentration in serum^SCT||4.7|mmol/L^mmol/L^UCUM|3.5-5.3||||F|||202203071002+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|4|NM|1000731000000107^Serum creatinine level^SCT^1107001000000108^Creatinine substance concentration in serum^SCT||73|umol/L^umol/L^UCUM|59-104||||F|||202203071002+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|5|NM|1011481000000105^eGFR (estimated glomerular filtration rate) using creatinine Chronic Kidney Disease Epidemiology Collaboration equation per 1.73 square metres^SCT||100|mL/min/((173/100).m2)^mL/min/1.73m2^UCUM|||||F|||202203071002+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
NTE|1|L|Calculated eGFR is not valid in children or pregnancy.\.br\Less accurate with acute change in creatinine (AKI).\.br\Caution with high or low muscle mass or amputation.\.br\Avoid blood sampling within 12 hours of eating meat.\.br\Ethnicity factor comment removed Dec21 NG203.\.br\
SPM|1|SPC-REQ-20220307-000014&B82033^SPC-Lab-20220307-007856&Y8J7D||^^^^^^^^Venous blood specimen|||||||||||||202203071002+0000|202203071454+0000
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - NHS England LFT and U&E](Bundle-HL7v2Msg-NHSE-LFT-UandE.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - NHS England LFT and U&E](Bundle-HL7v2Msg-NHSE-LFT-UandE-Document.html)

**Lipids and HbA1c** - Serum lipids and HbA1c - two ORDER_OBSERVATION groups (WELSH, Joel) - NHS England original: [Bundle-Lipids-HbA1c-Report-Example](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/Profiles/Examples/Bundles/Bundle-Lipids-HbA1c-Report-Example?version=0.5.1):

```
MSH|^~\&|LIMS|Y8J7D|GPSYSTEM|B82033|202203081209+0000||ORU^R01^ORU_R01|NHSE-EX-0006|P|2.5.1|||AL|||UNICODE UTF-8
PID|1||9999999468^^^NHS^NH~Y8J7D0381527^^^Y8J7D^MR||WELSH^Joel^^^^^L||19720823|M|||ACONBURY^LARPOOL DRIVE^WHITBY^^YO22 4ND|||||||||||||||||||||01
PV1|1|O|^^^^^^^^PICKERING MEDICAL PRACTICE^B82033|||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN
ORC|RE|REQ-20220704-000027-001^B82033|REP-20220706-002378^Y8J7D||CM||||202207041105+0000|||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN|||||||||PICKERING MEDICAL PRACTICE^^^^^^^^^B82033
OBR|1|REQ-20220704-000027-001^B82033|REP-20220706-002378^Y8J7D|1005661000000103^Serum lipids level^SCT|||202207050852+0000|||||||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN||||||202207061049+0000||CH|F
OBX|1|NM|1005671000000105^Serum cholesterol level^SCT^1106541000000101^Cholesterol substance concentration in serum^SCT||6.1|mmol/L^mmol/L^UCUM|||||F|||202207050852+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|2|NM|1005681000000107^Serum high density lipoprotein cholesterol level^SCT^1107681000000108^HDL (high density lipoprotein) cholesterol substance concentration in serum^SCT||1.44|mmol/L^mmol/L^UCUM|||||F|||202207050852+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|3|NM|1015681000000109^Serum cholesterol/high density lipoprotein ratio^SCT^1107741000000108^HDL (high density lipoprotein) cholesterol/total cholesterol ratio in serum^SCT||4.2|^1/1|||||F|||202207050852+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|4|NM|1006191000000106^Serum non high density lipoprotein cholesterol level^SCT^12021000237106^Non-HDL (high density lipoprotein) cholesterol molar concentration in serum^SCT||4.7|mmol/L^mmol/L^UCUM|||||F|||202207050852+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
SPM|1|SPC-REQ-20220705-000004&B82033^SPC-Lab-20220705-006215&Y8J7D||^^^^^^^^Venous blood specimen|||||||||||||202207050852+0000|202207051517+0000
ORC|RE|REQ-20220704-000027-002^B82033|REP-20220706-002378^Y8J7D||CM||||202207041105+0000|||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN|||||||||PICKERING MEDICAL PRACTICE^^^^^^^^^B82033
OBR|2|REQ-20220704-000027-002^B82033|REP-20220706-002378^Y8J7D|999791000000106^Haemoglobin A1c level - International Federation of Clinical Chemistry and Laboratory Medicine standardised^SCT|||202207050852+0000|||||||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN||||||202207061049+0000||CH|F
OBX|1|NM|999791000000106^Haemoglobin A1c level - International Federation of Clinical Chemistry and Laboratory Medicine standardised^SCT||38|mmol/mol^mmol/mol^UCUM|||||F|||202207050852+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
SPM|1|SPC-REQ-20220705-000004&B82033^SPC-Lab-20220705-006215&Y8J7D||^^^^^^^^Venous blood specimen|||||||||||||202207050852+0000|202207051517+0000
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - NHS England Lipids and HbA1c](Bundle-HL7v2Msg-NHSE-Lipids-HbA1c.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - NHS England Lipids and HbA1c](Bundle-HL7v2Msg-NHSE-Lipids-HbA1c-Document.html)

**FBC** - Full blood count (MOXEY, Judy) - NHS England original: [Bundle-FBC-Report-Example](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/Profiles/Examples/Bundles/Bundle-FBC-Report-Example?version=0.5.1):

```
MSH|^~\&|LIMS|Y8J7D|GPSYSTEM|B82033|202202091117+0000||ORU^R01^ORU_R01|NHSE-EX-0005|P|2.5.1|||AL|||UNICODE UTF-8
PID|1||9999999549^^^NHS^NH~Y8J7D0592374^^^Y8J7D^MR||MOXEY^Judy^^^^^L||20040506|F|||1 CASTLEGATE^^PICKERING^NORTH YORKSHIRE^YO18 7AY|||||||||||||||||||||01
PV1|1|O|^^^^^^^^PICKERING MEDICAL PRACTICE^B82033|||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN
ORC|RE|REQ-20220129-000012^B82033|REP-20220209-001369^Y8J7D||CM||||202202070917+0000|||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN|||||||||PICKERING MEDICAL PRACTICE^^^^^^^^^B82033
OBR|1|REQ-20220129-000012^B82033|REP-20220209-001369^Y8J7D|1022441000000101^FBC - full blood count^SCT|||202202081023+0000|||||||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN||||||202202091117+0000||HM|F
OBX|1|NM|1022541000000102^Total white cell count^SCT^1110441000000100^White blood cell count in blood^SCT||4.76|^10*9/L|4-11||||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|2|NM|1022451000000103^Red blood cell count^SCT||3.63|^10*12/L|4.1-5.1|L|||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|3|NM|1022431000000105^Haemoglobin estimation^SCT^1107511000000100^Haemoglobin mass concentration in blood^SCT||108|^g/L|120-150|L|||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|4|NM|1022291000000105^Haematocrit^SCT^1111571000000101^Haematocrit volume fraction of blood^SCT||0.352|^l/l|0.36-0.46|L|||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|5|NM|1022491000000106^MCV - Mean corpuscular volume^SCT^1491000237105^Erythrocytes MCV (mean corpuscular volume) in blood^SCT||97|^fL|80-100||||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|6|NM|1022471000000107^MCH - Mean corpuscular haemoglobin^SCT^1022471000000107^MCH - Mean corpuscular haemoglobin^SCT||29.8|^pg|27-32||||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|7|NM|1022481000000109^MCHC - Mean corpuscular haemoglobin concentration^SCT^1022481000000109^MCHC - Mean corpuscular haemoglobin concentration^SCT||307|^g/L|315-345|L|||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|8|NM|1022651000000100^Platelet count^SCT^1108041000000107^Platelet count in blood^SCT||143|^10*9/L|140-400||||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|9|NM|1022551000000104^Neutrophil count^SCT^1108071000000101^Neutrophil count in blood^SCT||2.66|^10*9/L|2-7||||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|10|NM|1022581000000105^Lymphocyte count^SCT^67541000237108^Lymphocyte count in blood^SCT||0.7|^10*9/L|1-3|L|||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|11|NM|1022591000000107^Monocyte count^SCT^1107991000000100^Monocyte count in blood^SCT||1.3|^10*9/L|0.2-1|H|||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|12|NM|1022561000000101^Eosinophil count^SCT^1107391000000104^Eosinophil count in blood^SCT||0.07|^10*9/L|0.02-0.5||||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
OBX|13|NM|1022571000000108^Basophil count^SCT^1106091000000103^Basophil count in blood^SCT||0.03|^10*9/L|0.01-0.1||||F|||202202081023+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
SPM|1|SPC-REQ-20220208-000016&B82033^SPC-Lab-20220208-001397&Y8J7D||^^^^^^^^Venous blood specimen|||||||||||||202202081023+0000|202202081603+0000
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - NHS England FBC](Bundle-HL7v2Msg-NHSE-FBC.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - NHS England FBC](Bundle-HL7v2Msg-NHSE-FBC-Document.html)

**HBsAg** - Hepatitis B surface antigen (MOXEY, Judy) - NHS England original: [Bundle-HBsAg-Report-Example](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/Profiles/Examples/Bundles/Bundle-HBsAg-Report-Example?version=0.5.1):

```
MSH|^~\&|LIMS|Y8J7D|GPSYSTEM|B82033|202203081209+0000||ORU^R01^ORU_R01|NHSE-EX-0003|P|2.5.1|||AL|||UNICODE UTF-8
PID|1||9999999549^^^NHS^NH~Y8J7D0592374^^^Y8J7D^MR||MOXEY^Judy^^^^^L||20040506|F|||1 CASTLEGATE^^PICKERING^NORTH YORKSHIRE^YO18 7AY|||||||||||||||||||||01
PV1|1|O|^^^^^^^^PICKERING MEDICAL PRACTICE^B82033|||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN
ORC|RE|REQ-20220307-000004^B82033|REP-20220311-003927^Y8J7D||CM||||202203070953+0000|||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN|||||||||PICKERING MEDICAL PRACTICE^^^^^^^^^B82033
OBR|1|REQ-20220307-000004^B82033|REP-20220311-003927^Y8J7D|1014211000000100^Hepatitis B surface antigen level^SCT^51061000237103^Hepatitis B surface antigen in serum qualitative result^SCT|||202203071321+0000|||||||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN||||||202203111006+0000||SR|F
OBX|1|ST|1014211000000100^Hepatitis B surface antigen level^SCT^51061000237103^Hepatitis B surface antigen in serum qualitative result^SCT||Negative||||||F|||202203071321+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
SPM|1|SPC-REQ-20220307-000051&B82033^SPC-Lab-20220307-006130&Y8J7D||^^^^^^^^Venous blood specimen|||||||||||||202203071321+0000|202203071534+0000
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - NHS England HBsAg](Bundle-HL7v2Msg-NHSE-HBsAg.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - NHS England HBsAg](Bundle-HL7v2Msg-NHSE-HBsAg-Document.html)

**HPV** - Cervical screening HPV test (MOXEY, Judy) - NHS England original: [Bundle-HPV-Report-Example](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/Profiles/Examples/Bundles/Bundle-HPV-Report-Example?version=0.5.1):

```
MSH|^~\&|LIMS|Y8J7D|GPSYSTEM|B82033|202203081209+0000||ORU^R01^ORU_R01|NHSE-EX-0004|P|2.5.1|||AL|||UNICODE UTF-8
PID|1||9999999549^^^NHS^NH~Y8J7D0592374^^^Y8J7D^MR||MOXEY^Judy^^^^^L||20040506|F|||1 CASTLEGATE^^PICKERING^NORTH YORKSHIRE^YO18 7AY|||||||||||||||||||||01
PV1|1|O|^^^^^^^^PICKERING MEDICAL PRACTICE^B82033|||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN
ORC|RE|REQ-20220321-000017^B82033|REP-20220403-008209^Y8J7D||CM||||202203211017+0000|||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN|||||||||PICKERING MEDICAL PRACTICE^^^^^^^^^B82033
OBR|1|REQ-20220321-000017^B82033|REP-20220403-008209^Y8J7D|50121000237101^Human papilloma virus RNA nucleic acid amplification qualitative result^SCT|||202203221104+0000|||||||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN||||||202204031543+0000||CP|F
OBX|1|ST|50121000237101^Human papilloma virus RNA nucleic acid amplification qualitative result^SCT||Not detected||||||F|||202203221104+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
NTE|1|L|No cytology result (HPV Screening)
NTE|2|L|Suggested management : Normal  Recall
SPM|1|SPC-REQ-20220321-000065&B82033^SPC-Lab-20220322-005962&Y8J7D||^^^^^^^^Cervical swab|||||||||||||202203221104+0000|202203221525+0000
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - NHS England HPV](Bundle-HL7v2Msg-NHSE-HPV.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - NHS England HPV](Bundle-HL7v2Msg-NHSE-HPV-Document.html)

**GTT (unstructured)** - Glucose tolerance test as formatted text, three specimens (MOXEY, Judy) - NHS England original: [Bundle-GTT-Unstructured-Report-Example](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/Profiles/Examples/Bundles/Bundle-GTT-Unstructured-Report-Example?version=0.5.1):

```
MSH|^~\&|LIMS|Y8J7D|GPSYSTEM|B82033|202203081209+0000||ORU^R01^ORU_R01|NHSE-EX-0008|P|2.5.1|||AL|||UNICODE UTF-8
PID|1||9999999549^^^NHS^NH~Y8J7D0592374^^^Y8J7D^MR||MOXEY^Judy^^^^^L||20040506|F|||1 CASTLEGATE^^PICKERING^NORTH YORKSHIRE^YO18 7AY|||||||||||||||||||||01
PV1|1|O|^^^^^^^^PICKERING MEDICAL PRACTICE^B82033|||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN
ORC|RE|REQ-20220207-000013^B82033|REP-20220210-000218^Y8J7D||CM||||202202070920+0000|||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN|||||||||PICKERING MEDICAL PRACTICE^^^^^^^^^B82033
OBR|1|REQ-20220207-000013^B82033|REP-20220210-000218^Y8J7D|1005711000000106^Glucose tolerance test^SCT|||20220209100123+0000|||||||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN||||||202202101149+0000||CH|F
NTE|1|L|Fasting glucose below 5.1, 1hr below 10.0 and 2hr below 8.5 mmol/L. Normal response to glucose load, no further action required.
OBX|1|FT|1005711000000106^Glucose tolerance test^SCT||GTT Fasting Glucose   4.8 mmol/L \.br\ GTT Glucose 60 min    8.8 mmol/L\.br\ GTT Glucose 120 min   6.4 mmol/L||||||F|||20220209100123+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
SPM|1|SPC-REQ-20220209-000082&B82033^SPC-Lab-20220209-001531&Y8J7D||^^^^^^^^Venous blood specimen|||||||||||||20220209100123+0000|20220209141706+0000
SPM|2|SPC-REQ-20220209-000083&B82033^SPC-Lab-20220209-001549&Y8J7D||^^^^^^^^Venous blood specimen|||||||||||||20220209110307+0000|20220209141706+0000
SPM|3|SPC-REQ-20220209-000084&B82033^SPC-Lab-20220209-001587&Y8J7D||^^^^^^^^Venous blood specimen|||||||||||||20220209120217+0000|20220209141706+0000
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - NHS England GTT (unstructured)](Bundle-HL7v2Msg-NHSE-GTT.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - NHS England GTT (unstructured)](Bundle-HL7v2Msg-NHSE-GTT-Document.html)

**Urine MC&S (unstructured)** - Urine microscopy, culture and sensitivities as formatted text (MOXEY, Judy) - NHS England original: [Bundle-Urine-MCS-Unstructured-Report-Example](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/Profiles/Examples/Bundles/Bundle-Urine-MCS-Unstructured-Report-Example?version=0.5.1):

```
MSH|^~\&|LIMS|Y8J7D|GPSYSTEM|B82033|202203081209+0000||ORU^R01^ORU_R01|NHSE-EX-0009|P|2.5.1|||AL|||UNICODE UTF-8
PID|1||9999999549^^^NHS^NH~Y8J7D0592374^^^Y8J7D^MR||MOXEY^Judy^^^^^L||20040506|F|||1 CASTLEGATE^^PICKERING^NORTH YORKSHIRE^YO18 7AY|||||||||||||||||||||01
PV1|1|O|^^^^^^^^PICKERING MEDICAL PRACTICE^B82033|||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN
ORC|RE|REQ-20220221-000018^B82033|REP-20220225-006301^Y8J7D||CM||||202202211029+0000|||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN|||||||||PICKERING MEDICAL PRACTICE^^^^^^^^^B82033
OBR|1|REQ-20220221-000018^B82033|REP-20220225-006301^Y8J7D|995581000000104^Urinary microscopy, culture and sensitivities^SCT|||202202211107+0000|||||||||C1008215^GASKELL^Gale^^^Dr^^^GMC^^^^DN||||||202202251347+0000||MB|F
NTE|1|L|Likely to be clinically significant.
OBX|1|FT|995581000000104^Urinary microscopy, culture and sensitivities^SCT||Microscopy\.br\Casts  None seen\.br\White cells  >35 x10*6/L\.br\Red cells  10-35 x10*6/L\.br\Epithelial cells  +\.br\\.br\Culture\.br\1. Staphylococcus aureus   Scanty growth\.br\\.br\Sensitivities  1\.br\Flucloxacillin   S\.br\Trimethoprim  S\.br\Nitrofurantoin  R||||||F|||202202211107+0000|||||||||TD008362 PATH LAB 001^^^^^^^^^Y8J7D
SPM|1|SPC-REQ-20220221-000024&B82033^SPC-Lab-20220221-004306&Y8J7D||^^^^^^^^Urine specimen|||||||||||||202202211107+0000|202202211458+0000
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - NHS England Urine MC&S (unstructured)](Bundle-HL7v2Msg-NHSE-UrineMCS.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - NHS England Urine MC&S (unstructured)](Bundle-HL7v2Msg-NHSE-UrineMCS-Document.html)

##### Laboratory Report (LAB-3) - Bowel Cancer Screening FIT

A bowel cancer screening hub laboratory's faecal immunochemical test (FIT) result, with the
measured faecal haemoglobin, the threshold applied and the programme outcome - fictitious,
from [Cancer Screening](Screening.html#example-fit-screening-result-hl7-v2-oru_r01), where the
segments and the conversion to the NHS004 message to the GP are explained. The patient is
the NW Genomics test patient MANCHESTER, Sansa (NHS `973 738 3192`, PDS INT), with her
registered GP practice, Ancoats Urban Village Medical Practice (`P84673`). `HUB01` (hub
laboratory) is a placeholder, not an ODS code.

```
MSH|^~\&|LIMS|HUB01|BCSS|BCSS|20251104101500+0000||ORU^R01^ORU_R01|urn:uuid:5b0e7c2a-1f4d-4a8e-9c3b-7d2e6f1a9b40|T|2.5.1|||AL
PID|1||9737383192^^^NHS^NH||MANCHESTER^Sansa^^^^^L||19720921|F|||Oxford Rd^^MANCHESTER^^M13 9PL
PD1|||ANCOATS URBAN VILLAGE MEDICAL PRACTICE^^P84673^^^ODS
ORC|RE|BCS25-0438812^BCSS|F25-118204^HUB01||CM||||20251104101500+0000|||^BCSP Hub Manager
OBR|1|BCS25-0438812^BCSS|F25-118204^HUB01|FITSCR^Bowel cancer screening faecal immunochemical test^HUB01|||20251029|||||||||^BCSP Hub Manager||||||20251104101500+0000|||F|||P84673^ANCOATS URBAN VILLAGE MEDICAL PRACTICE
OBX|1|NM|27396-1^Hemoglobin [Mass/mass] in Stool from gastrointestinal^LN^1049361000000101^Quantitative faecal immunochemical test^SNM3||142|ug/g^microgram per gram^UCUM|<120|H|||F|||20251103|||IMMUNOASSAY|HM-JACKarc-02^^HUB01
OBX|2|CWE|29771-3^Hemoglobin [Presence] in Stool from gastrointestinal lower by Immunoassay^LN||LA6576-8^Positive^LN||||||F|||20251103
OBX|3|CWE|368481000000103^Bowel cancer screening programme: faecal occult blood result^SNM3||1101371000000105^Bowel cancer screening programme liquid faecal immunochemical test abnormal^SNM3||||||F|||20251104
NTE|1||Further tests needed. Referred to specialist screening practitioner clinic.
SPM|1|F25-118204-K1&HUB01||119339001^Stool specimen^SNM3|||||||||||||20251029|20251031101500+0000
```

> FHIR Message Example: [Bundle Message - Laboratory Report (LAB-3) - Bowel Cancer Screening FIT](Bundle-HL7v2Msg-FIT.html)

> FHIR Document Example (HL7 Europe Laboratory Report): [Bundle Document - Laboratory Report (LAB-3) - Bowel Cancer Screening FIT](Bundle-HL7v2Msg-FIT-Document.html)

A normal result below the analyser's measuring range uses a structured numeric (`SN`)
value:

```
OBX|1|SN|27396-1^Hemoglobin [Mass/mass] in Stool from gastrointestinal^LN^1049361000000101^Quantitative faecal immunochemical test^SNM3||<^7|ug/g^microgram per gram^UCUM|<120|N|||F|||20251103
OBX|2|CWE|29771-3^Hemoglobin [Presence] in Stool from gastrointestinal lower by Immunoassay^LN||LA6577-6^Negative^LN||||||F|||20251103
OBX|3|CWE|368481000000103^Bowel cancer screening programme: faecal occult blood result^SNM3||1101361000000103^Bowel cancer screening programme liquid faecal immunochemical test normal^SNM3||||||F|||20251104
```

### Conventions Used

| Convention | Example |
|---|---|
| ODS code as assigning authority for patient identifiers | `7742315^^^R0A^MR` |
| ODS code as assigning authority for order numbers | Placer `1583320^R0A`, Filler `H23-41022^690S0` |
| Report parts linked to the first `OBR` | `OBR-29` `1583320&R0A^H23-41022&690S0` |
| LOINC in `OBX-3`, with the COSD item as the alternate code | `81691-8^...^LN^pCR7020^...^COSD` |
| Coded answers in `OBX-5` - ICD-O-3 with SNOMED CT, or LOINC answers | `8140^Adenocarcinoma, NOS^ICDO3^1187332001^Adenocarcinoma^SNM3` |
| UCUM units, reference range and abnormal flag for numeric results | `OBX-5` `98`, `OBX-6` `g/L^gram per litre^UCUM`, `OBX-7` `115-155`, `OBX-8` `L` |
| Result copies to another organisation | `OBR-28` `C1234567^...^GMC^^^^^PTC01` - indicative |
| Local codes where no national code exists | `HISTO`, `MMR` (coding system `690S0`) |
{:.grid}

The coding system name for COSD items (`COSD` here, `99COSD` in the
[LAB-3 proposal](LAB-3.html#applying-volume-v-to-cosd-pathology-proposal)) is **Open** -
see [LAB-35](LAB-35.html#open).
