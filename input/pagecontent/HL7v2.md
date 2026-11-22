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

> FHIR: [Cancer Pathology Specimen](StructureDefinition-CancerPathologySpecimen.html) - example [Specimen A](Specimen-PathSpecimenH23-41022.html)

##### Sub-order (LAB-35)

[LAB-35](LAB-35.html): the same laboratory reflexes MLH1 promoter hypermethylation (`M1.5`) to
the North West GLH, sending the pathology report as prior results. The full message is on the
[LAB-35](LAB-35.html#example-lynch-syndrome) page and the NW Genomics
[HL7 v2](https://nw-gmsa.github.io/en/hl7v2.html#sub-order-lab-35) page.

### ORU_R01 Unsolicited transmission of an observation message

#### References

- NW Genomics HL7 v2 - [ORU_R01](https://nw-gmsa.github.io/en/hl7v2.html#oru_r01-unsolicited-transmission-of-an-observation-message) - message structure and segments
- [Order Results Management [LAB-3]](LAB-3.html) - NAACCR Volume V, and the proposed coding of COSD Pathology items in `OBX`
- [Cancer Pathology Report](PathologyReport.html) - the content of a histopathology report
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

> FHIR: [PathDocument](Bundle-PathDocument.html) - the same report as a FHIR Document ([Cancer Pathology Composition](StructureDefinition-CancerPathologyComposition.html) and [Cancer Pathology Diagnostic Report](StructureDefinition-CancerPathologyDiagnosticReport.html)); see [What the reader sees](PathologyReport.html#what-the-reader-sees)

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
| Test codes (`OBR-4`, `OBX-3`) | Local laboratory codes (`B0300`) | LOINC, with the local code as the alternate (coding system: the laboratory's ODS code) |
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
OBR|1|880412^7A1|914694928301^REM|59261-8^Hemoglobin A1c/Hemoglobin.total standardized per IFCC-RMP for CDT in Blood^LN^B3051^HbA1c (IFCC traceable)^REM|||201803091500|||^FICTITIOUS^Angharad||||201803091500||C9000115^FICTITIOUS^Andar^^^Dr^^^GMC||||||201803091500|||C
NTE|1||For monitoring known diabetic patients, please follow NICE guidelines. If not a known diabetic and the patient is asymptomatic, a second confirmatory sample is required within 2 weeks (WEDS Guidance). HbA1c is unreliable for diagnostic and monitoring purposes in the context of several conditions, including some haemoglobinopathies, abnormal haemoglobin levels, chronic renal failure, recent transfusion, pregnancy, or alcoholism.
OBX|1|NM|59261-8^Hemoglobin A1c/Hemoglobin.total standardized per IFCC-RMP for CDT in Blood^LN^B3553^HbA1c (IFCC traceable)^REM||49|mmol/mol^millimole per mole^UCUM|<48|H|||C|||201803091500
OBR|2|880412^7A1|914694928301^REM|58410-2^CBC panel - Blood by Automated count^LN^B0001^Full blood count^REM|||201803091500|||^FICTITIOUS^Carl||||201803091500||C9000115^FICTITIOUS^Andar^^^Dr^^^GMC||||||201803091500|||F
TQ1|||||||201803091400|201803091500|S^^^^^^^^Urgent
OBX|1|NM|6690-2^Leukocytes [#/volume] in Blood by Automated count^LN^B0300^White blood cell (WBC) count^REM||3.5|10*9/L^billion per litre^UCUM|4.0-11.0|L|||F|||201803091500
OBX|2|NM|718-7^Hemoglobin [Mass/volume] in Blood^LN^B0307^Haemoglobin (Hb)^REM||200|g/L^gram per litre^UCUM|130-180|H|||F|||201803091500
OBX|3|NM|777-3^Platelets [#/volume] in Blood by Automated count^LN^B0314^Platelet (PLT) count^REM||500|10*9/L^billion per litre^UCUM|150-400|H|||F|||201803091500
OBX|4|NM|789-8^Erythrocytes [#/volume] in Blood by Automated count^LN^B0306^Red blood cell (RBC) count^REM||6.00|10*12/L^trillion per litre^UCUM|4.50-6.00|N|||F|||201803091500
OBX|5|NM|4544-3^Hematocrit [Volume Fraction] of Blood by Automated count^LN^B0308^Haematocrit (Hct)^REM||0.60|L/L^litre per litre^UCUM|0.40-0.52|H|||F|||201803091500
OBX|6|NM|787-2^MCV [Entitic mean volume] in Red Blood Cells by Automated count^LN^B0309^Mean cell volume (MCV)^REM||120|fL^femtolitre^UCUM|80-100|H|||F|||201803091500
OBX|7|NM|785-6^MCH [Entitic mass] by Automated count^LN^B0310^Mean cell haemoglobin (MCH)^REM||34.0|pg^picogram^UCUM|27.0-33.0|H|||F|||201803091500
SPM|1|^9146949283&REM||119297000^Blood specimen^SNM3|||||||||||||201803091400|201803091500
```

**Text based report** (DHCW section 7.1) - a urine microscopy, culture and sensitivity
report from Mid Cheshire Hospitals to Betsi Cadwaladr, sent as lines of text. The report
lines are kept as text (`TX`, formatting preserved) with a local code; a discrete, coded
version (organism and antibiotic susceptibility results) is a future step.

```
MSH|^~\&|LIMS|RBT|EPR|7A1|20180524120000+0000||ORU^R01^ORU_R01|urn:uuid:9e4b7d21-3c6a-4f08-b1d5-7a2c8e0f4b93|T|2.5.1|||AL
PID|1||9999999506^^^NHS^NH~RBT4948902^^^RBT^MR||EDITESTPATIENT^FIVE^^^^^L||19901019|M|||^^^^ZZ99 3VZ
PV1|1|U|^^^7A1A4^^^^^^^7A1
ORC|RE|880413^7A1|8005372251-1-M0007^RBT||CM|||||||C9000116^FICTITIOUS^Jane^^^Dr^^^GMC|||||||||BETSI CADWALADR UNIVERSITY LOCAL HEALTH BOARD^^7A1^^^ODS
OBR|1|880413^7A1|8005372251-1-M0007^RBT|630-4^Bacteria identified in Urine by Culture^LN^M0007^Urine MC\T\S^RBT|||201805240000|||^FICTITIOUS^Dean||||201805240000||C9000116^FICTITIOUS^Jane^^^Dr^^^GMC||||||201805240000|||F
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

##### Laboratory Report (LAB-3) - Bowel Cancer Screening FIT

A screening hub laboratory's faecal immunochemical test result, with the measured value,
threshold and programme outcome - on the [Cancer Screening](Screening.html#example-fit-screening-result-hl7-v2-oru_r01)
page.

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
