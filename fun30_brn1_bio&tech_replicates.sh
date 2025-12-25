computeMatrix reference-point \
  -S /fs/ess/PAS2675/Shubhangi/FASTQ/fun30/FUN30_Q_log2ratio.bw \
     /fs/ess/PAS2675/Shubhangi/FASTQ/brn1_final/BRN1_Q_log2ratio.bw \
  -R /fs/ess/PAS2675/Shubhangi/FASTQ/GSE95556_Sc.cerevisiae.feature.anno_Steinmetz_2013_1.gtf \
  -a 1000 -b 1000 \
  -o fun30_brn1_q_gtf_matrix.gz

plotHeatmap -m fun30_brn1_q_gtf_matrix.gz \
  -out fun30_brn1_q_gtf_heatmap.png \
  --samplesLabel "FUN_30" "BRN1_Q" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15

#kmer clustering:
plotHeatmap -m fun30_brn1_q_gtf_matrix.gz \
  -out fun30_brn1_q_gtf_heatmap_kmeans.png \
  --heatmapWidth 10 \
  --heatmapHeight 15 \
  --kmeans 4 \
  --samplesLabel "FUN30_Q" "BRN1_Q" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066"


##fun30 x brn1 div, conv and tandem:
#divergent: Q
computeMatrix reference-point \
  -S /fs/ess/PAS2675/Shubhangi/FASTQ/fun30/FUN30_Q_log2ratio.bw \
     /fs/ess/PAS2675/Shubhangi/FASTQ/brn1_final/BRN1_Q_log2ratio.bw \
  -R sacCer3.intergenic.divergent.bed \
  -a 1000 -b 1000 \
  -o q_fun30_brn1_biolrep_divergent_gene_matrix.gz 
computeMatrixOperations info -m q_fun30_brn1_biolrep_divergent_gene_matrix.gz 
plotHeatmap -m q_fun30_brn1_biolrep_divergent_gene_matrix.gz \
  -out q_fun30_brn1_biolrep_divergent_gene_heatmap.png \
  --samplesLabel "FUN30_Q" "BRN1_Q" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15  
#kmer clustering:
plotHeatmap -m q_fun30_brn1_biolrep_divergent_gene_matrix.gz \
  -out q_fun30_brn1_biolrep_divergent_gene_heatmap_kmeans.png \
  --heatmapWidth 10 \
  --heatmapHeight 15 \
  --kmeans 4 \
  --samplesLabel "FUN30_Q" "BRN1_Q" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066"

#Convergent genes
computeMatrix reference-point \
  -S /fs/ess/PAS2675/Shubhangi/FASTQ/fun30/FUN30_Q_log2ratio.bw \
     /fs/ess/PAS2675/Shubhangi/FASTQ/brn1_final/BRN1_Q_log2ratio.bw \
  -R sacCer3.intergenic.convergent.bed \
  -a 1000 -b 1000 \
  -o q_fun30_brn1_biolrep_convergent_gene_matrix.gz 
computeMatrixOperations info -m q_fun30_brn1_biolrep_convergent_gene_matrix.gz 
plotHeatmap -m q_fun30_brn1_biolrep_convergent_gene_matrix.gz \
  -out q_fun30_brn1_biolrep_convergent_gene_heatmap.png \
  --samplesLabel "FUN30_Q" "BRN1_Q" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15
#kmer clustering:
plotHeatmap -m q_fun30_brn1_biolrep_convergent_gene_matrix.gz \
  -out q_fun30_brn1_biolrep_convergent_gene_heatmap_kmeans.png \
  --heatmapWidth 10 \
  --heatmapHeight 15 \
  --kmeans 4 \
  --samplesLabel "FUN30_Q" "BRN1_Q" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066"

#Tandem genes
computeMatrix reference-point \
  -S /fs/ess/PAS2675/Shubhangi/FASTQ/fun30/FUN30_Q_log2ratio.bw \
     /fs/ess/PAS2675/Shubhangi/FASTQ/brn1_final/BRN1_Q_log2ratio.bw \
  -R sacCer3.intergenic.tandem.bed \
  -a 1000 -b 1000 \
  -o q_fun30_brn1_biolrep_tandem_gene_matrix.gz 
computeMatrixOperations info -m q_fun30_brn1_biolrep_tandem_gene_matrix.gz 
plotHeatmap -m q_fun30_brn1_biolrep_tandem_gene_matrix.gz \
  -out q_fun30_brn1_biolrep_tandem_gene_heatmap.png \
  --samplesLabel "FUN30_Q" "BRN1_Q" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15
