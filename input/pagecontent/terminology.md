<div class="alert alert-danger" role="alert">
<b>Proof of concept.</b> This implementation guide is a demonstration only. It is
<b>not</b> an authoritative source, is not endorsed by NHS England, the National
Disease Registration Service or HL7, and must not be used for implementation or
clinical purposes. The authoritative sources are the standards each page references -
for example the <a href="https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology">COSD Pathology User Guide</a>
or <a href="https://standards.nhs.uk/published-standards/palliative-care-coordination-core-content">SCCI1580</a>.
</div>

COSD Pathology does not publish FHIR terminology. This guide defines it from
the [COSD Pathology User Guide v5](https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology).

### COSD national codes

Each COSD coded data item has a CodeSystem holding its national codes, and a
ValueSet of all those codes. The [logical model](StructureDefinition-PathologyReport.html)
binds to them as **required**; the profiles bind to them as **extensible** or
**preferred**, so SNOMED CT or other codes can also be used.

| COSD item | ValueSet |
|---|---|
| pCR0960 Service Report Status | [COSD Service Report Status](ValueSet-cosd-service-report-status.html) |
| pCR0970 Specimen Nature | [COSD Specimen Nature](ValueSet-cosd-specimen-nature.html) |
| pCR0760 Pathology Investigation Type | [COSD Pathology Investigation Type](ValueSet-cosd-pathology-investigation-type.html) |
| pCR6990 SNOMED Version | [COSD SNOMED Version](ValueSet-cosd-snomed-version.html) |
| pCR0820 Tumour Laterality | [COSD Tumour Laterality](ValueSet-cosd-tumour-laterality.html) |
| pCR0860 Grade of Differentiation | [COSD Grade of Differentiation](ValueSet-cosd-grade-of-differentiation.html) |
| pCR0870 Cancer Vascular or Lymphatic Invasion | [COSD Cancer Vascular or Lymphatic Invasion](ValueSet-cosd-vascular-or-lymphatic-invasion.html) |
| pCR1100 Perineural Invasion | [COSD Perineural Invasion](ValueSet-cosd-perineural-invasion.html) |
| pCR0880 Excision Margin | [COSD Excision Margin](ValueSet-cosd-excision-margin.html) |
| pCR1150 Excision Margin (Circumferential) | [COSD Excision Margin (Circumferential)](ValueSet-cosd-circumferential-margin.html) |
| pCR0840 Synchronous Tumour Indicator | [COSD Synchronous Tumour Indicator](ValueSet-cosd-synchronous-tumour-indicator.html) |
| pCR6980 TNM Coding Edition | [COSD TNM Coding Edition](ValueSet-cosd-tnm-coding-edition.html) |
| pCR1000 Neoadjuvant Therapy Indicator | [COSD Neoadjuvant Therapy Indicator](ValueSet-cosd-neoadjuvant-therapy-indicator.html) |
| pCR7000 Ki-67 Indicator | [COSD Ki-67 Indicator](ValueSet-cosd-ki67-indicator.html) |
| pCR7020-pCR7050 MLH1, PMS2, MSH2, MSH6 Nuclear Expression Intact | [COSD Nuclear Expression Intact](ValueSet-cosd-nuclear-expression-intact.html) |
{:.grid}

### SNOMED CT and ICD-10

COSD allows any SNOMED code for topography and morphology, with the edition
given in pCR6990. These value sets cover **SNOMED CT** only (pCR6990 = 05); legacy
SNOMED II/3/RT T and M codes are not included.

| COSD item | ValueSet | Definition |
|---|---|---|
| pCR6410 Topography (SNOMED) | [Cancer Topography](ValueSet-cancer-topography.html) | SNOMED CT is-a 442083009 Anatomical or acquired body structure (as FHIR core body-site) |
| pCR6420 Morphology (SNOMED) | [Cancer Morphology](ValueSet-cancer-morphology.html) | SNOMED CT is-a 400177003 Neoplasm and/or hamartoma (morphologic abnormality) |
| pCR0810 Diagnosis (ICD Pathological) | [Cancer Diagnosis](ValueSet-cancer-diagnosis.html) | ICD-10, plus SNOMED CT is-a 55342001 Neoplastic disease |
{:.grid}

