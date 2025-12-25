i moved sorted.bam files from brn1_final dir and fun30(7157_final & 7158) to Shubhangi /FASTQ /insulation scores_swygert 2019 wt (log&q) /bam files
#technical reps wwere merged earlier
#general procedure for chipseq analysis: 
'''
Align reads (output: .sam): bowtie2 --very-sensitive -p 8 -x genome_index -U $file -S ${base}.sam 
Convert SAM to BAM: `samtools view -bS $file
Remove duplicates (to improve peak calling): samtools rmdup -s $file ${base}_dedup.bam
Convert BAM to BED: bedtools bamtobed -i $file > ${base}.bed
Call peaks to identify genome regions where reads are enriched, indicating protein-DNA binding, histone modifications, or open chromatin: macs2 callpeak -t $file -f BAM -g sacCer3 -n ${base}_peaks --nomodel --extsize 150
Index BAM: samtools index $file
Convert BAM to BigWig & normalizing the coverage using rpkm (to allow visualization): bamCoverage --bam $file --outFileName ${base}.bw --outFileFormat bigwig --normalizeUsing RPKM --binSize 10
'''
#[shubhangi@cardinal-login03 bam files]$ 
module load miniconda3
conda activate chip_pipeline_deeptools

# --- Merge FUN30 Log and Q IP replicates ---
samtools merge -@ 8 FUN30_Log_IP_merged.bam \
    7157_Log_IP_sorted.bam \
    SC136_7158_210_IP_AACTTGCC_R1_sorted.bam
samtools sort -@ 8 -o FUN30_Log_IP_sorted.bam FUN30_Log_IP_merged.bam
samtools index FUN30_Log_IP_sorted.bam

samtools merge -@ 8 FUN30_Q_IP_merged.bam \
    7157_Q_IP_sorted.bam \
    SC136_7158_Q_IP_ACTCCTAC_R1_sorted.bam
samtools sort -@ 8 -o FUN30_Q_IP_sorted.bam FUN30_Q_IP_merged.bam
samtools index FUN30_Q_IP_sorted.bam

# --- Merge FUN30 Log and Q Input replicates ---
samtools merge -@ 8 FUN30_Log_IN_merged.bam \
    7157_Log_IN_sorted.bam \
    SC136_7158_210_inp_GCACACAA_R1_sorted.bam
samtools sort -@ 8 -o FUN30_Log_IN_sorted.bam FUN30_Log_IN_merged.bam
samtools index FUN30_Log_IN_sorted.bam

samtools merge -@ 8 FUN30_Q_IN_merged.bam \
    7157_Q_IN_sorted.bam \
    SC136_7158_Q_inp_AACTCGGA_R1_sorted.bam
samtools sort -@ 8 -o FUN30_Q_IN_sorted.bam FUN30_Q_IN_merged.bam
samtools index FUN30_Q_IN_sorted.bam

# --- Merge all FUN30 IPs (4 total) into final combined dataset ---
samtools merge -@ 8 FUN30_IP_merged.bam \
    7157_Log_IP_sorted.bam \
    7157_Q_IP_sorted.bam \
    SC136_7158_210_IP_AACTTGCC_R1_sorted.bam \
    SC136_7158_Q_IP_ACTCCTAC_R1_sorted.bam
samtools sort -@ 8 -o FUN30_IP_merged_sorted.bam FUN30_IP_merged.bam
samtools index FUN30_IP_merged_sorted.bam

# --- Merge all FUN30 Inputs (4 total) ---
samtools merge -@ 8 FUN30_IN_merged.bam \
    7157_Log_IN_sorted.bam \
    7157_Q_IN_sorted.bam \
    SC136_7158_210_inp_GCACACAA_R1_sorted.bam \
    SC136_7158_Q_inp_AACTCGGA_R1_sorted.bam
samtools sort -@ 8 -o FUN30_IN_merged_sorted.bam FUN30_IN_merged.bam
samtools index FUN30_IN_merged_sorted.bam