#kmer clustering:
plotHeatmap -m q_fun30_brn1_biolrep_tandem_gene_matrix.gz \
  -out q_fun30_brn1_biolrep_tandem_gene_heatmap_kmeans.png \
  --heatmapWidth 10 \
  --heatmapHeight 15 \
  --kmeans 4 \
  --samplesLabel "FUN30_Q" "BRN1_Q" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066"


#METAPLOTS OF DIV, CONV, AND TANDEM GENES IN LOG AND Q SAMPLES
#divergent
computeMatrix reference-point \
  -S FUN30_Log_log2ratio.bw FUN30_Q_log2ratio.bw \
  -R sacCer3.intergenic.divergent.bed \
  -a 1000 -b 1000 \
  -o fun30_divergent_matrix.gz \
  --outFileNameMatrix fun30_divergent_matrix.tab \
  --samplesLabel "FUN30_Log" "FUN30_Q"
plotProfile -m fun30_divergent_matrix.gz \
  -out fun30_log_q_divergentprofile_overlay.png \
  --plotTitle "FUN30 Signal at Divergent Genes" \
  --samplesLabel "Log" "Q" \
  --legendLocation upper-right \
  --plotType lines \
  --perGroup
computeMatrix reference-point \
  -S BRN1_Log_log2ratio.bw BRN1_Q_log2ratio.bw \
  -R sacCer3.intergenic.divergent.bed \
  -a 1000 -b 1000 \
  -o brn1_divergent_matrix.gz \
  --outFileNameMatrix brn1_divergent_matrix.tab \
  --samplesLabel "BRN1_Log" "BRN1_Q"
plotProfile -m brn1_divergent_matrix.gz \
  -out brn1_log_q_divergentprofile_overlay.png \
  --plotTitle "BRN1 Signal at Divergent Genes" \
  --samplesLabel "Log" "Q" \
  --legendLocation upper-right \
  --plotType lines \
  --perGroup

#convergent
computeMatrix reference-point \
  -S FUN30_Log_log2ratio.bw FUN30_Q_log2ratio.bw \
  -R sacCer3.intergenic.convergent.bed \
  -a 1000 -b 1000 \
  -o fun30_convergent_matrix.gz \
  --outFileNameMatrix fun30_convergent_matrix.tab \
  --samplesLabel "FUN30_Log" "FUN30_Q"
plotProfile -m fun30_convergent_matrix.gz \
  -out fun30_log_q_convergentprofile_overlay.png \
  --plotTitle "FUN30 Signal at Convergent Genes" \
  --samplesLabel "Log" "Q" \
  --legendLocation upper-right \
  --plotType lines \
  --perGroup
computeMatrix reference-point \
  -S BRN1_Log_log2ratio.bw BRN1_Q_log2ratio.bw \
  -R sacCer3.intergenic.convergent.bed \
  -a 1000 -b 1000 \
  -o brn1_convergent_matrix.gz \
  --outFileNameMatrix brn1_convergent_matrix.tab \
  --samplesLabel "BRN1_Log" "BRN1_Q"
plotProfile -m brn1_convergent_matrix.gz \
  -out brn1_log_q_convergentprofile_overlay.png \
  --plotTitle "BRN1 Signal at Convergent Genes" \
  --samplesLabel "Log" "Q" \
  --legendLocation upper-right \
  --plotType lines \
  --perGroup

#tandem
computeMatrix reference-point \
  -S FUN30_Log_log2ratio.bw FUN30_Q_log2ratio.bw \
  -R sacCer3.intergenic.tandem.bed \
  -a 1000 -b 1000 \
  -o fun30_tandem_matrix.gz \
  --outFileNameMatrix fun30_tandem_matrix.tab \
  --samplesLabel "FUN30_Log" "FUN30_Q"
plotProfile -m fun30_tandem_matrix.gz \
  -out fun30_log_q_tandemprofile_overlay.png \
  --plotTitle "FUN30 Signal at Tandem Genes" \
  --samplesLabel "Log" "Q" \
  --legendLocation upper-right \
  --plotType lines \
  --perGroup