### LOINC

| Use | ValueSet |
|---|---|
| Tumour marker tests - Ki-67 and MMR IHC | [Cancer Pathology Tumor Marker Test](ValueSet-CancerPathologyTumorMarkerTest.html) |
{:.grid}

The other LOINC codes are fixed in their profiles - see [Profiles](profiles.html).

### PaLM Requestable Tests and LOINC

Copied from the [Pathology and Laboratory](https://kevinmayfield.github.io/PathologyAndLaboratory/en/terminology.html)
IG, so the [HL7 v2](HL7v2.html) examples and their FHIR versions can be read against them:

- [PaLM Requestable Tests](ValueSet-palm-procedure.html) - the 358 members of the SNOMED CT UK Edition
  refset `1853561000000109` *Pathology and laboratory medicine procedure simple reference set* (UK
  Edition 2 July 2025): the laboratory tests that can be requested, which laboratories map their local
  test codes to. Results are coded from the PaLM observables refset `1853551000000106` instead. The codes
  are listed, rather than given as a refset rule, because the UK Edition on tx.fhir.org does not yet
  contain the refset.
- [PaLM Requestable Tests to LOINC Order Codes](ConceptMap-palm-procedure-to-loinc.html) - an
  **illustrative** map to the LOINC order codes HL7 Europe Laboratory prefers for `ServiceRequest.code`
  (`lab-orderCodes-eu-lab`), for the tests in the NHS England examples only:

| PaLM requestable (SNOMED CT UK) | LOINC | Equivalence | Why |
|---|---|---|---|
| `26604007` Full blood count | `57021-8` CBC W Auto Differential panel - Blood | inexact | Panel members differ |
| `252167001` Urea and electrolytes | `24321-2` Basic metabolic 2000 panel - Serum or Plasma | inexact | No LOINC U&E panel |
| `26958001` Hepatic function panel | `24325-3` Hepatic function 2000 panel - Serum or Plasma | inexact | Panel members differ |
| `271244005` Measurement of serum lipid level | `24331-1` Lipid 1996 panel - Serum or Plasma | inexact | Panel members differ |
| `135842001` Serum C reactive protein level | `1988-5` C reactive protein [Mass/volume] in Serum or Plasma | wider | LOINC is serum or plasma |
| `371981000000106` Hb A1c measurement - IFCC standardised | `59261-8` Hemoglobin A1c/Hemoglobin.total standardized per IFCC-RMP for CDT in Blood | equivalent | |
| `47758006` Hepatitis B surface antigen measurement | `5195-3` Hepatitis B virus surface Ag [Presence] in Serum | narrower | LOINC gives scale and specimen |
| `700152009` Human papilloma virus screening | `82675-0` HPV 16+18+31+...+68 DNA [Presence] in Cervix by NAA with probe detection | narrower | LOINC names the types and method |
| `113076002` Glucose tolerance test | `72171-2` Glucose tolerance 2 hours panel - Serum or Plasma | narrower | The 2 hour (75 g) test |
| `401324008` Urinary microscopy, culture and sensitivities | `50554-5` microscopy, `630-4` culture, `29576-6` susceptibility | narrower (each) | No single LOINC order code |
{:.grid}

Equivalence is the LOINC code relative to the PaLM code. LOINC panels follow US practice, so most panel
maps are `inexact` - the LOINC panel does not say what an England laboratory's FBC or U&E contains.

<div class="alert alert-warning" role="alert">
<b>Open - national map.</b> This map is illustrative only. NHS England is understood to be producing the
national PaLM to LOINC map (<b>To confirm</b>); when it is published this guide should reference it and
drop this example.
</div>
