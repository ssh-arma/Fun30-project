(chip_pipeline_deeptools) [shubhangi@cardinal-login02 fun30 (7157_final & 7158)]$ computeMatrix reference-point \
  -S FUN30_Log_combined_log2ratio.bw FUN30_Q_combined_log2ratio.bw \
  -R /fs/ess/PAS2675/annotation_files/yeast_annotations/sacCer3.intergenic.divergent.bed \
  -a 1000 -b 1000 \
  -o FUN30_divergent_matrix.gz \
  --outFileNameMatrix FUN30_divergent_matrix.tab
computeMatrix reference-point \
  -S FUN30_Log_combined_log2ratio.bw FUN30_Q_combined_log2ratio.bw \
  -R /fs/ess/PAS2675/annotation_files/yeast_annotations/sacCer3.intergenic.tandem.bed \
  -a 1000 -b 1000 \
  -o FUN30_tandem_matrix.gz \
  --outFileNameMatrix FUN30_tandem_matrix.tab
computeMatrix reference-point \
  -S FUN30_Log_combined_log2ratio.bw FUN30_Q_combined_log2ratio.bw \
  -R /fs/ess/PAS2675/annotation_files/yeast_annotations/sacCer3.intergenic.convergent.bed \
  -a 1000 -b 1000 \
  -o FUN30_convergent_matrix.gz \
  --outFileNameMatrix FUN30_convergent_matrix.tab

(chip_pipeline_deeptools) [shubhangi@cardinal-login02 fun30 (7157_final & 7158)]$ python
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load a matrix and tag with region type
def load_matrix(filepath, region_type):
    df = pd.read_csv(filepath, sep='\t', comment='@', skiprows=1, low_memory=False)
    df['Region_Type'] = region_type
    return df

# Load all files
df_conv = load_matrix("FUN30_convergent_matrix.tab", "Convergent")
df_divg = load_matrix("FUN30_divergent_matrix.tab", "Divergent")
df_tand = load_matrix("FUN30_tandem_matrix.tab", "Tandem")

# Combine
df_all = pd.concat([df_conv, df_divg, df_tand], ignore_index=True)

# Drop first column if it's a label or junk
if df_all.columns[0].lower().startswith('bin') or "label" in df_all.columns[0].lower():
    df_all = df_all.iloc[:, 1:]

# Get number of bins per sample
num_bins = int((df_all.shape[1] - 1) / 2)  # -1 for region_type col

# Define per sample columns
sample1_cols = df_all.columns[:num_bins]
sample2_cols = df_all.columns[num_bins:-1]  # exclude 'Region_Type'

# Melt for long format
def melt_sample(df, cols, label):
    df_melted = df[cols].copy()
    df_melted['Sample'] = label
    df_melted['Region_Type'] = df['Region_Type']
    return df_melted.melt(id_vars=["Sample", "Region_Type"], var_name="Bin", value_name="Signal")

df_long1 = melt_sample(df_all, sample1_cols, "FUN30_Log")
df_long2 = melt_sample(df_all, sample2_cols, "FUN30_Q")

df_long = pd.concat([df_long1, df_long2], ignore_index=True)

# Convert Signal to numeric safely
df_long["Signal"] = pd.to_numeric(df_long["Signal"], errors="coerce")

# ------------------ BOXPLOT ------------------
#average signal per region: distribution of mean signal values (likely averaged across the region) per intergenic region within each category (Convergent, Divergent, Tandem), split by sample (FUN30_Log and FUN30_Q).
plt.figure(figsize=(10, 6))
sns.boxplot(data=df_long, x="Region_Type", y="Signal", hue="Sample", palette="Set2", showfliers=False)
plt.title("FUN30 Signal Distribution in Intergenic Regions")
plt.xlabel("Region Type")
plt.ylabel("Mean log2 ratio signal")

# Move legend outside the plot
plt.legend(title="Sample", bbox_to_anchor=(1.05, 1), loc='upper left')
plt.tight_layout()
plt.savefig("FUN30_boxplot_nooutliers.png", dpi=300, bbox_inches='tight')
plt.close()

# ------------------ LINE PLOT ------------------
#Mean signal per region type per sample
df_mean = df_long.groupby(["Region_Type", "Sample"], as_index=False)["Signal"].mean()
plt.figure(figsize=(10, 6))
sns.lineplot(data=df_mean, x="Region_Type", y="Signal", hue="Sample", marker="o", palette="Set2")
plt.title("FUN30 Signal (Average per Region Type)")
plt.xlabel("Region Type")
plt.ylabel("Mean log2 ratio signal")
plt.tight_layout()
plt.savefig("FUN30_lineplot.png", dpi=300)
plt.close()

##for visualizing peaks and div, conv and tandem genes, ratio bw files are better:
 (chip_pipeline_deeptools) [shubhangi@cardinal-login01 fun30]$  bigwigCompare \
  -b1 FUN30_Log_IP.bw \
  -b2 FUN30_Log_IN.bw \
  --operation ratio \
  --binSize 10 \
  -o FUN30_Log_ratio.bw
bigwigCompare \
  -b1 FUN30_Q_IP.bw \
  -b2 FUN30_Q_IN.bw \
  --operation ratio \
  --binSize 10 \
  -o FUN30_Q_ratio.bigwigCompare
#in brn1_final:
bigwigCompare \
  -b1 BRN1_Log_IP.bw \
  -b2 BRN1_Log_IN.bw \
  --operation ratio \
  --binSize 10 \
  -o BRN1_Log_ratio.bw 							
bigwigCompare \
  -b1 BRN1_Q_IP.bw \
  -b2 BRN1_Q_IN.bw \
  --operation ratio \
  --binSize 10 \
  -o BRN1_Q_ratio.bw