computeMatrix reference-point \
  -S BRN1_Log_log2ratio.bw BRN1_Q_log2ratio.bw \
  -R sacCer3.intergenic.tandem.bed \
  -a 1000 -b 1000 \
  -o brn1_tandem_matrix.gz \
  --outFileNameMatrix brn1_tandem_matrix.tab \
  --samplesLabel "BRN1_Log" "BRN1_Q"
plotProfile -m brn1_tandem_matrix.gz \
  -out brn1_log_q_tandemprofile_overlay.png \
  --plotTitle "BRN1 Signal at Tandem Genes" \
  --samplesLabel "Log" "Q" \
  --legendLocation upper-right \
  --plotType lines \
  --perGroup


#GO analysis for fun30xbrn1_biolreplicates

#to check structure: 
(chip_brn1_pipeline) [shubhangi@cardinal-login03 fun30xbrn1_bioreps]$ head -n 2 fun30_brn1_q_gtf_sorted_genes.bed #this file was created from kmer clustering
##chrom	start	end	name	score	strand	thickStart	thickEnd	itemRGB	blockCount	blockSizes	blockStart	deepTools_group
#chrXV	986719	988797	YOR348C	.	-	986719	988797	0	1	2078	986710	cluster_1
awk '{print > ($13 ".txt")}' fun30_brn1_q_gtf_sorted_genes.bed
#This will create: cluster_1.txt, cluster_2.txt, cluster_3.txt and cluster_4.txt

#$7: column 7, which is the cluster number.
#Cluster$7.txt: Dynamically names the output file (e.g., Cluster1.txt, Cluster2.txt, etc.)
#print > (...): Writes each line into the appropriate file.

#extract gene names (column 4) from each cluster_X.txt file
cut -f4 cluster_1.txt > cluster_1_genes.txt
cut -f4 cluster_2.txt > cluster_2_genes.txt
cut -f4 cluster_3.txt > cluster_3_genes.txt
cut -f4 cluster_4.txt > cluster_4_genes.txt #i was having trouble submitting cluster_4_genes.txt to yeastgenome.org (an alias for a gene exists so it was cause confusion for tool)... so i replaced YFL057C gene's name with its sgd id: "SGDID: S000001837"
#now upload these genes.txt files (e.g., cluster_1_genes.txt) to YeastGenome.org GO Slim Mapper for enrichment analysis.

#plotting using R: go_cluster_dotplot.png: bash script: run_go_enrichment.sh
'''
	•	Database used: Full Gene Ontology (GO) via org.Sc.sgd.db
	•	Ontology: “BP” (Biological Process) covers all annotated GO terms.
	•	Results: Shows all enriched GO terms, including very specific, granular terms.
	•	Filtering: adjusted p-value cutoffs which filters for significance.
'''
#1. Load necessary libraries ---
library(clusterProfiler)
library(org.Sc.sgd.db)
library(dplyr)
library(ggplot2)

#2. Define gene list files for each cluster ---
cluster_files <- list(
  "Cluster 1" = "cluster_1_genes.txt",
  "Cluster 2" = "cluster_2_genes.txt",
  "Cluster 3" = "cluster_3_genes.txt",
  "Cluster 4" = "cluster_4_genes.txt"
)

#3. Initialize list to hold enrichment results ---
cluster_enrichments <- list()

#4. Perform GO enrichment for each cluster ---
for (name in names(cluster_files)) {
  genes <- scan(cluster_files[[name]], what = "", quiet = TRUE) #what = "" tells scan() to read the file as a character vector 
  
  entrez_ids <- mapIds(
    org.Sc.sgd.db,
    keys = genes,
    column = "ENTREZID",
    keytype = "ORF",
    multiVals = "first"
  )
  entrez_ids <- na.omit(entrez_ids)

  ego <- enrichGO(
    gene = entrez_ids,
    OrgDb = org.Sc.sgd.db,
    ont = "BP",
    pvalueCutoff = 0.05,
    qvalueCutoff = 0.05,
    pAdjustMethod = "BH" #Benjamini-Hochberg multiple testing correction method to control the FDR
  )

  cluster_enrichments[[name]] <- ego
}

# Combine top 5 GO terms from each cluster
combined_top <- do.call(rbind, lapply(names(cluster_enrichments), function(name) {
  ego <- cluster_enrichments[[name]]
  df <- as.data.frame(ego)

  if (nrow(df) == 0) return(NULL)  # skip if no results

  df <- df |>
    dplyr::slice_head(n = 5) |>
    dplyr::mutate(Cluster = name)
  return(df)
}))

