# Fun30 Facilitates Condensin-Mediated Chromatin Compaction via Brn1 Loading in Quiescent Yeast

**Computational Genomics | ChIP-seq Analysis | Chromatin Organization**

## Overview

Chromatin organization plays a critical role in regulating gene expression, genome stability, and cellular adaptation. During quiescence, yeast cells undergo extensive chromatin reorganization to support long-term survival.

This project investigates the role of the ATP-dependent chromatin remodeler **Fun30** in condensin-mediated chromatin compaction in *Saccharomyces cerevisiae*, with a particular focus on the condensin subunit **Brn1**.

The computational analysis examines genome-wide Fun30 and Brn1 occupancy, genomic signal distributions, and chromatin insulation patterns to explore how Fun30 may contribute to condensin recruitment and higher-order chromatin organization during quiescence.

## Research Objectives

1. Characterize genome-wide Fun30 and Brn1 chromatin occupancy.
2. Compare protein enrichment between logarithmically growing and quiescent yeast cells.
3. Investigate Fun30 distribution across divergent, convergent, and tandem intergenic regions.
4. Analyze chromatin insulation and genomic organization.
5. Explore the relationship between Fun30 activity, Brn1 loading, and chromatin compaction.

## Computational Workflow

### 1. ChIP-seq Data Analysis

Analyze chromatin immunoprecipitation sequencing (ChIP-seq) data to characterize genome-wide protein occupancy.

The analysis includes processing sequencing-derived data and generating genomic signal tracks for downstream comparisons.

### 2. Biological and Technical Replicate Analysis

Compare Fun30 and Brn1 ChIP-seq signals across biological and technical replicates to assess consistency between experimental samples.

### 3. Genomic Signal Profiling

Examine protein enrichment across three classes of intergenic regions:

- **Divergent:** Regions between genes transcribed in opposite, outward-facing directions.
- **Convergent:** Regions between genes transcribed toward one another.
- **Tandem:** Regions between genes transcribed in the same direction.

Use deepTools to generate signal matrices and compare enrichment patterns across genomic regions.

### 4. Chromatin Insulation Analysis

Analyze chromatin insulation patterns to investigate genome organization and potential relationships between chromatin remodeling and condensin-associated compaction.

### 5. Data Visualization

Generate heatmaps, genomic signal profiles, and comparative plots to visualize Fun30 and Brn1 occupancy across experimental conditions.

## Tools and Technologies

| Category | Tools |
|---|---|
| Programming | Python, Bash |
| ChIP-seq analysis | deepTools |
| Data manipulation | pandas |
| Visualization | matplotlib, seaborn |
| Genomic data formats | BED, BigWig |
| Reference organism | *Saccharomyces cerevisiae* |

## Repository Structure

The following structure represents the planned organization of the analysis scripts.

```text
Fun30-project/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── scripts/
│   ├── 01_chipseq_processing/
│   ├── 02_replicate_analysis/
│   ├── 03_chromatin_insulation/
│   └── 04_visualization/
│
├── data/
│
├── results/
│   └── figures/
│
└── docs/
    └── methodology.md
```

## Requirements

### Software

- Python 3.x
- Bash
- deepTools

### Python Libraries

- pandas
- matplotlib
- seaborn

Install the Python dependencies using:

```bash
pip install pandas matplotlib seaborn
```

Install deepTools using:

```bash
conda install -c bioconda deeptools
```

Additional dependencies may be required for individual analysis scripts.

## Installation

Clone the repository:

```bash
git clone https://github.com/ssh-arma/Fun30-project.git
```

Navigate to the project directory:

```bash
cd Fun30-project
```

Install the required software and configure the input data paths before running the analyses.

## Usage

The repository contains scripts for analyzing ChIP-seq enrichment, genomic signal distributions, biological and technical replicates, and chromatin insulation.

The analyses require appropriate genomic input files, including:

- ChIP-seq signal tracks
- Genomic annotations
- BED files defining genomic regions
- Experimental sample metadata

Some scripts contain HPC-specific file paths and may require modification before execution on other systems.

Detailed execution instructions will be added as the scripts are standardized.

## Results and Outputs

The computational analyses generate outputs such as:

- Fun30 and Brn1 genomic occupancy profiles.
- Heatmaps of ChIP-seq enrichment across genomic regions.
- Average signal profiles for divergent, convergent, and tandem intergenic regions.
- Comparative analyses of biological and technical replicates.
- Chromatin insulation profiles.
- Figures illustrating differences in genomic signal distributions across experimental conditions.

## Scientific Significance

Chromatin compaction is an important feature of cellular quiescence, but the molecular mechanisms coordinating chromatin remodeling and condensin activity remain incompletely understood.

By investigating Fun30 and Brn1 genomic occupancy, this project aims to characterize the relationship between ATP-dependent chromatin remodeling and condensin-associated genome organization in quiescent yeast.

The computational analyses provide a framework for examining how chromatin-associated proteins contribute to higher-order genome organization.

## Project Status

**Status:** Research analysis completed in part; repository documentation and workflow organization are ongoing.

The repository currently contains research analysis scripts. Additional documentation, representative figures, and reproducibility improvements will be incorporated as the project is organized.

## Author

**Shubhangi Sharma**

Computational Chemistry | Computational Biology

The Ohio State University

GitHub: [ssh-arma](https://github.com/ssh-arma)

## License

A license has not yet been specified. Reuse and redistribution permissions should be confirmed before adding an open-source license.
