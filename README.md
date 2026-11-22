# Cancer Pathway Interoperability (Proof of Concept)

> **Proof of concept.** This FHIR Implementation Guide is a demonstration only. It is **not** an authoritative source, is not endorsed by NHS England, the National Disease Registration Service or HL7, and must not be used for implementation or clinical purposes.

Interoperability along a cancer pathway - screening, diagnostic testing, genomics, treatment monitoring, patient-reported outcomes and palliative care - using IHE laboratory workflow (HL7 v2) for orders and results and FHIR Documents for sharing. It defines two report models:

- **Cancer Pathology Report** - based on COSD Pathology (v5) Core - Pathology
- **Palliative Care Record** - based on SCCI1580 Palliative Care Co-ordination: Core Content

Published at https://kevinmayfield.github.io/CancerPathologyReport/. Used by the
[Pathology to Genomics Reflex](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/PathologyToGenomicsReflex.md) use case.

The repository and published site keep the original `CancerPathologyReport` name, so existing links still work. The canonical is on an example domain, `https://fhir.acme.example.org/CancerPathologyReport` (package id `fhir.acme.example.org.cancerpathologyreport`), as this is a proof of concept and not published by an NHS organisation.

- FSH source: `input/fsh/`
- Build: `sushi build .`, then the HL7 FHIR IG Publisher