#for MACS2 peak calling in ChIP-seq, using an Input (IN) control sample alongside your IP (immunoprecipitation) sample is highly recommended and standard practice.
(chip_pipeline_deeptools) [shubhangi@cardinal-login03 bam files]$ sbatch macs2_callpeaks.sh #calling peaks with log and Q 
'''
#!/bin/bash
#SBATCH --job-name=macs2_callpeaks_FUN30_BRN1
#SBATCH --account=PAS2675
#SBATCH --output=logs/macs2_peaks_%j.out
#SBATCH --error=logs/macs2_peaks_%j.err
#SBATCH --time=6:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --partition=cpu
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sharma.1440@osu.edu

# === Environment setup ===
source ~/.bashrc
conda activate chip_pipeline_deeptools   # MACS2 environment
mkdir -p logs

# === Define IP/Input pairs ===
declare -A ip_IN_pairs=(
    ["FUN30_Log_IP_sorted.bam"]="FUN30_Log_IN_sorted.bam"
    ["FUN30_Q_IP_sorted.bam"]="FUN30_Q_IN_sorted.bam"
    ["BRN1_Log_IP_sorted.bam"]="BRN1_Log_IN_sorted.bam"
    ["BRN1_Q_IP_sorted.bam"]="BRN1_Q_IN_sorted.bam"
)

# === Create output folder ===
mkdir -p macs2_peaks_FUN30_BRN1

# === Run MACS2 peak calling ===
for ip in "${!ip_IN_pairs[@]}"; do
    IN="${ip_IN_pairs[$ip]}"
    base=$(basename "$ip" _sorted.bam)
    outdir="macs2_peaks_FUN30_BRN1/${base}"
    mkdir -p "$outdir"

    if [ -f "$IN" ]; then
        echo "Calling peaks for IP: $ip vs IN: $IN"

        # --- Narrow peaks ---
        macs2 callpeak \
            -t "$ip" \
            -c "$IN" \
            -f BAM \
            -g 1.2e7 \
            -n "${base}_narrow" \
            --outdir "$outdir/narrow" \
            --nomodel --extsize 150 -q 0.01

        # --- Broad peaks ---
        macs2 callpeak \
            -t "$ip" \
            -c "$IN" \
            -f BAM \
            -g 1.2e7 \
            -n "${base}_broad" \
            --outdir "$outdir/broad" \
            --broad --broad-cutoff 0.1 \
            --nomodel --extsize 150

    else
        echo " Input file $IN not found — calling peaks on IP only."

        # --- Narrow peaks (no input) ---
        macs2 callpeak \
            -t "$ip" \
            -f BAM \
            -g 1.2e7 \
            -n "${base}_narrow" \
            --outdir "$outdir/narrow" \
            --nomodel --extsize 150 -q 0.01

        # --- Broad peaks (no input) ---
        macs2 callpeak \
            -t "$ip" \
            -f BAM \
            -g 1.2e7 \
            -n "${base}_broad" \
            --outdir "$outdir/broad" \
            --broad --broad-cutoff 0.1 \
            --nomodel --extsize 150
    fi
done

echo "MACS2 peak calling completed for FUN30 and BRN1 samples!"'''
Submitted batch job 3622132 #has both with in and ip peaks and only ip peak calling

#narrowPeaks.xls file: chr start end length abs_summit pileup p value fold enrichment q value name
lists all narrow peaks MACS2 found for your FUN30 IP.

#summit.bed file : chrm start end peak id enrichment score
lists, for every called peak region, single base position (summit) where ChIP signal was max: center of strongest enrichment.

#Get average width of narrow peaks
(chip_pipeline_deeptools) [shubhangi@cardinal-login01 narrow]$ awk '{print $3 - $2}' BRN1_Log_narrow_peaks.narrowPeak > peak_widths.txt
head peak_widths.txt
python - <<'PY'
import numpy as np
x = np.loadtxt("peak_widths.txt")
print(f"N={len(x)} peaks")
print(f"Mean width = {x.mean():.1f} bp")
print(f"Median width = {np.median(x):.1f} bp")
print(f"IQR = ({np.percentile(x,25):.1f}, {np.percentile(x,75):.1f}) bp")
print(f"Min = {x.min():.0f} bp, Max = {x.max():.0f} bp")
PY