# Plot the Dot Plot
p <- ggplot(combined_top, aes(x = Cluster, y = Description)) +
  geom_point(aes(size = Count, color = p.adjust)) +
  scale_color_gradient(low = "red", high = "blue", name = "Adjusted p-value") +
  scale_size(range = c(3, 10), name = "Gene Count") +
  labs(
    title = "Top GO Biological Processes per Cluster",
    x = "Cluster",
    y = "GO Term"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    axis.text.y = element_text(size = 10),
    legend.position = "right"
  )

# Save
ggsave("go_cluster_dotplot_cutoff.png", plot = p, width = 10, height = 6, dpi = 300)

---------------------------------------------
#fun30xbrn1_pca: merging technical repliactes
#merge brn1 6619  and 6610 rep2 samples ; and 6620 … get rid of 6619_6620: for both log & q
cat \
  brn1_log_6619_anti-Myc_IP.fastq \
  brn1_log_6619_rep2_anti-Myc_IP.fastq \
  > BRN1_6619_Log_IP_techreps_merged.fastq

cat \
  brn1_log_6619_IN.fastq \
  brn1_log_6619_rep2_IN.fastq \
  > BRN1_6619_Log_IN_techreps_merged.fastq 

cat \
  brn1_q_6619_anti-Myc_IP.fastq \
  brn1_q_6619_rep2_anti-Myc_IP.fastq \
  > BRN1_6619_Q_IP_techreps_merged.fastq

cat \
  brn1_q_6619_IN.fastq \
  brn1_q_6619_rep2_IN.fastq \
  > BRN1_6619_Q_IN_techreps_merged.fastq

mv brn1_log_6620_IN.fastq BRN1_6620_Log_ANTI-MYC_IP_un_merged.fastq 
mv brn1_log_6620_anti-Myc_IP.fastq BRN1_6620_Log_IN_un_merged.fastq 
mv brn1_q_6620_anti-Myc_IP.fastq  BRN1_6620_Q_ANTI-MYC_IP_un_merged.fastq
mv brn1_q_6620_IN.fastq BRN1_6620_Q_IN_un_merged.fastq

rm brn1_*6619_6620*.fastq
(chip_pipeline) [shubhangi@cardinal-login02 fun30xbrn1_pca]$ ls *merged.fastq
7157_Log_IN_merged.fastq
7157_Log_IP_merged.fastq
7157_Q_IN_merged.fastq
7157_Q_IP_merged.fastq
BRN1_6619_Log_IN_techreps_merged.fastq
BRN1_6619_Log_IP_techreps_merged.fastq
BRN1_6619_Q_IN_techreps_merged.fastq
BRN1_6619_Q_IP_techreps_merged.fastq
BRN1_6620_Log_ANTI-MYC_IP_un_merged.fastq
BRN1_6620_Log_IN_un_merged.fastq
BRN1_6620_Q_ANTI-MYC_IP_un_merged.fastq
BRN1_6620_Q_IN_un_merged.fastq
SC136_7158_210_inp_GCACACAA_R1_merged.fastq
SC136_7158_210_IP_AACTTGCC_R1_merged.fastq
SC136_7158_Q_inp_AACTCGGA_R1_merged.fastq
SC136_7158_Q_IP_ACTCCTAC_R1_merged.fastq

sbatch -A pas2675 -p batch -c 8 alignment_to_creating_bw.sh
squeue -u shubhangi #to check if pipeline still running

conda activate chip_pipeline_deeptools
for file in *_dedup.bam; do     base=$(basename "$file" _dedup.bam);     bamCoverage --bam "$file" --outFileName "${base}.bw" --outFileFormat bigwig --normalizeUsing RPKM --binSize 10; done

(chip_pipeline_deeptools) [shubhangi@cardinal-login02 fun30xbrn1_pca]$ ls *.bw
7157_Log_IN.bw                BRN1_6620_Log_ANTI-MYC_IP_un.bw
7157_Log_IP.bw                BRN1_6620_Log_IN_un.bw
7157_Q_IN.bw                  BRN1_6620_Q_ANTI-MYC_IP_un.bw
7157_Q_IP.bw                  BRN1_6620_Q_IN_un.bw
BRN1_6619_Log_IN_techreps.bw  SC136_7158_210_inp_GCACACAA_R1.bw
BRN1_6619_Log_IP_techreps.bw  SC136_7158_210_IP_AACTTGCC_R1.bw
BRN1_6619_Q_IN_techreps.bw    SC136_7158_Q_inp_AACTCGGA_R1.bw
BRN1_6619_Q_IP_techreps.bw    SC136_7158_Q_IP_ACTCCTAC_R1.bw

