<div class="alert alert-danger" role="alert">
<b>Proof of concept.</b> This implementation guide is a demonstration only. It is
<b>not</b> an authoritative source, is not endorsed by NHS England, the National
Disease Registration Service or HL7, and must not be used for implementation or
clinical purposes. The authoritative sources are the standards each page references -
for example the <a href="https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology">COSD Pathology User Guide</a>
or <a href="https://standards.nhs.uk/published-standards/palliative-care-coordination-core-content">SCCI1580</a>.
</div>

**Sub-order Management [LAB-35]** (IHE ILW) - the pathology laboratory (Requester)
placing a sub-order, for example a reflex order to genomics, with the
[Cancer Pathology Report](StructureDefinition-CancerPathologyComposition.html) as supporting information. HL7 v2
`OML_O21` or FHIR `ServiceRequest`/`Task`.

<div class="alert alert-warning" role="alert">
<b>TODO</b> - the ILW transaction itself (actors, interaction diagram, FHIR
exchange) is described on the <a href="ILW.html">Inter-Laboratory Workflow</a>
page and in the NW Genomics IG. This page currently covers the HL7 v2 example
and how the pathology report content maps to it.
</div>

### References

- NW Genomics IG [HL7 v2 - Sub-order (LAB-35)](https://nw-gmsa.github.io/en/hl7v2.html#sub-order-lab-35) - the `OML_O21` examples this page is based on, with FHIR message equivalents
- NW Genomics IG [Primary Sample](https://nw-gmsa.github.io/en/StructureDefinition-PrimarySample.html) logical model - the genomics (data consumer) requirements for the specimen and tumour, from the NHS England Genomics Master Dataset (MDS) v1.062
- [Pathology to Genomics Reflex](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/PathologyToGenomicsReflex.md) - NW GMSA use case
- [One Year On: What a Cancer Pathway Taught Me About Interoperability](https://www.linkedin.com/feed/update/urn:li:ugcPost:7529858024396615680/) (LinkedIn article, Figures 3 and 4) - the same example, with the conventions highlighted
- [Order Results Management [LAB-3]](LAB-3.html) - the proposed HL7 v2 coding of COSD items, which this example follows

### Message Structure

The reflex order is an `OML^O21^OML_O21` from the pathology LIMS (Requester) to
the Genomic Laboratory Hub (Subcontractor). It holds two parts:

| Part | Segments | Content |
|---|---|---|
| The **genomic order** | `ORC`, `OBR`, `NTE`, `SPM` | The National Genomic Test Directory test (`OBR-4`), clinical indication (`OBR-46`), and the specimen sent to genomics - the sections cut from the block (`SPM-2`), with the block in `SPM-3` |
| The **prior results** - the pathology report | `PV1`, `ORC`, `OBR`, `OBX`, `NTE` in the `PATIENT_VISIT_PRIOR`, `ORDER_PRIOR` and `OBSERVATION_PRIOR` groups | Everything pathology has found, sent as results of the **original** pathology order (`ORC-2`/`ORC-3`): the report PDF, the coded diagnosis, MMR immunohistochemistry and the tumour assessment for molecular testing |
{:.grid}

The prior results are pathology's findings, not statements made by genomics, so
they stay attached to the pathology order that produced them. `ORC-8` (parent) of
the genomic order links it back to that order.

### Example: Lynch Syndrome

Fictitious. The Manchester Royal Infirmary laboratory (`690S0`) reflexes MLH1
promoter hypermethylation (`M1.5`) to the North West GLH (`699X0`), after a caecal
adenocarcinoma biopsy shows loss of MLH1 and PMS2 on MMR immunohistochemistry -
step ② of the [Lynch syndrome scenario](index.html#worked-example-lynch-syndrome).
Quoted from the NW Genomics IG
[HL7 v2 page](https://nw-gmsa.github.io/en/hl7v2.html#sub-order-lab-35); the PDF is
shortened.

```
MSH|^~\&|LIMS|690S0|RIE|699X0|20230821140000+0000||OML^O21^OML_O21|urn:uuid:952c8215-d682-4b79-a652-5e73ba1a7584|T|2.5.1|||AL
PID|1||9737383206^^^NHS^NH~7742315^^^R0A^MR||LIVERPOOL^Ned^^^^^L||19420618|M|||20 Forthlin Road^^LIVERPOOL^^L18 9TN
PV1|1|O|^^^R0A02^^^^^^^R0A||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||301^Gastroenterology^2.16.840.1.113883.2.1.6.8|||||||C3456789^Darwin^Samuel^^^Dr^^^GMC||SP2308140915^^^R0A^AN|||||||||||||||||||||||||20230814080000+0000
ORC|NW|G23-08317-1^690S0||||||1583320&R0A^H23-41022&690S0|20230821140000+0000|||C2468013^FICTITIOUS^Anika^^^Dr^^^GMC|||||||||MANCHESTER ROYAL INFIRMARY LABORATORY^^690S0^^^ODS
OBR|1|G23-08317-1^690S0||M1.5^Colorectal Carcinoma, MLH1 promoter hypermethylation^England-GenomicTestDirectory||20230821||||^^^^^^^^^^^^^R0A||||||C2468013^FICTITIOUS^Anika^^^Dr^^^GMC|||||||||||||||M1^Colorectal Carcinoma^GenomicClinicalIndication
NTE|1||Caecal adenocarcinoma. Loss of MLH1 and PMS2 on MMR immunohistochemistry. MLH1 promoter hypermethylation for Lynch syndrome triage.
SPM|1|H23-41022-A1-S1&690S0|H23-41022-A1&690S0|441652008^Formalin-fixed paraffin-embedded tissue specimen^SNM3||BF10^Buffered 10% formalin^HL70371|86273004^Biopsy^SNM3|32713005^Caecum structure^SNM3||||||10 x 5 um sections and marked H&E guide slide from block A1|||20230814100000+0000|20230814150000+0000||Y
PV1|1|O|^^^R0A02^^^^^^^R0A||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||301^Gastroenterology^2.16.840.1.113883.2.1.6.8|||||||C3456789^Darwin^Samuel^^^Dr^^^GMC||SP2308140915^^^R0A^AN|||||||||||||||||||||||||20230814080000+0000
ORC|RE|1583320^R0A|H23-41022^690S0||CM|||||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
OBR|1|1583320^R0A|H23-41022^690S0|HISTO^Histopathology^690S0|||20230814100000+0000|||||||||C3456789^Darwin^Samuel^^^Dr^^^GMC||||||20230821090000+0000|||F
OBX|1|CWE|21855-2^Primary site Cancer^LN^pCR6410^Topography (SNOMED)^COSD||C18.0^Cecum^ICDO3^32713005^Caecum structure^SNM3||||||F
OBX|2|ED|1054291000000102^Cellular pathology report^SNM3||^application^pdf^Base64^JVBERi0x...||||||F
OBR|2|1583320^R0A|H23-41022^690S0|77753-2^Tumor morphology panel Cancer^LN|||20230814100000+0000|||||||||||||||20230821090000+0000|||F||||1583320&R0A^H23-41022&690S0
OBX|1|CWE|31205-8^Histology ICD-O-3 Cancer^LN^pCR6420^Morphology (SNOMED)^COSD||8140^Adenocarcinoma, NOS^ICDO3^35917007^Adenocarcinoma^SNM3||||||F
OBX|2|CWE|31206-6^Behavior ICD-O-3 Cancer^LN||3^Malignant, primary site^ICDO3||||||F
OBR|3|1583320^R0A|H23-41022^690S0|MMR^Mismatch repair immunohistochemistry^690S0|||20230814100000+0000|||||||||||||||20230821090000+0000|||F||||1583320&R0A^H23-41022&690S0
OBX|1|CWE|81691-8^MLH-1 Ag [Presence] in Cancer specimen by Immune stain^LN^pCR7020^MLH1 Nuclear Expression Intact^COSD||LA9634-2^Absent^LN||||||F
OBX|2|CWE|81694-2^PMS2 Ag [Presence] in Cancer specimen by Immune stain^LN^pCR7030^PMS2 Nuclear Expression Intact^COSD||LA9634-2^Absent^LN||||||F
OBX|3|CWE|81692-6^MSH-2 Ag [Presence] in Cancer specimen by Immune stain^LN^pCR7040^MSH2 Nuclear Expression Intact^COSD||LA9633-4^Present^LN||||||F
OBX|4|CWE|81693-4^MSH-6 Ag [Presence] in Cancer specimen by Immune stain^LN^pCR7050^MSH6 Nuclear Expression Intact^COSD||LA9633-4^Present^LN||||||F
OBR|4|1583320^R0A|H23-41022^690S0|TMA^Tumour assessment for molecular testing^690S0|||20230814100000+0000|||||||||||||||20230821110000+0000|||F
NTE|1||Block A1 - tumour area ringed on H&E guide slide
OBX|1|NM|TCC^Tumour cell content^690S0||40|%^percent^UCUM|||||F|||20230821110000+0000
```

> FHIR Message Example (NW Genomics IG): [Bundle Message - Genomic Reflex Order M1.5](https://nw-gmsa.github.io/en/Bundle-GenomicsOrderMessage-LynchReflex.html)

#### Conventions used

| Convention | Example | Why |
|---|---|---|
| ODS code as the assigning authority for patient identifiers | `7742315^^^R0A^MR`, `SP2308140915^^^R0A^AN` | A hospital number is only unique within one trust; with the ODS code it is unique across the NHS |
| ODS code as the assigning authority for order numbers | Placer `1583320^R0A` (trust), Filler `H23-41022^690S0` (laboratory) | The orders can be matched across organisations - this is what closes the loop |
| LOINC in `OBX-3`, with the COSD item as the alternate code | `81691-8^...^LN^pCR7020^MLH1 Nuclear Expression Intact^COSD` | LOINC asks the question; the COSD `pCR` code ties the result to the registry definition |
| Coded answers in `OBX-5` | `LA9634-2^Absent^LN`; `8140^Adenocarcinoma, NOS^ICDO3^35917007^Adenocarcinoma^SNM3` | ICD-O-3 for topography and morphology, with SNOMED CT alongside |
| Local codes where no national code exists | `HISTO`, `MMR`, `TMA`, `TCC` (coding system `690S0`) | Shows where national coding is still needed - see [Gaps](#gaps) |
{:.grid}

LOINC codes checked on tx.fhir.org (`CodeSystem/$lookup`, 2026-11-21): `21855-2`,
`31205-8`, `31206-6`, `77753-2`, `81691-8`, `81694-2`, `81692-6`, `81693-4`,
`LA9634-2`, `LA9633-4`. SNOMED CT `35917007` *Adenocarcinoma*, as quoted from the
NW Genomics IG, is **inactive** in the UK edition (20261021); its replacement is
`1187332001` *Adenocarcinoma*, used in the FHIR example below.

The same report as a FHIR Document, coded with the profiles in this guide:
[PathDocument](Bundle-PathDocument.html) (Cancer Pathology Composition and
Cancer Pathology Diagnostic Report).

#### Mapping to the Cancer Pathology Report

The prior results are a subset of the
[Pathology Report](StructureDefinition-PathologyReport.html) logical model. Mappings
are indicative.

| Prior result | COSD | Logical model | FHIR profile |
|---|---|---|---|
| `ORC-2` / `ORC-3` | pCR0950 (report), pCR0980, pCR0800 | `reportIdentifier`, `requestedBy`, `reportedBy` | [Cancer Pathology Diagnostic Report](StructureDefinition-CancerPathologyDiagnosticReport.html) `basedOn`, `identifier`, `performer` |
| `OBR-1` `OBX-2` Cellular pathology report (PDF) | pCR1020 | `reportText` | `DiagnosticReport.presentedForm` |
| `OBR-1` `OBX-1` `21855-2` Primary site | pCR6410 | `diagnosis.topography` | [Primary Cancer Condition](StructureDefinition-PrimaryCancerCondition.html) `bodySite` |
| `OBR-2` `OBX-1` `31205-8` Histology | pCR6420 | `diagnosis.morphology` | [Histologic Behavior and Type](StructureDefinition-HistologicBehaviorAndType.html) |
| `OBR-2` `OBX-2` `31206-6` Behaviour | pCR6420 (5th digit of the morphology) | `diagnosis.morphology` | [Histologic Behavior and Type](StructureDefinition-HistologicBehaviorAndType.html) |
| `OBR-3` `OBX-1..4` MMR IHC | pCR7020-pCR7050 | `mmrImmunohistochemistry` | [Tumor Marker Test](StructureDefinition-TumorMarkerTest.html) |
| `OBR-4` Tumour assessment for molecular testing, `TCC` | - | Not modelled (COSD gap) | Not profiled |
| `SPM` of the genomic order (block, fixative, collection) | pCR1010, pCR0760 | `specimen` | [Cancer Pathology Specimen](StructureDefinition-CancerPathologySpecimen.html) |
{:.grid}

The MMR answers use the LOINC answer list (Present/Absent), not the
[COSD Nuclear Expression Intact](ValueSet-cosd-nuclear-expression-intact.html)
codes. Absent maps to COSD `N` (expression lost) and Present to `Y` (intact);
COSD `E` Equivocal and `F` Test failed have no LOINC answer in this example.

#### The same report, human readable

The report the clinician sees (fictitious), including the supplementary report
written for molecular testing. This is the PDF in `OBR-1` `OBX-2`; as a
[FHIR Document](StructureDefinition-CancerPathologyComposition.html#fhir-document) it would be the section narratives.

<div style="border:1px solid #bbb; box-shadow:0 2px 8px rgba(0,0,0,0.15); background:#fff; color:#222; max-width:820px; margin:16px auto; padding:24px 32px; font-family:Georgia,'Times New Roman',serif; font-size:15px; line-height:1.5;">
<div style="display:flex; justify-content:space-between; align-items:flex-start; border-bottom:2px solid #333; padding-bottom:8px; margin-bottom:12px;">
<div><div style="font-size:22px; font-weight:bold;">Histopathology Report</div><div>Manchester Royal Infirmary Laboratory (690S0)</div></div>
<div style="text-align:right;"><span style="border:1px solid #c00; color:#c00; font-family:Arial,sans-serif; font-size:12px; font-weight:bold; padding:2px 6px;">FICTITIOUS EXAMPLE</span><br/>Lab No: <b>H23-41022</b><br/>Final report, with supplementary report</div>
</div>
<table style="width:100%; border:none; font-size:14px; margin-bottom:10px;">
<tr><td style="border:none;"><b>Patient</b></td><td style="border:none;">LIVERPOOL, Ned (M)</td><td style="border:none;"><b>NHS No</b></td><td style="border:none;">973 738 3206</td></tr>
<tr><td style="border:none;"><b>DOB</b></td><td style="border:none;">18-Jun-1942</td><td style="border:none;"><b>Hospital No</b></td><td style="border:none;">7742315 (R0A)</td></tr>
<tr><td style="border:none;"><b>Requested by</b></td><td style="border:none;">Dr Samuel Darwin (GMC C3456789), Manchester University NHS Foundation Trust</td><td style="border:none;"><b>Order No</b></td><td style="border:none;">1583320 (R0A)</td></tr>
<tr><td style="border:none;"><b>Hospital Spell</b></td><td style="border:none;">SP2308140915 (R0A), outpatient, Gastroenterology</td><td style="border:none;"><b>Received</b></td><td style="border:none;">14-Aug-2023</td></tr>
</table>
<p style="margin:4px 0;"><b>Clinical details.</b> Change in bowel habit. Colonoscopy: ulcerated mass in the caecum.</p>
<p style="margin:4px 0;"><b>Specimen.</b> A: Caecal mass, colonoscopic biopsies, collected 14-Aug-2023. Fixed in buffered 10% formalin.</p>
<p style="margin:4px 0;"><b>Macroscopy.</b> Four cores of tan tissue, 2 to 5 mm. All embedded in block A1.</p>
<p style="margin:4px 0;"><b>Microscopy.</b> Fragments of large bowel mucosa infiltrated by an adenocarcinoma, forming irregular glands with a desmoplastic stroma. Tumour-infiltrating lymphocytes are prominent.</p>
<p style="margin:4px 0;"><b>Mismatch repair immunohistochemistry.</b> MLH1: <b>loss</b> of nuclear expression. PMS2: <b>loss</b> of nuclear expression. MSH2: retained. MSH6: retained.</p>
<div style="border:1px solid #999; padding:8px 12px; margin:10px 0;"><b>Diagnosis.</b> Caecum, biopsy: adenocarcinoma. Mismatch repair deficient (loss of MLH1 and PMS2). MLH1 promoter hypermethylation testing requested to assess for Lynch syndrome.<br/><span style="font-size:13px;">Primary site: Cecum (ICD-O-3 C18.0; SNOMED CT 32713005) &middot; Histology: Adenocarcinoma, NOS (ICD-O-3 8140; SNOMED CT 35917007) &middot; Behaviour: Malignant, primary site</span></div>
<p style="font-size:14px; border-top:1px solid #333; padding-top:4px;">Reported by: Dr A FICTITIOUS, Consultant Histopathologist &middot; Authorised: 21-Aug-2023 09:00</p>
<div style="font-size:17px; font-weight:bold; border-top:2px solid #333; padding-top:6px;">Supplementary report - Tumour assessment for molecular testing</div>
<p style="margin:4px 0;">Report No: <b>H23-41022-TMA</b></p>
<p style="margin:4px 0;">Block <b>A1</b> selected for genomic test M1.5, MLH1 promoter hypermethylation, requested from the North West GLH (order G23-08317-1). Tumour area ringed on the H&amp;E guide slide. Tumour cell content: <b>40 %</b>.</p>
<p style="margin:4px 0;">Sent: 10 x 5 &micro;m sections <b>H23-41022-A1-S1</b> and the marked H&amp;E guide slide from block <b>H23-41022-A1</b> - formalin-fixed paraffin-embedded tissue.</p>
<p style="font-size:14px; border-top:1px solid #333; padding-top:4px;">Reported by: Dr Anika FICTITIOUS (GMC C2468013), Consultant Histopathologist &middot; Authorised: 21-Aug-2023 11:00</p>
</div>

### Genomics Requirements: Primary Sample

The data consumer's requirements are defined nationally. The NHS England Genomics
Master Dataset (MDS) **Data group - Primary sample** is modelled by the NW Genomics
[Primary Sample](https://nw-gmsa.github.io/en/StructureDefinition-PrimarySample.html)
logical model, which aligns its tumour content with this guide. For **Solid Tumour
(Tissue)** tests:

| MDS | Primary Sample element | Obligation | In the example | Source in this guide |
|---|---|---|---|---|
| PS-002, PS-003 | `identifier` | M | `SPM-2` `H23-41022-A1-S1&690S0` | Specimen identifier (sections sent) |
| PS-038 | `collector` | M | `OBR-10` `R0A` | `requestedBy.organisationSite` (pCR0980) |
| PS-010 | `collectedDate` | M | `SPM-17` | `specimen.collectionDate` (pCR1010) |
| PS-011, PS-012 | `type`, `condition` | M | `SPM-4` `441652008` FFPE tissue | Not modelled - see [Gaps](#gaps) |
| PS-025, PS-031 | `additive`, `processing.fixative` | M, M IF FFPE | `SPM-6` `BF10` Buffered 10% formalin | Not modelled (not a COSD item) |
| PS-030 | `parentIdentifier` | M IF FFPE | `SPM-3` block `H23-41022-A1&690S0` | Not modelled - see [Gaps](#gaps) |
| PS-029, PS-039 | `collectionMethod` | M | `SPM-7` `86273004` Biopsy | `specimen.investigationType` (pCR0760) |
| PS-019 | `bodySite` | M IF biopsy | `SPM-8` `32713005` Caecum | `diagnosis.topography` (pCR6410) |
| PS-015, PS-026 | `assessment.tumourContent...` | M IF FFPE (one of) | `TMA` `TCC` 40 % | **Gap** - not in COSD core |
| PS-035 | `tumour.specimenNature` | O | - | `specimen.specimenNature` (pCR0970) |
| PS-017 | `tumour.morphology` | M IF treatment determining | `31205-8` 8140 Adenocarcinoma | `diagnosis.morphology` (pCR6420) |
| PS-018 | `tumour.topography` | M IF test is not GT401/GT19 | `21855-2` C18.0 Cecum | `diagnosis.topography` (pCR6410) |
| PS-036 | `tumour.stage` | M IF test is GT401/GT19 | - | `stage.stageGrouping` (pCR0940) |
| PS-037 | `tumour.grade` | O | - | `tumour.grade` (pCR0860) |
{:.grid}

The Primary Sample model notes that the tumour items (PS-017, PS-018, PS-035,
PS-036, PS-037) duplicate the cancer pathology report. Whether the order carries
them or references the report is **Open** there and in the use case.

### Gaps

- **Tumour cell content** (PS-015 / PS-026) is required by genomics but is not a
  COSD core item, so it is carried under a local code (`TCC`). LOINC and SNOMED CT
  codes are **To confirm** - the Primary Sample model marks SNOMED CT `371510003`
  Proportion of specimen involved by tumour as TBC for whole-section content, and
  finds no code for marked-area content.
- **Specimen type** (PS-011, FFPE tissue) - [Cancer Pathology Specimen](StructureDefinition-CancerPathologySpecimen.html)
  `type` holds the COSD Specimen Nature (pCR0970: primary tumour, lymph node,
  metastasis), which is a different concept from the specimen type genomics
  needs (`SPM-4`). **Open** where each goes.
- **Block and sections** (`SPM-3`, PS-030) - the specimen hierarchy is not modelled
  in [Cancer Pathology Specimen](StructureDefinition-CancerPathologySpecimen.html).
- **Local order codes** `HISTO`, `MMR` and `TMA` in `OBR-4` have no national code.
  `77753-2` Tumor morphology panel is the only LOINC-coded `OBR`.

### Open

- **Coding system name for COSD items.** This example uses `COSD`; the
  [LAB-3 proposal](LAB-3.html#applying-volume-v-to-cosd-pathology-proposal) suggests the
  local name `99COSD` and puts the `pCR` code in `OBX-3` only where there is no
  LOINC code. **To confirm** which to use.
- **Histology and behaviour.** The example splits pCR6420 into `31205-8` Histology
  and `31206-6` Behaviour. The
  [Histologic Behavior and Type](StructureDefinition-HistologicBehaviorAndType.html)
  profile (following mCODE) uses `31206-6` for the combined morphology code.
- **Report status.** The prior results use `OBR-25` `F` Final; the supplementary
  tumour assessment is a separate `OBR` rather than an addendum report (`35265-8`).