N=860 peaks
Mean width = 492.5 bp
Median width = 302.5 bp
IQR = (221.8, 478.2) bp
Min = 150 bp, Max = 18245 bp

(chip_pipeline_deeptools) [shubhangi@cardinal-login01 macs2_peaks_FUN30_BRN1]$ cd BRN1_Q/narrow/
awk '{print $3 - $2}' BRN1_Q_narrow_peaks.narrowPeak > BRN1_Q_peak_widths.txt
head BRN1_Q_peak_widths.txt
python - <<'PY'
import numpy as np
x = np.loadtxt("BRN1_Q_peak_widths.txt")
print(f"N={len(x)} peaks")
print(f"Mean width = {x.mean():.1f} bp")
print(f"Median width = {np.median(x):.1f} bp")
print(f"IQR = ({np.percentile(x,25):.1f}, {np.percentile(x,75):.1f}) bp")
print(f"Min = {x.min():.0f} bp, Max = {x.max():.0f} bp")
PY
666
309
375
403
506
348
853
510
514
1218
N=1561 peaks
Mean width = 467.9 bp
Median width = 369.0 bp
IQR = (252.0, 558.0) bp
Min = 150 bp, Max = 17827 bp

(chip_pipeline_deeptools) [shubhangi@cardinal-login01 macs2_peaks_FUN30_BRN1]$ cd FUN30_Log/narrow/
awk '{print $3 - $2}' FUN30_Log_narrow_peaks.narrowPeak > FUN30_Log_peak_widths.txt
head FUN30_Log_peak_widths.txt
python - <<'PY'
import numpy as np
x = np.loadtxt("FUN30_Log_peak_widths.txt")
print(f"N={len(x)} peaks")
print(f"Mean width = {x.mean():.1f} bp")
print(f"Median width = {np.median(x):.1f} bp")
print(f"IQR = ({np.percentile(x,25):.1f}, {np.percentile(x,75):.1f}) bp")
print(f"Min = {x.min():.0f} bp, Max = {x.max():.0f} bp")
PY
N=1569 peaks
Mean width = 684.0 bp
Median width = 433.0 bp
IQR = (254.0, 906.0) bp
Min = 150 bp, Max = 17551 bp

(chip_pipeline_deeptools) [shubhangi@cardinal-login01 macs2_peaks_FUN30_BRN1]$ cd FUN30_Q/narrow/
awk '{print $3 - $2}' FUN30_Q_narrow_peaks.narrowPeak > FUN30_Q_peak_widths.txt
head FUN30_Q_peak_widths.txt
python - <<'PY'
import numpy as np
x = np.loadtxt("FUN30_Q_peak_widths.txt")
print(f"N={len(x)} peaks")
print(f"Mean width = {x.mean():.1f} bp")
print(f"Median width = {np.median(x):.1f} bp")
print(f"IQR = ({np.percentile(x,25):.1f}, {np.percentile(x,75):.1f}) bp")
print(f"Min = {x.min():.0f} bp, Max = {x.max():.0f} bp")
PY
N=1972 peaks
Mean width = 493.7 bp
Median width = 364.5 bp
IQR = (236.8, 616.2) bp
Min = 150 bp, Max = 17605 bp

(cooltools_env) [shubhangi@cardinal-login01 insulation scores_swygert 2019 wt (log&q)]$ python
>>> import cooler
>>> from cooltools import insulation
>>> resolution = 10000
>>> clr = cooler.Cooler("SRR7939017_1kb.cool")
>>> windows = [3*resolution, 5*resolution, 10*resolution, 25*resolution] #window sizes: 3,5,10,25
>>> insulation_table = insulation(clr, windows, verbose=True)
first_window_summary =insulation_table.columns[[ str(windows[-1]) in i for i in insulation_table.columns]]