(chip_pipeline) [shubhangi@cardinal-login04 7157_Christine_new]$ conda activate chip_brd1_sgr_pipeline

multiBigwigSummary bins \
  -b 7157_Log_log2ratio.bw \
     7157_Q_log2ratio.bw \
     7158_Log_log2ratio.bw \
     7158_Q_log2ratio.bw \
     BRN1_6619_Log_log2ratio.bw \
     BRN1_6619_Q_log2ratio.bw \
     BRN1_6620_Log_log2ratio.bw \
     BRN1_6620_Q_log2ratio.bw \
  --binSize 1000 \
  -out fun30_brn1_techreps_counts.npz \
  --outRawCounts fun30_brn1_techreps_counts.tab

plotPCA -in fun30_brn1_techreps_counts.npz \
  -o fun30_brn1_techreps_PCA_plot.png \
  --plotTitle "PCA (technical replicates) - FUN30 & BRN1 log & Q samples"

##FUN30 WT AND DEL
#There was an error with one read in 7469_1stG1_IP_H3 so to fix that:
#awk to clean a potentially corrupted FASTQ file by ensuring that each read entry has equal-length sequence and quality score strings
(chip_pipeline) [shubhangi@cardinal-login01 H3_stuff]$ awk '{
  header = $0;           # Line 1: read ID (starts with @)
  getline seq;           # Line 2: DNA sequence
  getline plus;          # Line 3: just a '+' line
  getline qual;          # Line 4: quality string

  if (length(seq) == length(qual)) {
    print header; print seq; print plus; print qual;
  }
}' 7469_1stG1_IP_H3_merged.fastq > 7469_1stG1_IP_H3_cleaned.fastq

wc -l 7469_1stG1_IP_H3_cleaned.fastq
#Reports how many lines are in the cleaned FASTQ file

mv 7469_1stG1_IP_H3_cleaned.fastq 7469_1stG1_IP_H3_merged.fastq

bash alignment_to_creating_bw.sh

(chip_pipeline_deeptools) [shubhangi@cardinal-login02 H3_stuff]$ ls *.bw
7469_1stG1_IN_H3.bw  7470_Q_IN_H3.bw      CCY09_1stG1_IN_H3_S21_R1_001.bw
7469_1stG1_IP_H3.bw  7470_Q_IP_H3.bw      CCY09_1stG1_IP_H3_S29_R1_001.bw
7469_Q_IN_H3.bw      7562_1stG1_IN_H3.bw  CCY09_Q_IN_H3_S17_R1_001.bw
7469_Q_IP_H3.bw      7562_1stG1_IP_H3.bw  CCY09_Q_IP_H3_S25_R1_001.bw
7470_1stG1_IN_H3.bw  7562_Q_IN_H3.bw
7470_1stG1_IP_H3.bw  7562_Q_IP_H3.bw

#group them: 
# WT
7562_1stG1_IN_H3.bw
7562_1stG1_IP_H3.bw
7562_Q_IN_H3.bw
7562_Q_IP_H3.bw
CCY09_1stG1_IN_H3_S21_R1_001.bw
CCY09_1stG1_IP_H3_S29_R1_001.bw
CCY09_Q_IN_H3_S17_R1_001.bw
CCY09_Q_IP_H3_S25_R1_001.bw

# fun30∆
7469_1stG1_IN_H3.bw
7469_1stG1_IP_H3.bw
7469_Q_IN_H3.bw
7469_Q_IP_H3.bw
7470_1stG1_IN_H3.bw
7470_1stG1_IP_H3.bw
7470_Q_IN_H3.bw
7470_Q_IP_H3.bw

bigwigCompare \
  -b1 7469_1stG1_IP_H3.bw \
  -b2 7469_1stG1_IN_H3.bw \
  --operation log2 \
  --binSize 10 \
  -o fun30_del_log_7469_1stG1_H3_log2ratio.bw

bigwigCompare \
  -b1 7470_1stG1_IP_H3.bw \
  -b2 7470_1stG1_IN_H3.bw \
  --operation log2 \
  --binSize 10 \
  -o fun30_del_log_7470_1stG1_H3_log2ratio.bw

