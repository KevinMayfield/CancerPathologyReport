<div class="alert alert-danger" role="alert">
<b>Proof of concept.</b> This implementation guide is a demonstration only. It is
<b>not</b> an authoritative source, is not endorsed by NHS England, the National
Disease Registration Service or HL7, and must not be used for implementation or
clinical purposes. The authoritative source for COSD Pathology is the
<a href="https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology">COSD Pathology User Guide</a>.
</div>

<div class="alert alert-warning" role="alert">
<b>Draft</b> - first analysis, using colorectal cancer as the example.
</div>

After treatment with curative intent, patients are monitored to detect recurrence.
Monitoring is a series of ordinary tests - blood tests, imaging and endoscopy -
tracked over several years. When a test suggests the cancer has come back, a biopsy
produces a new [Cancer Pathology Report](PathologyReport.html), so monitoring leads
back into this guide.

### References

- [NICE NG151 Colorectal cancer](https://www.nice.org.uk/guidance/ng151) - follow-up recommendations, summarised in [NICE QS20 Quality statement 4: Follow-up for detecting local recurrence and distant metastases](https://www.nice.org.uk/guidance/qs20/chapter/Quality-statement-4-Follow-up-for-detecting-local-recurrence-and-distant-metastases)
- [Cancer stratified follow-up handbook](https://www.england.nhs.uk/wp-content/uploads/2020/04/cancer-stratified-follow-up-handbook-v1-march-2020.pdf) - NHS England, v1 March 2020, and [Implementing personalised stratified follow-up pathways](https://www.england.nhs.uk/publication/implementing-personalised-stratified-follow-up-pathways/)
- [Cancer-specific electronic patient record where follow-up care can be managed remotely](https://transform.england.nhs.uk/key-tools-and-info/digital-playbooks/cancer-digital-playbook/cancer-specific-electronic-patient-record-to-support-clinical-teams-and-patients-where-follow-up-care-can-be-managed-remotely) - NHS England cancer digital playbook
- [COSD user guide v10 - How to record recurrence, progression and transformations](https://digital.nhs.uk/ndrs/data/data-sets/cosd/cosd-user-guide-v10/introduction---how-to-record-recurrence-progression-and-transformations) - NDRS
- [mCODE Cancer Disease Status](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-cancer-disease-status.html) - HL7 US
- [Cancer Screening - Lynch syndrome surveillance](Screening.html#lynch-syndrome-surveillance)

### Overview

NHS England's **personalised stratified follow-up** (PSFU) puts patients into
follow-up pathways by risk. Patients assessed as low risk who have finished
treatment move to supported self-management with **remote surveillance**: their
surveillance tests are scheduled and tracked by a **remote monitoring system**
(RMS), and they can contact the team directly if they have symptoms
(patient-initiated follow-up, PIFU). The handbook covers breast, prostate and
colorectal cancer first. NHS England describes extending PSFU, "including patient
initiated follow-up, to all appropriate cancer pathways"
([Living with and beyond cancer](https://www.england.nhs.uk/cancer/living/)).

```mermaid
flowchart LR
    T["Treatment<br/>completed"] --> S{"Stratified<br/>by risk"}
    S -- "low risk" --> R["PSFU: remote<br/>monitoring system"]
    S -- "higher risk" --> C["Clinician-led<br/>follow-up"]
    R --> Tests["Surveillance tests<br/>CEA, CT, colonoscopy"]
    C --> Tests
    Tests -- "no evidence<br/>of disease" --> R
    Tests -- "suspected<br/>recurrence" --> B["Biopsy"]
    B -- "LAB-1 / LAB-3" --> P["Cancer Pathology<br/>Report"]
    P --> M["MDT"]
    M --> COSD["COSD: non-primary<br/>cancer pathway"]
```

### Colorectal Cancer Surveillance

From NICE QS20 statement 4 (based on NG151), for adults who have had potentially
curative surgery for non-metastatic colorectal cancer, over the first 3 years. The
exact NG151 wording has not been checked (the NICE site refused automated access) -
**To confirm**.

| Test | Frequency | Exchange | Coding |
|---|---|---|---|
| Serum carcinoembryonic antigen (CEA) | At least every 6 months | Blood sciences order and result - [LTW](LTW.html) LAB-1 / LAB-3 | LOINC `2039-6` Carcinoembryonic Ag [Mass/volume] in Serum or Plasma |
| CT of the chest, abdomen and pelvis | At least 2 in the first 3 years | Imaging order and report - see [Imaging and Radiology](Imaging.html) | - |
| Clearance colonoscopy | Within 1 year of diagnosis | Endoscopy; biopsies to histopathology (LAB-1 / LAB-3) | - |
| Ongoing colonoscopy | Per the BSG/ACPGBI/PHE post-polypectomy and post-colorectal cancer resection surveillance guidelines (2020), cited by QS20 | As above | - |
| Lynch syndrome colonoscopy | Every 2 years, by the NHS Bowel Cancer Screening Programme | See [Cancer Screening](Screening.html#lynch-syndrome-surveillance) | - |
{:.grid}

A CEA result is an ordinary laboratory result (illustrative - the reference range
is laboratory specific):

```
OBX|1|NM|2039-6^Carcinoembryonic Ag [Mass/volume] in Serum or Plasma^LN||3.1|ug/L^microgram per litre^UCUM|<5|N|||F|||20260512
```

It is the **trend** across results, not a single result, that suggests recurrence.

### The Remote Monitoring System in Workflow Terms

The surveillance tests are normal [LTW](LTW.html) orders and results. What PSFU
adds is a system that knows the **schedule** and checks each test was ordered,
done and reviewed, so that patients are not lost to follow-up.

| Question | Status |
|---|---|
| Is the RMS the Order Placer for surveillance tests, or does it prompt the EPR to order them? | **Open** |
| How does the RMS receive results - as the Order Placer, as a result copy recipient (`OBR-28`), or from the EPR? | **Open** |
| Which systems provide remote monitoring? | The PSFU handbook (page 14): "The main cancer IT systems (Somerset Cancer Register and Infoflex) now offer this functionality". Which are used in the North West is **To confirm** |
| Is there a national interface standard for an RMS? | None found |
{:.grid}

If the RMS receives results as a LAB-3 recipient, the coding in this guide - LOINC
for the question, SNOMED CT for the answer, ODS codes as assigning authorities -
lets it match results to the schedule without local mapping.

### Patient-Reported Outcomes During Follow-up

Follow-up depends on what patients report as well as on test results. The
[PSFU handbook](https://www.england.nhs.uk/wp-content/uploads/2020/04/cancer-stratified-follow-up-handbook-v1-march-2020.pdf)
expects:

| Element | What the handbook says | Exchange |
|---|---|---|
| End of Treatment Summary | Information on "potential markers of recurrence/secondary cancers and what to do if these are found", "also copied to primary care and incorporated into hospital notes" (page 13); it should include "potential long term/late effects and what to do if symptoms are experienced" (page 18) | A document to the patient and GP - not defined in this guide |
| Patient-initiated follow-up | The patient contacts the team if they notice those markers; "a person is immediately recalled to clinic if there are any surveillance or other results of concern" (page 13) | Patient to care team, e.g. via a patient portal |
| Holistic Needs Assessment (HNA) | "HNA is not a separate activity, it is part of care planning" (page 16); ongoing HNAs help identify consequences of treatment (page 18) | Questionnaire - instrument not specified |
| Patient-reported outcomes | "Monitoring via Patient Reported Outcome tools, online Holistic Needs Assessments and/or patient symptom diaries. Patient portals can also support people's questions" (page 18) | Questionnaire - instruments not named |
| Patient portal | "an effective way for people to access their test results and care record, and to seek online advice and guidance" (page 14) | Part of the remote monitoring system |
{:.grid}

The handbook names no PRO instrument. So the clinical PROMs used in follow-up are a
local choice, and whether they include the instruments on the
[Patient-Reported Outcomes](PatientReportedOutcomes.html) page (EQ-5D-5L, EORTC
QLQ-C30) is **To confirm**. Whether the remote monitoring system collects them, and
whether any are coded, is also **To confirm**. The national Cancer Quality of Life
Survey, at about 18 months after diagnosis, is separate: it reaches patients
through the registry, not through follow-up.

### Recurrence and the Cancer Pathology Report

A biopsy taken for suspected recurrence is reported like any other specimen, and
gives a new Cancer Pathology Report. Its
[Specimen Nature](ValueSet-cosd-specimen-nature.html) (pCR0970) shows what was
sampled: `2` Further excision of primary tumour, `4` Regional lymph nodes, or
`5` Metastatic site other than regional lymph nodes.

In COSD, "all 'Recurrence' diagnoses" create a record on a **Non-Primary Cancer
Pathway**, recording "the date of the non-primary diagnosis (note: this is the
diagnosis date of the recurrence)", the "Metastatic Type (local, regional or
distant)" and the "Metastatic Site". Progression and transformation are recorded
separately. These names are from the COSD v10 user guide; the COSD item codes are
**To confirm** against the
[COSD v10.2 data set](https://digital.nhs.uk/ndrs/data/data-sets/cosd/cosd-v10.0-downloads).
They are COSD core items, not COSD Pathology items, so they are not in this
guide's model.

### Disease Status

mCODE records the clinician's judgement of the cancer's trend as a
[Cancer Disease Status](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-cancer-disease-status.html)
Observation: "whether it is stable, worsening (progressing), or improving
(responding)".

| Element | Value |
|---|---|
| `code` | LOINC `97509-4` (tx.fhir.org display: Cancer disease progression) |
| `value` (preferred) | SNOMED CT `268910001` Patient's condition improved, `359746009` stable, `271299001` worsened, `709137006` undetermined |
| `evidenceType` extension (required) | Descendants of SNOMED CT histologic test, cytologic test, anatomic pathology procedure, laboratory data interpretation, clinical examination, imaging and tumor marker measurement |
{:.grid}

The pathology report, a CEA trend and an imaging report are each possible
**evidence** for a disease status. Disease status is not modelled in this guide.

### Gaps

- No national interface standard found for remote monitoring systems.
- The PSFU handbook names no patient-reported outcome or HNA instrument, and no
  data standard for the End of Treatment Summary.
- NICE NG151 recommendation wording and numbers not checked - **To confirm**.
- COSD recurrence item codes not checked - **To confirm**.
- Monitoring for other cancers (breast, prostate) not yet analysed.
- Circulating tumour DNA (ctDNA) monitoring is a genomic test, not covered here;
  LOINC has `107453-3` Circulating tumor DNA [Interpretation] Narrative.