insulation_table[['chrom','start','end','region','is_bad_bin']+list(first_window_summary)].iloc[1000:1005]
def pcolormesh_45deg(ax, matrix_c, start=0, resolution=1, *args, **kwargs):
    start_pos_vector = [start+resolution*i for i in range(len(matrix_c)+1)]
    import itertools
    n = matrix_c.shape[0]
    t = np.array([[1, 0.5], [-1, 0.5]])
    matrix_a = np.dot(np.array([(i[1], i[0])
                                for i in itertools.product(start_pos_vector[::-1],
                                                           start_pos_vector)]), t)
    x = matrix_a[:, 1].reshape(n + 1, n + 1)
    y = matrix_a[:, 0].reshape(n + 1, n + 1)
    im = ax.pcolormesh(x, y, np.flipud(matrix_c), *args, **kwargs)
    im.set_rasterized(True)
    return im

from matplotlib.ticker import EngFormatter
bp_formatter = EngFormatter('b')
def format_ticks(ax, x=True, y=True, rotate=True):
    if y:
        ax.yaxis.set_major_formatter(bp_formatter)
    if x:
        ax.xaxis.set_major_formatter(bp_formatter)
        ax.xaxis.tick_bottom()
    if rotate:
        ax.tick_params(axis='x',rotation=45)

from matplotlib.colors import LogNorm
from mpl_toolkits.axes_grid1 import make_axes_locatable
import bioframe
plt.rcParams['font.size'] = 12

start = 10_500_000
end = start+ 90*windows[0]
region = ('chr2', start, end)
norm = LogNorm(vmax=0.1, vmin=0.001)
data = clr.matrix(balance=True).fetch(region)
f, ax = plt.subplots(figsize=(18, 6))
im = pcolormesh_45deg(ax, data, start=region[1], resolution=resolution, norm=norm, cmap='fall')
ax.set_aspect(0.5)
ax.set_ylim(0, 10*windows[0])
format_ticks(ax, rotate=False)
ax.xaxis.set_visible(False)

divider = make_axes_locatable(ax)
cax = divider.append_axes("right", size="1%", pad=0.1, aspect=6)
plt.colorbar(im, cax=cax)

insul_region = bioframe.select(insulation_table, region)

ins_ax = divider.append_axes("bottom", size="50%", pad=0., sharex=ax)
ins_ax.set_prop_cycle(plt.cycler("color", plt.cm.plasma(np.linspace(0,1,5))))
ins_ax.plot(insul_region[['start', 'end']].mean(axis=1),
            insul_region['log2_insulation_score_'+str(windows[0])],
            label=f'Window {windows[0]} bp')

ins_ax.legend(bbox_to_anchor=(0., -1), loc='lower left', ncol=4);

format_ticks(ins_ax, y=False, rotate=False)
ax.set_xlim(region[1], region[2])

(cooltools_env) [shubhangi@cardinal-login01 insulation scores_swygert 2019 wt (log&q)]$ python plot_insulation_with_FUN30.py 
INFO:root:Processing region chrI
INFO:root:Processing region chrII
INFO:root:Processing region chrIII
INFO:root:Processing region chrIV
INFO:root:Processing region chrIX
INFO:root:Processing region chrM
INFO:root:Processing region chrV
INFO:root:Processing region chrVI
INFO:root:Processing region chrVII
INFO:root:Processing region chrVIII
INFO:root:Processing region chrX
INFO:root:Processing region chrXI
INFO:root:Processing region chrXII
INFO:root:Processing region chrXIII
INFO:root:Processing region chrXIV
INFO:root:Processing region chrXV
INFO:root:Processing region chrXVI
FUN30 peaks in region chrIV:100000-300000: 22