bigwigCompare \
  -b1 7470_Q_IP_H3.bw \
  -b2 7470_Q_IN_H3.bw \
  --operation log2 \
  --binSize 10 \
  -o fun30_del_Q_7470_H3_log2ratio.bw

bigwigCompare \
  -b1 7469_Q_IP_H3.bw \
  -b2 7469_Q_IN_H3.bw \
  --operation log2 \
  --binSize 10 \
  -o fun30_del_Q_7469_H3_log2ratio.bw

bigwigCompare \
  -b1 7562_1stG1_IP_H3.bw \
  -b2 7562_1stG1_IN_H3.bw \
  --operation log2 \
  --binSize 10 \
  -o fun30_wt_log_7562_1stG1_H3_log2ratio.bw

bigwigCompare \
  -b1 7562_Q_IP_H3.bw \
  -b2 7562_Q_IN_H3.bw \
  --operation log2 \
  --binSize 10 \
  -o fun30_wt_Q_7562_H3_log2ratio.bw

bigwigCompare \
  -b1 CCY09_Q_IP_H3_S25_R1_001.bw \
  -b2 CCY09_Q_IN_H3_S17_R1_001.bw \
  --operation log2 \
  --binSize 10 \
  -o fun30_wt_Q_CCY09_H3_log2ratio.bw

bigwigCompare \
  -b1 CCY09_1stG1_IP_H3_S29_R1_001.bw \
  -b2 CCY09_1stG1_IN_H3_S21_R1_001.bw \
  --operation log2 \
  --binSize 10 \
  -o fun30_wt_log_CCY09_1stG_H3_log2ratio.bw



(chip_pipeline_deeptools) [shubhangi@cardinal-login02 H3_stuff]$ ls *log2ratio.bw
fun30_del_log_7469_1stG1_H3_log2ratio.bw
fun30_del_log_7470_1stG1_H3_log2ratio.bw
fun30_del_Q_7469_H3_log2ratio.bw
fun30_del_Q_7470_H3_log2ratio.bw
fun30_wt_log_7562_1stG1_H3_log2ratio.bw
fun30_wt_log_CCY09_1stG_H3_log2ratio.bw
fun30_wt_Q_7562_H3_log2ratio.bw
fun30_wt_Q_CCY09_H3_log2ratio.bw

computeMatrix reference-point \
  -S fun30_del_log_7469_1stG1_H3_log2ratio.bw fun30_del_log_7470_1stG1_H3_log2ratio.bw \
  -R /fs/ess/PAS2675/Shubhangi/FASTQ/GSE95556_Sc.cerevisiae.feature.anno_Steinmetz_2013_1.gtf \
  -b 1000 -a 1000 \
  -out fun30_del_log_gtf_matrix.gz

computeMatrix reference-point \
  -S fun30_del_Q_7469_H3_log2ratio.bw fun30_del_Q_7470_H3_log2ratio.bw \
  -R /fs/ess/PAS2675/Shubhangi/FASTQ/GSE95556_Sc.cerevisiae.feature.anno_Steinmetz_2013_1.gtf \
  -b 1000 -a 1000 \
  -out fun30_del_q_gtf_matrix.gz

computeMatrix reference-point \
  -S fun30_wt_log_7562_1stG1_H3_log2ratio.bw fun30_wt_log_CCY09_1stG_H3_log2ratio.bw \
  -R /fs/ess/PAS2675/Shubhangi/FASTQ/GSE95556_Sc.cerevisiae.feature.anno_Steinmetz_2013_1.gtf \
  -b 1000 -a 1000 \
  -out fun30_wt_log_gtf_matrix.gz

computeMatrix reference-point \
  -S fun30_wt_Q_7562_H3_log2ratio.bw fun30_wt_Q_CCY09_H3_log2ratio.bw \
  -R /fs/ess/PAS2675/Shubhangi/FASTQ/GSE95556_Sc.cerevisiae.feature.anno_Steinmetz_2013_1.gtf \
  -b 1000 -a 1000 \
  -out fun30_wt_q_gtf_matrix.gz


plotHeatmap -m fun30_del_log_gtf_matrix.gz \
  -out fun30_del_log_gtf_heatmap.png \
  --samplesLabel "FUN30Δ Log 7469" "FUN30Δ Log 7470" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15
plotHeatmap -m fun30_del_q_gtf_matrix.gz \
  -out fun30_del_q_gtf_heatmap.png \
  --samplesLabel "FUN30Δ Q 7469" "FUN30Δ Q 7470" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15
