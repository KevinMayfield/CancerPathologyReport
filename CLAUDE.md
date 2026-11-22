# CLAUDE.md

Proof-of-concept FHIR Implementation Guide, **Cancer Pathway Interoperability**:
orders, results and reports along a cancer pathway (IHE LTW/ILW, HL7 v2 for workflow,
FHIR Documents for sharing), with two report models - the Cancer Pathology Report
(COSD Pathology v5 Core - Pathology) and the Palliative Care Record (SCCI1580).
Published at https://kevinmayfield.github.io/CancerPathologyReport/. Supports the NW
GMSA Pathology to Genomics Reflex use case. The repository and published site keep
the original `CancerPathologyReport` name - do not rename them without a planned
migration (inbound links from the NW Genomics IG would break). The canonical is on an
example domain, `https://fhir.acme.example.org/CancerPathologyReport` (package id
`fhir.acme.example.org.cancerpathologyreport`) - never `fhir.nwgenomics.nhs.uk` or
another NHS domain.

## Scope

- **Proof of concept only.** Every page starts with the red "Proof of concept"
  alert box (copy it from an existing page). Never present content as
  authoritative or endorsed.
- **COSD Pathology v5 is the primary source of requirements.** The recipient is
  the Order Placer (EPR) and genomics, not the cancer registry - registry
  submission (monthly COSD XML) is out of scope.
- Items genomics needs but COSD core does not cover (e.g. neoplastic cell
  content, non-MMR IHC) are out of scope of the model; note them as gaps.

## Layout

- FSH: `input/fsh/PathologyReport.fsh` (logical model),
  `input/fsh/Profiles/` (including the Cancer Pathology Composition),
  `input/fsh/Terminology/`, `input/fsh/Examples/`; palliative care record
  (SCCI1580) in `input/fsh/EndOfLife/`
- Pages: `input/pagecontent/`, organised as IHE volumes - Volume 1 Care Processes,
  an overview (`CareProcesses.md`) then the processes in pathway order (Cancer Pathway, Screening, Imaging, LTW, ILW, Genomics,
  Children's Cancer Shared Care, Monitoring and PROMs, Palliative and End of
  Life Care); use cases follow the NW GMSA use case layout (References, Clinical
  Pathway Overview, Actors, Transactions, Current Process, Future Process, Data
  Requirements), Volume 2 Interactions
  (LAB-1, LAB-3, LAB-35, LAB-36, and `HL7v2.md` - pathology HL7 v2 examples only,
  following the NW Genomics HL7 v2 page for segment definitions), Volume 3 Data Models - for each report a model
  page with its FHIR Document and an example rendering ("What the reader sees"),
  and its logical model (Cancer Pathology Report, Palliative Care Record).
- A new page must be added to both `pages:` and `menu:` in `sushi-config.yaml`.
- Research notes and open questions that should not be published:
  `notes/research.md` (outside `input/`, so the IG Publisher ignores it).

## Conventions

- Markdown pages; diagrams as Mermaid (`sequenceDiagram`, `erDiagram`,
  `flowchart`); tables end with `{:.grid}`.
- Label COSD items with their `pCR` codes; HL7 v2 mappings are "indicative".
- Check LOINC codes on tx.fhir.org (`ValueSet/$expand` on `http://loinc.org/vs`,
  or `CodeSystem/$lookup`) before using them.
- Cite sources with links. Mark anything unverified or undecided as **Open** or
  **To confirm** rather than guessing.
- Do not use CAP eCP codes (licensed, not used in England); RCPath datasets have
  no published codes.

## Build and publish

- `sushi build .` after any FSH or `sushi-config.yaml` change; expect 0 errors
  (the SUSHI version warning is known).
- Full build: `./_genonce.sh` (HL7 IG Publisher). Mermaid diagrams are only
  rendered by the full build.
- Any push runs `.github/workflows/igPublish.yml`; pushes to `main` update the
  published site. Commit or push only when asked.
