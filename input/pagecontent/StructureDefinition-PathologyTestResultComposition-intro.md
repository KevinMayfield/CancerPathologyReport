<div class="alert alert-danger" role="alert">
<b>Proof of concept.</b> This implementation guide is a demonstration only. It is
<b>not</b> an authoritative source, is not endorsed by NHS England, the National
Disease Registration Service or HL7, and must not be used for implementation or
clinical purposes. The authoritative sources are the standards each page references -
for example the <a href="https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology">COSD Pathology User Guide</a>
or <a href="https://standards.nhs.uk/published-standards/palliative-care-coordination-core-content">SCCI1580</a>.
</div>

This page describes the Composition of a **Pathology Test Result**: a laboratory report
(for example blood sciences, microbiology or cervical screening) shared as a FHIR Document.
Cancer histopathology uses the [Cancer Pathology Composition](StructureDefinition-CancerPathologyComposition.html)
instead.

### References

1. [Pathology FHIR Implementation Guide 0.5.1 - Examples](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/Examples/Examples-Index?version=0.5.1) - NHS England: the eleven example FHIR Documents this Composition is based on. The copies read were in [ryma2fhir/FHIR_IG_PATHOLOGY_TEST/examples](https://github.com/ryma2fhir/FHIR_IG_PATHOLOGY_TEST/tree/main/examples) (commit `a8b847f`, April 2026) - whether they are identical to 0.5.1 is **To confirm**
2. [HL7 Europe Laboratory Report 2.1.0 - Composition](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-Composition-eu-lab.html) - the parent profile, its two-level section tree and its annotations section
3. [PaLM Requestable Tests](ValueSet-palm-procedure.html) and the illustrative [PaLM to LOINC map](ConceptMap-palm-procedure-to-loinc.html) - the LOINC codes given below for each report item
4. [HL7 v2 Pathology Examples](HL7v2.html) - the HL7 v2 `ORU_R01` messages and the FHIR Documents generated from them

### Document Header

| Element | Code (SNOMED CT and/or LOINC) | Content |
|---|---|---|
| `Composition.type` | LOINC `11502-2` Laboratory report; SNOMED CT `721981007` Diagnostic studies report (as in the NHS England examples) as a second coding | The same code as `DiagnosticReport.code` (HL7 Europe Laboratory Bundle rule) |
| `Composition.category[studyType]` | LOINC `18719-5` Chemistry studies, `18723-7` Hematology studies, `18725-2` Microbiology studies, `26436-6` Laboratory studies (mixed) | The same code as the level 1 section |
| `Composition.category[specialty]` | SNOMED CT `394596001` Chemical pathology, `394916005` Hematopathology, `408454008` Clinical microbiology, `394915009` General pathology (the NHS England examples) | Laboratory specialty |
| `Composition.identifier` | - | Laboratory report number, the same as `DiagnosticReport.identifier` |
| `subject`, `author`, `custodian`, `attester` | - | Patient (NHS number); reporting laboratory (ODS code); authorising clinical scientist or pathologist, if any |
| `extension[diagnosticReport]` | - | The DiagnosticReport the document presents |
{:.grid}

### Sections

HL7 Europe Laboratory allows up to two levels of sections: level 1 for the laboratory
specialty, and level 2 for each **report item** - a battery, a specimen study or an
individual test. Every section has human-readable narrative (`section.text`).

| Level | Section | Code (SNOMED CT and/or LOINC) | Content |
|---|---|---|---|
| 1 | Laboratory specialty - e.g. Clinical biochemistry, Haematology, Microbiology | LOINC study type (`lab-studyType-eu-lab`): `18719-5` Chemistry studies (set), `18723-7` Hematology studies (set), `18725-2` Microbiology studies (set), `26436-6` Laboratory studies (set) for a mixed or unspecified specialty | Narrative summary (laboratory, report number); one level 2 section per report item. One section per specialty in the report |
| 2 | Report item - battery (e.g. FBC, U&E, LFT, lipids), specimen study (e.g. urine MC&S) or individual test (e.g. HbA1c, CRP) | SNOMED CT UK code of the item, as in the NHS England examples (e.g. `1022441000000101` FBC - full blood count); LOINC order code from the [PaLM to LOINC map](ConceptMap-palm-procedure-to-loinc.html) as a second coding (e.g. `57021-8` CBC W Auto Differential panel - Blood) | Narrative table - test, result, units, reference range, abnormal flag, and result comments. Entries: the Observations - the battery Observation (with `hasMember`) or each result Observation. For an unstructured (text) result, the narrative is the report text and the entry is the `valueString` Observation |
| 1 | Annotations - Comments | LOINC `48767-8` Annotation comment [Interpretation] Narrative | Narrative only (no entries, no subsections): report-level comments and the conclusion (`DiagnosticReport.conclusion`, HL7 v2 `NTE` after `OBR`) |
{:.grid}

Groups inside a report item - for example microscopy, culture and susceptibility within a
urine MC&S - are `Observation.hasMember`, not a third level of sections.

#### Report items in the NHS England examples

How each NHS England example fits the sections above. The level 2 SNOMED CT code is the
code of the example's section, or of its battery Observation where the section is wrong
(see [Differences](#differences-from-the-nhs-england-examples)). LOINC codes are from the
illustrative map - most panel maps are inexact.

| Example | Level 1 | Level 2 SNOMED CT | Level 2 LOINC | Groups in the item |
|---|---|---|---|---|
| CRP | `18719-5` Chemistry | `1106741000000105` CRP (C reactive protein) mass concentration in serum | `1988-5` | Single test |
| FBC | `18723-7` Hematology | `1022441000000101` FBC - full blood count | `57021-8` | Battery, 13 results |
| GTT | `18719-5` Chemistry | `113076002` Glucose tolerance test | `72171-2` | Battery, 3 timed glucose results |
| GTT (unstructured) | `18719-5` Chemistry | `1005711000000106` Glucose tolerance test | `72171-2` | Text result |
| HBsAg | `18725-2` Microbiology | `1014211000000100` Hepatitis B surface antigen level | `5195-3` | Single test |
| HPV | `18725-2` Microbiology | `50121000237101` Human papilloma virus RNA nucleic acid amplification qualitative result | `82675-0` (a DNA test - inexact) | Single test, with notes |
| HbA1c | `18719-5` Chemistry | `999791000000106` Haemoglobin A1c level - IFCC standardised | `59261-8` | Single test |
| LFT and U&E | `18719-5` Chemistry | Two report items: `26958001` Hepatic function panel; `252167001` Urea and electrolytes | `24325-3`; `24321-2` | Batteries, 4 and 5 results |
| Lipids and HbA1c | `18719-5` Chemistry | Two report items: `271244005` Measurement of serum lipid level; `999791000000106` HbA1c | `24331-1`; `59261-8` | Battery of 4; single test |
| Urine MC&S | `18725-2` Microbiology | `401324008` Urinary microscopy, culture and sensitivities | No single code: `50554-5`, `630-4`, `29576-6` | Specimen study: microscopy (4), culture (1 organism), susceptibility (3) |
| Urine MC&S (unstructured) | `18725-2` Microbiology | `995581000000104` Urinary microscopy, culture and sensitivities | As above | Text result |
{:.grid}

### Differences from the NHS England Examples

| | NHS England examples (0.5.1) | Pathology Test Result Composition |
|---|---|---|
| Levels | One level - a section per report item, with no specialty section | Two levels, as HL7 Europe Laboratory: specialty, then report item |
| `Composition.type` | SNOMED CT `721981007` | LOINC `11502-2` (the HL7 Europe Laboratory preferred code); SNOMED CT `721981007` may be added |
| Category | Specialty only (`394915009` General pathology) | Study type (LOINC) and specialty (SNOMED CT) |
| Narrative | None - no `Composition.text` or `section.text` | Required in every section - a FHIR Document must be readable |
| Section codes | SNOMED CT only | SNOMED CT and LOINC |
| Annotations | Not used; the conclusion is only in `DiagnosticReport.conclusion` | `48767-8` section |
| Section content | Not always consistent - see below | One section per report item, with all its Observations |
{:.grid}

Inconsistencies noticed in the examples (**To confirm** against the published 0.5.1):

- GTT: the section title is a UUID.
- HBsAg: the section code (`51061000237103`) is not the code of its Observation (`1014211000000100`).
- Lipids and HbA1c: the HbA1c Observation is not in any section.
- Urine MC&S: microscopic urinalysis is a second level 1 section, although it is also a member of the urine MC&S Observation.

### Examples

The FHIR Documents generated from the [HL7 v2 Pathology Examples](HL7v2.html) use this
Composition. They have one level 2 section per HL7 v2 `OBR`, coded with `OBR-4`:

- [NHS England FBC](Bundle-HL7v2Msg-NHSE-FBC-Document.html) - Haematology
- [NHS England LFT and U&E](Bundle-HL7v2Msg-NHSE-LFT-UandE-Document.html) - Clinical biochemistry, two report items
- [NHS England Urine MC&S](Bundle-HL7v2Msg-NHSE-UrineMCS-Document.html) - Microbiology, with a Comments section
- the other examples are linked from each message on the [HL7 v2 Pathology Examples](HL7v2.html) page

#### What the reader sees

The NHS England FBC example, rendered from the section narrative:

<div style="border:1px solid #ccc; padding:1em; margin-bottom:1em">
<p><b>Laboratory Report</b> - Laboratory Y8J7D (placeholder), report REP-20220209-001369, 9 February 2022</p>
<p><b>Haematology</b></p>
<p><i>FBC - full blood count</i></p>
<table class="grid">
<thead><tr><th>Test</th><th>Result</th><th>Units</th><th>Reference range</th><th>Flag</th></tr></thead>
<tbody>
<tr><td>Total white cell count</td><td>4.76</td><td>10*9/L</td><td>4-11</td><td></td></tr>
<tr><td>Red blood cell count</td><td>3.63</td><td>10*12/L</td><td>4.1-5.1</td><td>L</td></tr>
<tr><td>Haemoglobin estimation</td><td>108</td><td>g/L</td><td>120-150</td><td>L</td></tr>
<tr><td>Haematocrit</td><td>0.352</td><td>l/l</td><td>0.36-0.46</td><td>L</td></tr>
<tr><td>MCV - Mean corpuscular volume</td><td>97</td><td>fL</td><td>80-100</td><td></td></tr>
<tr><td>MCH - Mean corpuscular haemoglobin</td><td>29.8</td><td>pg</td><td>27-32</td><td></td></tr>
<tr><td>MCHC - Mean corpuscular haemoglobin concentration</td><td>307</td><td>g/L</td><td>315-345</td><td>L</td></tr>
<tr><td>Platelet count</td><td>143</td><td>10*9/L</td><td>140-400</td><td></td></tr>
<tr><td>Neutrophil count</td><td>2.66</td><td>10*9/L</td><td>2-7</td><td></td></tr>
<tr><td>Lymphocyte count</td><td>0.7</td><td>10*9/L</td><td>1-3</td><td>L</td></tr>
<tr><td>Monocyte count</td><td>1.3</td><td>10*9/L</td><td>0.2-1</td><td>H</td></tr>
<tr><td>Eosinophil count</td><td>0.07</td><td>10*9/L</td><td>0.02-0.5</td><td></td></tr>
<tr><td>Basophil count</td><td>0.03</td><td>10*9/L</td><td>0.01-0.1</td><td></td></tr>
</tbody>
</table>
</div>

### Open

- **Open** - whether the level 2 SNOMED CT code should be the result (observable entity)
  code, as in the NHS England examples, or the PaLM requestable (procedure) code, as in
  `ServiceRequest.code`.
- **Open** - level 1 for tests that span specialties (for example serology in
  microbiology or immunology); HL7 Europe has no serology study type.
- **To confirm** - whether NHS England will adopt the HL7 Europe two-level section tree.