plotHeatmap -m fun30_wt_log_gtf_matrix.gz \
  -out fun30_wt_log_gtf_heatmap.png \
  --samplesLabel "FUN30 WT Log 7562 " "FUN30 WT Log CCY09" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15
plotHeatmap -m fun30_wt_q_gtf_matrix.gz \
  -out fun30_wt_q_gtf_heatmap.png \
  --samplesLabel "FUN30 WT Q 7562 " "FUN30 WT Q CCY09" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15

#kmer clustering:
plotHeatmap -m fun30_del_log_gtf_matrix.gz \
  -out fun30_del_log_gtf_kmeans.png \
  --samplesLabel "FUN30Δ Log 7469" "FUN30Δ Log 7470" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --kmeans 4 \
  --outFileSortedRegions fun30_del_log_gtf_kmeans.tsv \
  --heatmapWidth 10 \
  --heatmapHeight 18
plotHeatmap -m fun30_del_q_gtf_matrix.gz \
  -out fun30_del_q_gtf_kmeans.png \
  --samplesLabel "FUN30Δ Q 7469" "FUN30Δ Q 7470" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --kmeans 4 \
  --outFileSortedRegions fun30_del_q_gtf_kmeans.tsv \
  --heatmapWidth 10 \
  --heatmapHeight 18
plotHeatmap -m fun30_wt_log_gtf_matrix.gz \
  -out fun30_wt_log_gtf_kmeans.png \
  --samplesLabel "FUN30 WT Log 7562 " "FUN30 WT Log CCY09" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --kmeans 4 \
  --outFileSortedRegions fun30_wt_log_gtf_kmeans.tsv \
  --heatmapWidth 10 \
  --heatmapHeight 18
plotHeatmap -m fun30_wt_q_gtf_matrix.gz \
  -out fun30_wt_q_gtf_kmeans.png \
  --samplesLabel "FUN30 WT Q 7562 " "FUN30 WT Q CCY09" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --kmeans 4 \
  --outFileSortedRegions fun30_wt_q_gtf_kmeans.tsv \
  --heatmapWidth 10 \
  --heatmapHeight 18

#to see h3 occupancy:
(chip_pipeline_deeptools) [shubhangi@cardinal-login01 H3_stuff]$ gtf2bed < GSE95556_Sc.cerevisiae.feature.anno_Steinmetz_2013_1.gtf > sacCer3_genes.bed

head fun30_del_log_gtf_kmeans.tsv
#chrom	start	end	name	score	strand	thickStart	thickEnd	itemRGB	blockCount	blockSizes	blockStart	deepTools_group

#Extracting cluster_1 regions from each *_kmeans.tsv file.
#Creating BED files for those regions.
awk '$13 == "cluster_1" { print $1"\t"$2"\t"$3"\t"$4"\t.\t"$6 }' fun30_del_log_gtf_kmeans.tsv > cluster1_fun30_del_log_gtf_genes.bed

#Running computeMatrix using the appropriate log2ratio.bw files.
computeMatrix reference-point \
  -S fun30_del_log_7469_1stG1_H3_log2ratio.bw fun30_del_log_7470_1stG1_H3_log2ratio.bw \
  -R cluster1_fun30_del_log_gtf_genes.bed \
  --referencePoint TSS \
  -b 1000 -a 1000 \
  -out cluster1_fun30_del_log_gtf_matrix.gz

#plotted H3 ChIP log2(IP/Input) around the TSS for each strain/condition:
(chip_pipeline_deeptools) [shubhangi@cardinal-login01 H3_stuff]$ plotHeatmap -m cluster1_fun30_del_log_gtf_matrix.gz \
  -out cluster1_fun30_del_log_gtf_heatmap.png \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15 \
  --samplesLabel "FUN30Δ Log 7469" "FUN30Δ Log 7470"

    ##similarly:
awk '$13 == "cluster_1" { print $1"\t"$2"\t"$3"\t"$4"\t.\t"$6 }' fun30_del_q_gtf_kmeans.tsv > cluster1_fun30_del_q_gtf_genes.bed
computeMatrix reference-point \
  -S fun30_del_Q_7469_H3_log2ratio.bw fun30_del_Q_7470_H3_log2ratio.bw \
  -R cluster1_fun30_del_q_gtf_genes.bed \
  --referencePoint TSS \
  -b 1000 -a 1000 \
  -out cluster1_fun30_del_q_gtf_matrix.gz
