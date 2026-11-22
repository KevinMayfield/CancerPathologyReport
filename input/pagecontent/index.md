<div class="alert alert-danger" role="alert">
<b>Proof of concept.</b> This implementation guide is a demonstration only. It is
<b>not</b> an authoritative source, is not endorsed by NHS England, the National
Disease Registration Service or HL7, and must not be used for implementation or
clinical purposes. The authoritative source for COSD Pathology is the
<a href="https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology">COSD Pathology User Guide</a>.
</div>

### Aim

This guide defines how a **structured cancer pathology report** is shared with
FHIR, so that its findings can be used by other systems involved in a patient's
cancer care - for example a genomics laboratory receiving a reflex order, the
clinical team, and the patient's electronic patient record.

Its aim is similar to the HL7 US
[Cancer Pathology Data Sharing](https://hl7.org/fhir/us/cancer-reporting/index.html)
IG, but the **recipient is not the cancer registry**. In England the cancer
registry - the National Disease Registration Service (NDRS) - is instead the
**primary source of the requirements**: its
[COSD Pathology](https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology)
dataset defines the content that pathology laboratories already collect for every
registrable cancer report. Registry submission itself (monthly COSD XML) is out of
scope.

COSD Pathology is itself
"[a subset of the RCPath cancer data sets](https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology)",
aligned with the Royal College of Pathologists (RCPath) core items, with national
codes added. RCPath sets the professional standard for what a pathologist reports
and how; COSD codes the subset the registry needs. This guide models **COSD core
only** - COSD site-specific items and RCPath non-core items are not modelled.

#### Why not use registry data?

Registry data is built for audit, research and national statistics, not for
use while a patient is on the pathway:

| Stage | When it is available |
|---|---|
| COSD submission by the trust to NDRS | Monthly, around a month after diagnosis |
| [Rapid Cancer Registration Data](https://www.natcan.org.uk/?p=1906) | Around 4 to 5 months after diagnosis, at lower quality - it does not match the eventual official statistics |
| [Full cancer registration](https://www.natcan.org.uk/?p=1906) | Around 18 to 24 months after the diagnosis cohort |
| [Official statistics](https://nhsd-proxy.openprescribing.net/data-and-information/publications/statistical/cancer-registration-statistics/england-2023) | Around two years - for example 2023 diagnoses from an August 2025 data snapshot |
{:.grid}

The delay is deliberate: it lets registration add treatment and other
submissions and check the data. But the clinical team, the MDT and a genomics
laboratory need the report within days of it being authorised. So this guide
uses COSD to define the **content**, and shares it directly from the pathology
laboratory when the report is issued - see the [Cancer Pathway](CancerPathway.html).

### Content

- [Cancer Pathology Report](PathologyReport.html) - the report's domain archetype
  and detailed model, with COSD, HL7 v2 and FHIR mappings
- [Pathology Report](StructureDefinition-PathologyReport.html) - logical model of the
  COSD Pathology (v5) **Core - Pathology** content, with an entity relationship
  diagram and mappings to COSD and to the profiles in this guide
- [Profiles](profiles.html) - FHIR profiles for that content, built on HL7 Europe
  Base and HL7 Europe Laboratory, and aligned with mCODE where mCODE has an
  equivalent profile
- [Palliative Care Record](PalliativeCareRecord.html) - outside the cancer pathology
  model: the SCCI1580 Palliative Care Co-ordination: Core Content record, with its
  logical model, SDC Questionnaire and a FHIR Document laid out in ReSPECT order;
  its care process is [Palliative and End of Life Care](EndOfLifeCare.html)

The guide is organised as IHE volumes: **Volume 1** care processes along the
pathway, **Volume 2** interactions, and **Volume 3** data models - for each report a
model page with its FHIR Document and an example rendering, and its logical model.

### Worked Example: Lynch Syndrome

The NW GMSA
[Pathology to Genomics Reflex](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/PathologyToGenomicsReflex.md)
use case ties the pages of this guide together. Its worked example is genomic
testing for Lynch syndrome in a patient with colorectal cancer (fictitious):

| Step | What happens | Exchange | Page |
|---|---|---|---|
| 0 | Referral - urgent suspected cancer, or a positive bowel screening result | - | [Cancer Pathway](CancerPathway.html), [Cancer Screening](Screening.html) |
| ① | A colonoscopy biopsy is sent to histopathology | LAB-1 | [LTW](LTW.html), [LAB-1](LAB-1.html) |
| ② | Pathology finds loss of mismatch repair (MMR) proteins and reflexes MLH1 promoter hypermethylation (M1.5) to the Genomic Laboratory Hub, sending the pathology report as prior results. The result comes back to pathology | LAB-35, LAB-36 | [ILW](ILW.html), [LAB-35](LAB-35.html) (HL7 v2 example), [LAB-36](LAB-36.html), [Genomics](Genomics.html) |
| ③ | The Cancer Pathology Report, with a supplementary report, goes back to the clinician | LAB-3 | [LAB-3](LAB-3.html), [Cancer Pathology Report](PathologyReport.html) |
| ④ | The clinician orders germline testing for Lynch syndrome; the genomic report goes back to the clinician and to the Unified Genomic Record | Outside this guide | [Genomics](Genomics.html#not-reflex-orders) |
| ⑤ | If a pathogenic variant is found, the family is referred to clinical genetics | Outside this guide | - |
{:.grid}

The genomics laboratory's requirements for step ② are the NHS England Genomics
Master Dataset **Primary sample** items, modelled in the NW Genomics IG
[Primary Sample](https://nw-gmsa.github.io/en/StructureDefinition-PrimarySample.html)
logical model, which uses this guide for its tumour content - see
[LAB-35](LAB-35.html#genomics-requirements-primary-sample). The scenario is also
described in the LinkedIn article
[One Year On: What a Cancer Pathway Taught Me About Interoperability](https://www.linkedin.com/feed/update/urn:li:ugcPost:7529858024396615680/).

### Sources

| Source | Version | Used for |
|---|---|---|
| [COSD Pathology](https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology) - National Disease Registration Service, NHS England | v5 | **Primary source of requirements** - the data items and their national codes (`pCR` items) |
| [HL7 Europe Base](https://hl7.eu/fhir/base/) | 2.0.1 | Base profiles: `patient-eu-core` (`condition-eu-core` temporarily not used - see [Profiles](profiles.html)) |
| [HL7 Europe Laboratory Report](https://hl7.eu/fhir/laboratory/) | 2.1.0 | Base profiles: `DiagnosticReport-eu-lab`, `Observation-resultslab-eu-lab`, `Specimen-eu-lab` |
| [mCODE (minimal Common Oncology Data Elements)](https://hl7.org/fhir/us/mcode/) | 4.0.0 (STU4) | Profile structure and names where the content matches: Primary Cancer Condition, Histologic Behavior and Type, Histologic Grade, Tumor Size, TNM categories and stage group, Tumor Marker Test, Human Specimen |
| [HL7 US Cancer Pathology Data Sharing](https://hl7.org/fhir/us/cancer-reporting/index.html) | 2.0.0 (STU2) | The overall aim and the pathology Diagnostic Report pattern |
| [HL7 Europe Common Cancer Model](https://build.fhir.org/ig/hl7-eu/cancer-common/) | 1.0.0-ballot | European cancer diagnosis model (`CancerConditionAtDiagnosis`) |
| [Royal College of Pathologists cancer datasets](https://www.rcpath.org/profession/guidelines/cancer-datasets-and-tissue-pathways.html) | - | COSD Pathology v5 is aligned with the RCPath core datasets |
| [NAACCR Volume V - Laboratory Electronic Pathology Reporting](https://www.naaccr.org/pathology-laboratory-electronic-reporting/) | 5.1 | HL7 v2.5.1 `ORU_R01` structure for cancer pathology, applied by analogy - see [LAB-3](LAB-3.html) |
| [LOINC](https://loinc.org/) | 2.83 | Observation codes, checked on tx.fhir.org |
{:.grid}

### Related

- [Pathology to Genomics Reflex](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/PathologyToGenomicsReflex.md) -
  the use case that uses this report as the pathology report semantics of a reflex order
- [NHS North West Genomics FHIR IG](https://nw-gmsa.github.io/en/)
