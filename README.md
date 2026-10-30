Fun30 Facilitates Condensin-Mediated Chromatin Compaction via Brn1 Loading in Quiescent Yeast

Computational Genomics | ChIP-seq Analysis | Chromatin Organization

Overview

Chromatin organization plays an essential role in genome stability and gene regulation. During quiescence, cells undergo extensive chromatin reorganization to maintain genome integrity and adapt to prolonged periods of reduced metabolic activity.

This project investigates the role of the ATP-dependent chromatin remodeler Fun30 in condensin-mediated chromatin organization in quiescent Saccharomyces cerevisiae (budding yeast).

The analysis focuses on the genome-wide distribution of Fun30 and the condensin subunit Brn1, examining their chromatin occupancy patterns, enrichment across genomic regions, and potential contributions to higher-order chromatin organization.

Computational approaches include ChIP-seq analysis, genomic signal profiling, replicate comparisons, and chromatin insulation analysis.

Research Objectives

* Characterize genome-wide Fun30 and Brn1 chromatin occupancy.
* Compare protein enrichment across logarithmic growth and quiescence.
* Investigate Fun30 distribution across divergent, convergent, and tandem intergenic regions.
* Analyze chromatin insulation and genome organization.
* Explore relationships between Fun30 activity, condensin recruitment, and chromatin compaction.

Computational Workflow

1. ChIP-seq Analysis

Analysis of chromatin immunoprecipitation sequencing (ChIP-seq) data to investigate genome-wide Fun30 and Brn1 occupancy.

Genomic signal tracks are processed to examine enrichment patterns across different experimental conditions.

2. Biological and Technical Replicate Analysis

Comparative analysis of biological and technical replicates to assess consistency in Fun30 and Brn1 ChIP-seq signal distributions.

3. Genomic Signal Profiling

Quantification of protein enrichment across three classes of intergenic regions:

* Divergent: Regions between genes transcribed in opposite directions, away from one another.
* Convergent: Regions between genes transcribed toward one another.
* Tandem: Regions between genes transcribed in the same direction.

Genomic signal matrices and average enrichment profiles are generated using deepTools.

4. Chromatin Insulation Analysis

Analysis of chromatin insulation patterns to investigate genomic organization and potential relationships between chromatin remodeling and condensin-associated compaction.

5. Data Visualization

Generation of heatmaps, average signal profiles, and comparative plots to visualize differences in chromatin occupancy across genomic regions and experimental conditions.

Tools and Technologies

Category	Tools
Programming	Python, Bash
Genomic signal analysis	deepTools
Data manipulation	pandas
Data visualization	matplotlib, seaborn
Genomic data formats	BED, BigWig
Reference genome	Saccharomyces cerevisiae (sacCer3)

Repository Structure

The repository currently contains analysis scripts for different components of the project.

A planned organization is:

Fun30-project/
│
├── README.md
├── LICENSE
│
├── scripts/
│   ├── chipseq_analysis/
│   ├── replicate_analysis/
│   ├── chromatin_insulation/
│   └── visualization/
│
├── data/
│
├── results/
│   └── figures/
│
└── docs/

Installation

Clone the repository:

git clone https://github.com/ssh-arma/Fun30-project.git
cd Fun30-project

Install the Python dependencies:

pip install pandas matplotlib seaborn

Install deepTools using Conda:

conda create -n fun30-analysis -c conda-forge -c bioconda deeptools pandas matplotlib seaborn
conda activate fun30-analysis

Usage

The repository contains scripts for genomic signal analysis, replicate comparisons, chromatin insulation analysis, and visualization.

The workflows require appropriate ChIP-seq signal tracks, genomic annotations, and other experiment-specific input files.

Some scripts contain HPC-specific file paths and require modification before execution in a different computational environment.

Detailed execution instructions will be added as the analysis scripts are standardized.

Results and Outputs

The computational analyses generate outputs such as:

* Fun30 and Brn1 genomic occupancy profiles.
* Heatmaps of protein enrichment across selected genomic regions.
* Average ChIP-seq signal profiles.
* Comparisons of enrichment across divergent, convergent, and tandem intergenic regions.
* Chromatin insulation measurements and visualizations.

These analyses are intended to help characterize how Fun30 and condensin-associated chromatin organization differ across cellular conditions.

Scientific Significance

Chromatin remodeling and condensin activity are important regulators of genome organization.

Investigating Fun30-associated changes in Brn1 occupancy and chromatin insulation may provide insights into the molecular mechanisms that regulate chromosome organization during quiescence.

By integrating genomic signal analysis with chromatin organization measurements, this project contributes to understanding the relationship between ATP-dependent chromatin remodeling and higher-order genome structure.

Project Status

Research analysis and documentation in progress.

The repository contains computational analyses developed for a research project investigating Fun30 and condensin-mediated chromatin organization.

Scripts are being organized and documented to improve readability, portability, and reproducibility.

Author

Shubhangi Sharma

Computational Chemistry | Computational Biology

The Ohio State University

GitHub: ssh-arma
