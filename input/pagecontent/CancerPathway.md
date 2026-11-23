<div class="alert alert-danger" role="alert">
<b>Proof of concept.</b> This implementation guide is a demonstration only. It is
<b>not</b> an authoritative source, is not endorsed by NHS England, the National
Disease Registration Service or HL7, and must not be used for implementation or
clinical purposes. The authoritative sources are the standards each page references -
for example the <a href="https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology">COSD Pathology User Guide</a>
or <a href="https://standards.nhs.uk/published-standards/palliative-care-coordination-core-content">SCCI1580</a>.
</div>


This page places the [Cancer Pathology Report](StructureDefinition-CancerPathologyComposition.html) in the
**whole cancer pathway**, from referral to survivorship. This guide covers the
**diagnostic** part of the pathway - pathology, and how it meets imaging and
genomics. Treatment, follow-up and patient-reported outcomes are shown for
context only: they are **out of scope**, and the national datasets and FHIR
patterns that cover them are listed so readers know where to look. The stages are
aligned with the [cancer patient journey](https://build.fhir.org/ig/hl7-eu/cancer-common/journey.html)
of the HL7 Europe Common Cancer Model - see
[HL7 Europe Common Cancer Model](#hl7-europe-common-cancer-model).

### Overview

```mermaid
flowchart TB
    A["Referral<br/>urgent suspected cancer"]

    subgraph DIAG["Diagnostics"]
        B["Imaging"]
        C["Biopsy"]
        D["Pathology"]
        E["Genomics"]
        BR(["Imaging Report"])
        DR(["Pathology Report"])
        ER(["Genomic Report"])
    end

    F["MDT<br/>diagnosis and integrated stage"]
    FP(["Treatment Plan<br/>recommended by the MDT,<br/>agreed with the patient"])

    subgraph TX["Treatment"]
        G["Surgery"]
        H["Systemic therapy"]
        I["Radiotherapy"]
    end

    J["Follow-up"]
    K["PROMs"]

    PT{{"Task<br/>complete the Palliative Care Record"}}
    PC(["Palliative Care Record<br/>(palliative care plan)"])

    A --> B
    B --> BR
    B -->|"image-guided"| C
    C --> D --> DR
    DR -->|"reflex order"| E
    E --> ER
    BR & DR & ER --> F
    F --> FP --> G & H & I
    G -.->|"resection specimen"| D
    G & H & I --> J --> K
    J -.->|"recurrence or progression<br/>(new evidence)"| B
    F -.->|"poor prognosis,<br/>non-curative intent"| PT
    J -.->|"no longer curable"| PT
    PT --> PC

    classDef inscope fill:#d4edda,stroke:#155724,color:#155724
    classDef context fill:#f8f9fa,stroke:#6c757d,color:#495057
    class C,D,DR,E inscope
    class A,B,BR,ER,F,FP,G,H,I,J,K,PT,PC context
```

Rectangles are activities; rounded boxes are the **reports** and plans they produce. Each
diagnostic service produces its own report, and the MDT brings the three
together:

| Service | Report | Defined by |
|---|---|---|
| Imaging | Imaging Report | [HL7 Europe Imaging Report](https://hl7.eu/fhir/imaging/en/) - see [Imaging and Radiology](Imaging.html) |
| Pathology | Pathology Report | This guide - [Cancer Pathology Report](StructureDefinition-CancerPathologyComposition.html) |
| Genomics | Genomic Report | NW Genomics [Genomic Test Report](https://nw-gmsa.github.io/en/Questionnaire-GenomicTestReport.html) - see [Genomic Testing and Reporting](Genomics.html) |
{:.grid}

Green: covered by this guide. Grey: context only. The Pathology Report is also
the input to the genomic reflex order. The dotted line shows surgery producing a
**resection specimen**, which goes back to pathology for a further report - often
restaging the cancer (pTNM, or ypTNM after neoadjuvant therapy). The dotted line
from follow-up shows the pathway is not linear: a suspected recurrence or progression
goes back through diagnostic testing, as in the HL7 Europe journey's repeated
*evidence - assessment - decision* loop. The hexagon is the **Task** to complete the
[Palliative Care Record](StructureDefinition-PalliativeCareRecordComposition.html),
raised when the MDT judges the prognosis to be poor (a non-curative care plan intent), or
when follow-up shows the cancer is no longer curable. The record is then completed by the
person's clinicians with the person, not by the MDT - see
[Palliative and End of Life Care](EndOfLifeCare.html). Each stage is described in
[Pathway Stages](#pathway-stages) below.

### Pathway Stages

| Stage | What happens | In this guide | Workflow | HL7 Europe journey (entities) |
|---|---|---|---|---|
| Referral | Urgent suspected cancer referral, or a positive screening result | Context | [Cancer Screening](Screening.html) | Before the journey, which starts at diagnosis |
| Imaging | Lesion found; clinical staging (cTNM); image-guided biopsy | Context | [Imaging and Radiology](Imaging.html) | Diagnosis - evidence: `Imaging`; clinical `CancerStage` |
| Biopsy / resection | Specimen taken and sent to histopathology with a request | **In scope** | [LTW](LTW.html) LAB-1 | Diagnosis - evidence: `CancerConditionAtDiagnosis.biopsyDate`; a resection is `Surgery` |
| Pathology | Diagnosis, grade, pathological stage, IHC; Cancer Pathology Report | **In scope** | [LTW](LTW.html) LAB-3 | Diagnosis - evidence: `CancerConditionAtDiagnosis` (histology, body site, grade, `labReportDate`); pathological `CancerStage` |
| Genomics | Reflex order from pathology; genomic report | **In scope** (as the pathology report's consumer) | [ILW](ILW.html), [Genomic Testing and Reporting](Genomics.html) | `[biomarker]` placeholder only - genomic and advanced biomarker models are excluded from release 1 |
| MDT | Imaging, pathology and genomic results combined; diagnosis, integrated stage and recommended treatment plan ([COSD Cancer Care Plan](https://digital.nhs.uk/ndrs/data/data-sets/cosd/cosd-user-guide-v10/core---cancer-care-plan): intent and planned treatment types), agreed afterwards with the patient. A non-curative intent can lead to a referral to palliative care - a Task to complete the [Palliative Care Record](StructureDefinition-PalliativeCareRecordComposition.html) | Context | [Palliative and End of Life Care](EndOfLifeCare.html) | Diagnosis - assessment and decision: `CancerConditionAtDiagnosis` asserted, `CancerStage`; treatment plan excluded from release 1 |
| Treatment | Surgery, systemic anti-cancer therapy, radiotherapy | Out of scope | - | Treatment: `Surgery`, `SystemicTreatment`, `Radiotherapy`, `ActiveSurveillance` |
| Follow-up | Response to treatment, recurrence, surveillance | Out of scope | [Cancer Monitoring and Patient-Reported Outcomes](PatientReportedOutcomes.html#follow-up-after-treatment) | Evidence and follow-up: `OverallCancerTreatmentResponse`, `ClinicalCancerProgression`, `LastFollowUp` |
| Outcomes | Patient-reported outcomes (PROMs) and experience (PREMs) | Out of scope | [Cancer Monitoring and Patient-Reported Outcomes](PatientReportedOutcomes.html#patient-reported-outcome-measures) | Excluded from release 1 (QoL and PROMs) |
{:.grid}

### HL7 Europe Common Cancer Model

The [HL7 Europe Common Cancer Model](https://build.fhir.org/ig/hl7-eu/cancer-common/)
(1.0.0-ballot, continuous build read 23 November 2026) describes the
[cancer patient journey](https://build.fhir.org/ig/hl7-eu/cancer-common/journey.html)
as an iterative, evidence-driven process rather than a linear pathway: evidence is
collected, assessed and acted on - diagnosis, treatment, follow-up - and the loop repeats
over the course of the disease, until follow-up ends at completion or death. Its
[conceptual model](https://build.fhir.org/ig/hl7-eu/cancer-common/conceptualmodel.html)
has a small set of entities, and its
[data evolution](https://build.fhir.org/ig/hl7-eu/cancer-common/journey-data-evolution.html)
rule is that records are **not updated or overwritten** - each time point creates new
records. FHIR Documents follow the same rule: each Cancer Pathology Report is a snapshot,
and a supplementary report is a new document (`Composition.relatesTo`).

The model names the evidence behind a diagnosis - "imaging, biopsy" - but has no entity
for the pathology report or the specimen. This guide fills in that evidence. The
diagnostic testing in [Pathway Stages](#pathway-stages) is the detail behind the
journey's first step, *Diagnosis*, and the [Cancer Pathology Report](StructureDefinition-CancerPathologyComposition.html)
is where most of `CancerConditionAtDiagnosis` and the pathological `CancerStage` come
from:

| HL7 Europe entity and attribute | This guide - COSD Pathology item | FHIR in this guide |
|---|---|---|
| `CancerPatient` | Patient (NHS number) | `patient-eu-core` (the model has its own `patient-eu-ccm`) |
| `CancerConditionAtDiagnosis.histologyBehaviour` | Morphology (SNOMED) pCR6420 | [Histologic Behavior and Type](StructureDefinition-HistologicBehaviorAndType.html); [Primary Cancer Condition](StructureDefinition-PrimaryCancerCondition.html) |
| `CancerConditionAtDiagnosis.bodySite` | Topography (SNOMED) pCR6410, Tumour Laterality pCR0820 | [Primary Cancer Condition](StructureDefinition-PrimaryCancerCondition.html) `bodySite` |
| `CancerConditionAtDiagnosis.tumourGradeSystem` / `tumourGradeValue` | Grade of Differentiation (Pathological) pCR0860 | [Histologic Grade](StructureDefinition-HistologicGrade.html) |
| `CancerConditionAtDiagnosis.biopsyDate` | Sample Collection Date pCR1010 | [Cancer Pathology Specimen](StructureDefinition-CancerPathologySpecimen.html) `collection.collectedDateTime` |
| `CancerConditionAtDiagnosis.labReportDate` | Investigation Result Date pCR0780 | [Cancer Pathology Diagnostic Report](StructureDefinition-CancerPathologyDiagnosticReport.html) `issued`; Composition `attester.time` |
| `CancerConditionAtDiagnosis.imagingDate` | - | Imaging report - see [Imaging and Radiology](Imaging.html) |
| `CancerConditionAtDiagnosis.[biomarker]` | Ki-67 pCR7000/7010, MMR IHC pCR7020-7050 | [Tumor Marker Test](StructureDefinition-TumorMarkerTest.html); genomic results in the [genomic report](Genomics.html) |
| `CancerStage` (type Pathological, classificationType TNM, value) | TNM Coding Edition pCR6980, T/N/M pCR0910-0930, Stage Grouping pCR0940, Neoadjuvant Therapy Indicator pCR1000 | [TNM Primary Tumor](StructureDefinition-TNMPrimaryTumorCategory.html), [Regional Nodes](StructureDefinition-TNMRegionalNodesCategory.html), [Distant Metastases](StructureDefinition-TNMDistantMetastasesCategory.html), [Stage Group](StructureDefinition-TNMStageGroup.html) |
| `CancerStage.surgeryReference` | Specimen Nature pCR0970, Pathology Investigation Type pCR0760 | The resection specimen ([Cancer Pathology Specimen](StructureDefinition-CancerPathologySpecimen.html)) in the report |
| `CancerStage` (type Clinical), `imagingReference`; `Imaging` | - | Not in this guide - imaging and the MDT |
{:.grid}

Differences, and what is still **Open**:

- In the model, the pathological stage comes from `Surgery`. Here it comes from the
  pathology report of the specimen - usually a resection, but a biopsy can also give a
  pathological category - and the link to the surgery is through the specimen.
  A stage after neoadjuvant therapy (ypTNM) is flagged with pCR1000.
- The model has no FHIR mapping yet - its [FHIR model map](https://build.fhir.org/ig/hl7-eu/cancer-common/fhirmodelmap.html)
  says "FHIR Resource (TBD)" for every cancer entity - so the alignment here is at the
  conceptual level. **Open** - align the profiles when HL7 Europe maps
  `CancerConditionAtDiagnosis` and `CancerStage` to FHIR.
- Genomics, biomarker models, the treatment plan, and PROMs are excluded from the
  model's release 1; this guide covers genomics as the consumer of the pathology report,
  and PROMs as context.
- The model covers adults with solid tumours, one cancer at a time. This guide's
  [Children's Cancer Shared Care](ChildrensCancerSharedCare.html) process is outside it.


### Timing Standards

The NHS cancer waiting time standards, in force since
[1 October 2023](https://www.england.nhs.uk/wp-content/uploads/2023/08/PRN00654ii-changes-to-cancer-waiting-times-standards-from-1-october-2023-letter.pdf),
measure the pathway from referral:

| Standard | From | To | Relevance to pathology |
|---|---|---|---|
| Faster Diagnosis Standard (28 days) | Urgent referral | Cancer diagnosed or ruled out | Pathology is usually what confirms the diagnosis |
| 31 days | Decision to treat | First treatment | - |
| 62 days | Urgent suspected cancer referral, urgent screening referral or consultant upgrade | First treatment | Includes the diagnostic pathway, and any reflex genomic testing needed for the treatment decision |
{:.grid}

The [National Cancer Plan for England](https://www.gov.uk/government/collections/national-cancer-plan-for-england)
(February 2026) adds an ambition that 98% of histopathology tests are reported
within 10 days by March 2029, and that every patient who could benefit is offered
a test of their cancer's DNA - both directly affecting the diagnostic part of the
pathway.

### Outside this Guide

Where each later stage of the pathway is defined. The national datasets are
collected by the National Disease Registration Service (NDRS); the FHIR patterns
are from [mCODE](https://hl7.org/fhir/us/mcode/), which this guide is aligned with.

| Stage | National dataset | FHIR pattern (mCODE) | HL7 Europe Common Cancer Model |
|---|---|---|---|
| MDT and integrated stage | COSD (core and site-specific) | [Primary Cancer Condition](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-primary-cancer-condition.html), [TNM Stage Group](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tnm-stage-group.html) | `CancerConditionAtDiagnosis`, `CancerStage` |
| Surgery | COSD, [Hospital Episode Statistics](https://digital.nhs.uk/data-and-information/data-tools-and-services/data-services/hospital-episode-statistics) | [Cancer-Related Surgical Procedure](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-cancer-related-surgical-procedure.html) | `Surgery` |
| Systemic anti-cancer therapy | [Systemic Anti-Cancer Therapy (SACT) data set](https://digital.nhs.uk/ndrs/data/data-sets/sact) | [Cancer-Related Medication Request](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-cancer-related-medication-request.html) / [Administration](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-cancer-related-medication-administration.html) | `SystemicTreatment` |
| Radiotherapy | [Radiotherapy Data Set (RTDS)](https://digital.nhs.uk/ndrs/data/data-sets/rtds) | [Radiotherapy Course Summary](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-radiotherapy-course-summary.html) | `Radiotherapy` |
| Response and recurrence | COSD | [Cancer Disease Status](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-cancer-disease-status.html) | `OverallCancerTreatmentResponse`, `ClinicalCancerProgression`, `LastFollowUp` |
| Patient-reported outcomes | [Cancer Quality of Life Survey](https://nhsd-proxy.openprescribing.net/ndrs/data/data-outputs/cancer-data-hub/cancer-quality-of-life-survey) | `Questionnaire` / `QuestionnaireResponse` - see [Cancer Monitoring and Patient-Reported Outcomes](PatientReportedOutcomes.html#patient-reported-outcome-measures) | Excluded from release 1 |
| Patient experience | [National Cancer Patient Experience Survey (CPES)](https://www.ncpes.co.uk/) | - | - |
| Palliative and end of life care | [SCCI1580 Palliative Care Co-ordination: Core Content](https://standards.nhs.uk/published-standards/palliative-care-coordination-core-content) | `Questionnaire` and logical model - see [End of Life Care](EndOfLifeCare.html) | - (`LastFollowUp` records vital status and death) |
{:.grid}

### Operational Management (FDP Cancer 360)

Managing patients through the pathway - who is waiting, at which stage, and
against which waiting time standard - is done by cancer services managers and
tracking teams. The NHS Federated Data Platform (FDP) product **Cancer 360**
brings data from different systems into a single, automatically updated tracking
list of patients on a cancer diagnosis pathway
([Digital Health, February 2025](https://www.digitalhealth.net/2025/02/cancer-diagnostic-pathway-tool-to-launch-on-fdp/)).

<div class="alert alert-info" role="alert">
<b>Terminology.</b> This guide uses three terms:
<ul>
<li><b>Clinical</b> - the care of the individual patient by clinicians: the
report reaching the EPR (LAB-3), the MDT, the reflex order to genomics (LAB-35).</li>
<li><b>Operational management</b> - managing the pathway and the service: tracking
lists, waiting time standards, bottlenecks, capacity. Cancer 360 is here.</li>
<li><b>Analytic</b> - audit, research, statistics and outcomes: NDRS.</li>
</ul>
FDP material describes Cancer 360 as supporting direct care and its data as
"operational data" (<a href="https://www.england.nhs.uk/wp-content/uploads/2025/07/redacted-cancer-360-fdp-local-dpia-v1.0.pdf">Cancer 360 local DPIA template</a>).
In clinical systems, "operational" usually means the systems clinicians use to
deliver care - EPR, LIMS, order communications - so the FDP terminology can
suggest Cancer 360 is a clinical system. It is an operational <b>management</b>
tool: it tracks the patient's progress and the actions needed, but it does not
produce or exchange the clinical reports.
</div>

The FDP Canonical Data Model overlaps with this guide in **pathway tracking and
identifiers**, not in the clinical content of the report (see the NW GMSA
[FDP Canonical Data Model](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/FDPCanonicalDataModel.md)
analysis):

| Area | FDP Canonical Data Model | This guide |
|---|---|---|
| Pathway | `Cancer Pathway`, `Patient Pathway`, cancer tracking comments | [Cancer Pathway](CancerPathway.html) (context) |
| MDT | `Mdt Meeting`, `Mdt Note` | Context |
| Diagnosis | `Patient Diagnosis` (SNOMED CT, ICD-10) | pCR0810, pCR6410, pCR6420 |
| Report | `Histology` - one object per discipline | [Cancer Pathology Diagnostic Report](StructureDefinition-CancerPathologyDiagnosticReport.html) |
| Results | `Test Result` - one flat row per result; no LOINC, no order object | Coded `Observation`s grouped by the report |
| Identifiers | `Test Result.Laboratory Number` | `Specimen.accessionIdentifier`, order numbers |
{:.grid}

The COSD synoptic content - histological type and grade, pTNM, margins, invasion,
tumour size, MMR IHC - has no equivalent in the FDP Canonical Data Model. What
tracking needs from the pathology report is the **milestone** (report authorised,
`DiagnosticReport.issued`, pCR0780), the diagnosis it confirms, and the
identifiers that link it to the patient's pathway.

#### Where Cancer 360 gets its data

NHS England's
[Cancer 360 local DPIA template](https://www.england.nhs.uk/wp-content/uploads/2025/07/redacted-cancer-360-fdp-local-dpia-v1.0.pdf)
(v3.0, May 2025) describes the feeds. Each trust completes it, so system names
and refresh intervals are left for the trust to fill in. Data comes from the
**trust's own systems**, through a direct API connection or the trust data
warehouse, refreshed every few hours - **not** from NDRS, and not as COSD, HL7 v2
or FHIR messages:

| Trust system | Domain | Datasets |
|---|---|---|
| Radiology Information System | **Imaging** | Radiology exams, booking status, report text |
| Histology System | **Pathology** - cellular pathology (histopathology) | Histopathology samples, histopathology diagnostic reports |
| Pathology Results System | **Pathology** - other disciplines (for example blood sciences) | Test results |
| Endoscopy Information System | Endoscopy - a diagnostic procedure; its biopsies go to pathology | Endoscopy exams, booking status, report text |
| Cancer registry (the trust's local cancer register / tracking system) | Cancer services - pathway tracking and MDT | Cancer pathways, tracking notes, MDT meetings, notes and bookings, inter-provider transfers |
| EPR | Administration and care - not diagnostic | Demographics, contact details, outpatient appointments, inpatient procedures |
| Oncology Information System | Treatment - not diagnostic | Cancer treatments, treatment booking status |
{:.grid}

Only three of the seven systems are pathology or imaging. Endoscopy is a
diagnostic service in its own right - it is reported separately, like imaging,
and produces specimens for pathology. Genomics is not listed as a source.
The diagnostic systems match the FDP Canonical Data Model objects `Radiology
Exam`, `Histology`, `Test Result` and `Endoscopy`.

Actions entered by staff in Cancer 360 (requests to teams, owners, due dates,
escalations) are not written back to the source systems. The field-level
"Cancer 360 Data Specification" is referred to but not published.

**Orders are not included.** The template lists no order or request datasets
from any source system. Order dates appear only as timing fields in its
metrics - "Mean Order Day" for radiology exams, endoscopy exams, outpatient
appointments and inpatient procedures. For histology the metrics are only
sample taken day, report day and report turnaround time, so pathology is
measured from when the sample was taken, not from the request. The "requests"
in Cancer 360 are its own actions (for example "book imaging"), created by staff
in the tool. Neither the histopathology request (LAB-1) nor a reflex order to
genomics (LAB-35) and its result (LAB-36) are visible - a patient waiting for a
reflex genomic test appears only through tracking notes or manually created
actions. This is based on the template; the unpublished Data Specification or a
trust's completed DPIA may differ.

- Whether the histopathology report reaches Cancer 360 as **structured** items or
  only as report-level data is **open**. For radiology and endoscopy the template
  says "report text".
- The trust's local cancer register is also the system trusts typically use to
  compile their COSD submission, so the diagnosis milestones Cancer 360 tracks
  already originate in the trust. A structured LAB-3 report, as in this guide,
  would be a cleaner source for them.
- NHS England reported Cancer 360 live at Chelsea and Westminster and Royal United
  Hospitals Bath, with University Hospitals of Derby and Burton implementing it and
  a further 10 trusts to follow
  ([May 2025](https://www.england.nhs.uk/long-read/nhs-expands-cancer-technology-rollout/)).

### Cancer Registration (NDRS): Analytic

The National Disease Registration Service (NDRS) receives COSD, SACT and RTDS
submissions from every trust and builds the national cancer registration. It is
an **analytic** service - for audit, research, national clinical audits, PROMs
sampling and official statistics - not a clinical or operational management one.
Its data arrives too late to support decisions on a patient's pathway:

| Stage | When it is available | Compared with the pathway |
|---|---|---|
| COSD submission by the trust | Monthly, around a month after diagnosis | After the 28-day Faster Diagnosis Standard |
| [Rapid Cancer Registration Data](https://www.natcan.org.uk/?p=1906) | Around 4 to 5 months after diagnosis, at lower quality | After the 62-day treatment standard |
| [Full cancer registration](https://www.natcan.org.uk/?p=1906) | Around 18 to 24 months after the diagnosis cohort | Around the time of the [Cancer Quality of Life Survey](#patient-reported-outcomes) |
| [Official statistics](https://nhsd-proxy.openprescribing.net/data-and-information/publications/statistical/cancer-registration-statistics/england-2023) | Around two years - for example 2023 diagnoses from an August 2025 data snapshot | Long after treatment |
{:.grid}

Clinical uses (the clinical team, the MDT, a reflex order to genomics) and
operational management (tracking against waiting time standards) need the report
when it is authorised. That is why this guide shares the report directly from
the pathology laboratory, and uses COSD only to define its content - see
[Why not use registry data?](index.html#why-not-use-registry-data).

| | Clinical | Operational management | Analytic |
|---|---|---|---|
| Purpose | Care of the patient now | Managing the pathway and the service | Audit, research, statistics, outcomes |
| Users | Clinicians, MDT, laboratories | Cancer services managers, tracking teams | Registry, national audits, researchers |
| Timing | Days | Hours to days | Months to years |
| Examples | LAB-3 report to the EPR, LAB-35 reflex order | FDP Cancer 360 tracking list | NDRS registration, NATCAN audits, Cancer Quality of Life Survey |
{:.grid}

### Data Engineering: FDP Cancer 360 and NDRS

The same source systems feed both FDP Cancer 360 (operational management) and
NDRS (analytic), through separate data engineering routes. Not all of them
belong to the trust:

- **Regional source systems** - the Genomic Laboratory Hub's genomic LIMS, shared
  across the region.
- **ICB source systems** - pathology and radiology are increasingly provided by
  networks shared between trusts in an Integrated Care Board area (for example a
  single pathology LIMS across a pathology network).
- **Trust source systems** - endoscopy, oncology, the EPR / PAS and the local
  cancer register.

The **Trust Integration Engine** exchanges orders, requests, bookings, results
and reports between these systems - this is where the clinical exchange this
guide defines (LAB-3, LAB-35) takes place:

```mermaid
flowchart TB
    subgraph REG["Regional source systems"]
        GLIMS["Genomic LIMS"]
    end

    subgraph ICB["ICB source systems"]
        LIMS["Pathology LIMS"]
        RIS["Radiology (RIS)"]
    end

    subgraph SRC["Trust source systems"]
        ENDO["Endoscopy"]
        ONC["Oncology / SACT"]
        EPR["EPR / PAS"]
        CR["Local cancer register<br/>tracking, MDT"]
    end

    subgraph ENG["Trust data engineering"]
        DW["Trust data warehouse<br/>or direct API"]
        EXT["COSD, SACT, RTDS<br/>extracts"]
    end

    subgraph CLIN["Trust Integration Engine"]
        OPX["Orders, requests, bookings,<br/>results and reports<br/>e.g. LAB-1, LAB-3, LAB-35"]
    end

    subgraph MGMT["Operational management - hours to days"]
        C360["FDP Cancer 360<br/>tracking list"]
    end

    subgraph ANA["Analytic - months to years"]
        NDRS["NDRS<br/>cancer registration"]
        OUT["Rapid registration, audits,<br/>statistics, PROMs sampling"]
    end

    SRC <-->|"event messages<br/>(real time - HL7)"| CLIN
    ICB <-->|"event messages<br/>(real time - HL7)"| CLIN
    GLIMS <-->|"LAB-35, LAB-36"| OPX
    LIMS -->|"this guide:<br/>Cancer Pathology Report"| OPX
    LIMS & RIS & ENDO & ONC & EPR & CR --> DW
    DW -->|"local formats,<br/>hourly"| C360
    OPX -.->|"real time<br/>event feed"| C360
    OPX -.->|"in some trusts"| DW
    LIMS & CR & ONC --> EXT
    EXT -->|"COSD standard,<br/>monthly"| NDRS
    NDRS --> OUT

    classDef inscope fill:#d4edda,stroke:#155724,color:#155724
    classDef cosd fill:#fff3cd,stroke:#856404,color:#856404
    classDef context fill:#f8f9fa,stroke:#6c757d,color:#495057
    class OPX inscope
    class EXT,NDRS cosd
    class GLIMS,LIMS,RIS,ENDO,ONC,EPR,CR,DW,C360,OUT context
```

Green: this guide. Amber: where the COSD standard is applied today. The dotted
line is a possible **real time event feed**: the same messages that the
Trust Integration Engine already routes - including the LAB-3 report and the
LAB-35 reflex order - could also notify Cancer 360
as each report is issued, instead of it waiting for the next warehouse
extract. In some trusts the integration engine already feeds the trust data
warehouse (dotted line to the warehouse), so their content reaches Cancer 360
through the warehouse extract instead. How
pathology data reaches the COSD extract - directly from the laboratory, or
through the trust's local cancer register - varies by trust (**to confirm**).

1. **FDP Cancer 360 and NDRS are likely to have overlapping datasets.** Both take
   cancer pathways, diagnoses, MDT outcomes, histopathology and treatments from the
   same trust systems - in particular the local cancer register - but through
   separate extracts, in different formats, on different timescales (hourly
   versus monthly). The same pathology item may be extracted, transformed and
   checked twice, with no guarantee that the two copies agree.
2. **NDRS codes a subset of the RCPath standard, but neither is used earlier in
   the system, where they are probably also required.** The Royal College of
   Pathologists (RCPath) cancer datasets are the professional standard for what a
   pathologist reports, and how - including synoptic and supplementary reports.
   COSD Pathology is
   "[a subset of the RCPath cancer data sets](https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology)",
   aligned with the RCPath core items, and adds the national codes. But the codes
   are applied only at the end, in the monthly submission to NDRS. Upstream - the
   report from the LIMS to the EPR, the feed into the trust data warehouse and
   FDP, the reflex order to genomics - the same items travel in local formats, or
   as report text. Tracking, the MDT and genomics need the same content, and need
   it sooner. This guide proposes using the COSD content and codes **at the point
   the report is issued** (LAB-3, LAB-35), so the clinical, operational management
   and analytic routes can start from the same structured data.

### Patient-Reported Outcomes

PROMs are not a single step at the end of the pathway: the national Cancer Quality
of Life Survey reaches patients through the registry about 18 months after
diagnosis, and clinical PROMs are collected by the care team during and after
treatment. See [Patient-Reported Outcomes](PatientReportedOutcomes.html).