plotHeatmap -m cluster1_fun30_del_q_gtf_matrix.gz \
  -out cluster1_fun30_del_q_gtf_heatmap.png \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15 \
  --samplesLabel "FUN30Δ Q 7469" "FUN30Δ Q 7470"

awk '$13 == "cluster_1" { print $1"\t"$2"\t"$3"\t"$4"\t.\t"$6 }' fun30_wt_log_gtf_kmeans.tsv > cluster1_fun30_wt_log_gtf_genes.bed
computeMatrix reference-point \
  -S fun30_wt_log_7562_1stG1_H3_log2ratio.bw fun30_wt_log_CCY09_1stG_H3_log2ratio.bw \
  -R cluster1_fun30_wt_log_gtf_genes.bed \
  --referencePoint TSS \
  -b 1000 -a 1000 \
  -out cluster1_fun30_wt_log_gtf_matrix.gz
plotHeatmap -m cluster1_fun30_wt_log_gtf_matrix.gz \
  -out cluster1_fun30_wt_log_gtf_heatmap.png \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15 \
  --samplesLabel "FUN30 WT Log 7562" "FUN30 WT Log CCY09"

awk '$13 == "cluster_1" { print $1"\t"$2"\t"$3"\t"$4"\t.\t"$6 }' fun30_wt_q_gtf_kmeans.tsv > cluster1_fun30_wt_q_gtf_genes.bed
computeMatrix reference-point \
  -S fun30_wt_Q_7562_H3_log2ratio.bw fun30_wt_Q_CCY09_H3_log2ratio.bw \
  -R cluster1_fun30_wt_q_gtf_genes.bed \
  --referencePoint TSS \
  -b 1000 -a 1000 \
  -out cluster1_fun30_wt_q_gtf_matrix.gz
plotHeatmap -m cluster1_fun30_wt_q_gtf_matrix.gz \
  -out cluster1_fun30_wt_q_gtf_heatmap.png \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15 \
  --samplesLabel "FUN30 WT Q 7562" "FUN30 WT Q CCY09"

##figure 3: brn1_log, brn1_q and fun30_q
computeMatrix reference-point \
  -S /fs/ess/PAS2675/Shubhangi/FASTQ/brn1_final/BRN1_Log_log2ratio.bw \
     /fs/ess/PAS2675/Shubhangi/FASTQ/brn1_final/BRN1_Q_log2ratio.bw \
     /fs/ess/PAS2675/Shubhangi/FASTQ/fun30/FUN30_Q_log2ratio.bw \
  -R /fs/ess/PAS2675/Shubhangi/FASTQ/GSE95556_Sc.cerevisiae.feature.anno_Steinmetz_2013_1.gtf \
  -a 1000 -b 1000 \
  -o fun30_q_brn1_log_q_gtf_matrix.gz
computeMatrixOperations info -m fun30_q_brn1_log_q_gtf_matrix.gz
plotHeatmap -m fun30_q_brn1_log_q_gtf_matrix.gz \
  -out fun30_q_brn1_log_q_gtf_heatmap.png \
  --samplesLabel "BRN1 Log" "BRN1 Q" "FUN30 Q" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15
plotHeatmap -m fun30_q_brn1_log_q_gtf_matrix.gz \
  -out fun30_q_brn1_log_q_gtf_kmeans.png \
  --samplesLabel "BRN1 Log" "BRN1 Q" "FUN30 Q" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --kmeans 4 \
  --heatmapWidth 10 \
  --heatmapHeight 15
computeMatrix reference-point \
  -S /fs/ess/PAS2675/Shubhangi/FASTQ/fun30/FUN30_Log_log2ratio.bw \
     /fs/ess/PAS2675/Shubhangi/FASTQ/fun30/FUN30_Q_log2ratio.bw \
  -R /fs/ess/PAS2675/Shubhangi/FASTQ/GSE95556_Sc.cerevisiae.feature.anno_Steinmetz_2013_1.gtf \
  -a 1000 -b 1000 \
  -o FUN30_gtf_matrix.gz.gz

plotHeatmap -m FUN30_gtf_matrix.gz \
  -out FUN30_gtf_heatmap.png \
  --samplesLabel "FUN30 Log" "FUN30 Q" \
  --colorList "#18007F,#640099,#FFFFFF,#FACD00,#CC0066" \
  --heatmapWidth 10 \
  --heatmapHeight 15