grep -w "gene" GSE95556_Sc.cerevisiae.feature.anno_Steinmetz_2013_1.gtf | \
awk '{print $1"\t"$4"\t"$5"\t"$10}' > GSE95556_Sc.cerevisiae.feature.anno_Steinmetz_genes.bed

#In R:

res <- results(dds)
Q_genes <- subset(res, log2FoldChange > 1 & padj < 0.05)
write.table(Q_genes, file="GSE95556_Sc.cerevisiae.feature.anno_Steinmetz_genes.bed", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)

conda install bedtools
conda activate bedtools

#BED file containing TOR1, SCH9, PKA subunits, and TUP1 — all linked to Q control
grep -E "YJR066W|YHR205W|YJL164C|YPL203W|YKL166C|YCR084C" GSE95556_Sc.cerevisiae.feature.anno_Steinmetz_genes.bed > Q_genes.bed

#Now you can intersect with Fun30 peaks
bedtools closest -a FUN30_Log_narrow_peaks.narrowPeak -b Q_genes.bed -d > FUN30_nearest_Qgenes.bed
##ERROR: chromosome ordering in your two BED files doesn’t match
ERROR: chromomsome sort ordering for file Q_genes.bed is inconsistent with other files. Record was:
chrIII	260157	262677	YCR084C	.
#(cooltools_env) [shubhangi@cardinal-login01 insulation scores_swygert 2019 wt (log&q)]$ 
cut -f1 Q_genes.bed | uniq | head
chrX
chrXI
chrXVI
chrIII
chrVIII
cut -f1 FUN30_Log_narrow_peaks.narrowPeak | uniq | head
chrI
chrII
chrIII
chrIV
chrIX
chrV
chrVI
chrVII
chrVIII
chrX
#FIX
bedtools sort -i FUN30_Log_narrow_peaks.narrowPeak > FUN30_Log_narrow_peaks_sorted.bed
bedtools sort -i Q_genes.bed > Q_genes_sorted.bed

bedtools closest -a FUN30_Log_narrow_peaks_sorted.bed -b Q_genes_sorted.bed -d > FUN30_nearest_Qgenes.bed
#summarize:
awk '{sum+=$7; count++} END {print "Mean distance to Q-regulators:", sum/count, "bp"}' FUN30_nearest_Qgenes.bed
Mean distance to Q-regulators: 1.87248 bp

'''smaller windows are sensitive to local structure, whereas large windows capture regions that insulate at larger scales.
we wanted 1kb resolution / window, but: 
cooltools.insulation() cannot reliably compute insulation at the same scale as your matrix resolution (1 kb window on a 1 kb .cool file) because:
	1.	The algorithm needs multiple bins to slide a window.
	•	With a 1 kb window on 1 kb bins, there’s only 1 bin per window → no local mean or neighborhood → all insulation values become NaN.
	2.	Cooltools automatically filters “bad bins” and NaNs.
	•	So the 1 kb insulation column (log2_insulation_score_1000) exists but is almost entirely NaN, and your plot silently skips it.
	3.	Typical rule of thumb:
	•	Minimum window size ≈ 3–5× your cooler bin size for stable insulation values.'''

#[shubhangi@cardinal-login04 insulation scores_swygert 2019 wt (log&q)]$ 
module load miniconda3
conda activate cooltools_env
'''
Rule of thumb for budding yeast (S. cerevisiae):
	•	Small chromosomes (≤300 kb): plot the entire chromosome in one panel.
(chrI ~230 kb, chrVI ~270 kb) → use (start=0, end=chrom_len).
	•	Medium chromosomes (300–600 kb): use one 300 kb panel (or 2 overlapping panels if you want detail).
e.g., (0–300 kb) and (200–500 kb) if chrom_len ≈ 500–600 kb.
	•	Large chromosomes (>600 kb): tile 200–300 kb windows with overlap so features are readable.
Good defaults: window = 200 kb, step = 150 kb (i.e., 25% overlap).
Keep insulation window = 3 kb (i.e., windows = [3*resolution]) at 1 kb resolution unless you specifically want to smooth more.
'''
