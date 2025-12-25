computeMatrix reference-point \
  -S /fs/ess/PAS2675/Shubhangi/FASTQ/7158/SC136_7158_Q_log2ratio.bw \
     /fs/ess/PAS2675/Shubhangi/FASTQ/brn1/brn1_q_6619_log2ratio.bw \
     /fs/ess/PAS2675/Shubhangi/FASTQ/brn1/brn1_q_6619_rep2_log2ratio.bw \
     /fs/ess/PAS2675/Shubhangi/FASTQ/brn1/brn1_q_6619_6620_log2ratio.bw \
     /fs/ess/PAS2675/Shubhangi/FASTQ/brn1/brn1_q_6620_log2ratio.bw \
  -R sacCer3.intergenic.divergent.bed \
  -a 1000 -b 1000 \
  --skipZeros \
  -out q_7158_fun30_brn1_divergent_gene_matrix.gz

(chip_brd1_sgr_pipeline) [shubhangi@cardinal-login03 FASTQ]$ computeMatrixOperations info -m q_7158_fun30_brn1_divergent_gene_matrix.gz
Groups:
        genes
Samples:
        SC136_7158_Q_log2ratio
        brn1_6619_log2ratio
        brn1_6619_rep2_log2ratio
        brn1_6619_6620_log2ratio
        brn1_6620_log2ratio

plotHeatmap -m q_7158_fun30_brn1_divergent_gene_matrix.gz \
  -out q_7158_fun30_brn1_divergent_gene_heatmap.png \
  --heatmapHeight 16 --heatmapWidth 5 \
  --samplesLabel "fun30_7158_Q" "brn1_6619_Q" "brn1_6619_rep2_Q" "brn1_6619_6620_Q" "brn1_6620_Q" 

##kmer clustering: 
plotHeatmap -m q_7158_fun30_brn1_divergent_gene_matrix.gz \
  -out q_7158_fun30_brn1_divgenes_heatmap_kmeans.png \
  --heatmapWidth 8 \
  --heatmapHeight 30 \
  --kmeans 4 \
  --outFileSortedRegions q_7158_fun30_brn1_sorted_genes.bed
-----------------------------------------------------------------------

##fun30 x brn1 div, conv and tandem:
#divergent
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

#convergent
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

#tandem
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
