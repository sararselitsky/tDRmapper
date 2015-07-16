#**tDRmapper introduction**

Small RNA-sequencing has revealed the diversity and high abundance of small RNAs derived from tRNAs, referred to as tRNA-derived RNAs (tDRs). 

tRNA-derived RNAs have unique features that limit the utility of conventional alignment tools and quantification methods. *tDRmapper* is a tool for mapping, naming, and quantifying tDRs while annotating and quantifying mismatches and deletions.

*tDRmapper* was designed specifically for trimmed human small RNA-seq data (single-end, 50x) generated on the Illumina sequencing platform using cDNA libraries that were prepared using the Illumina TruSeq protocol. 

#**Quick run**

load Perl and R

`perl TdrMappingScripts.pl hg19_mature_and_pre.fa trimmed_small_RNA-seq.fastq`

#**Program overview**

<img src="https://github.com/sararselitsky/tDRmapper/blob/master/tDRmapper_Fig/tdrOvervew.png" width="600">

#**Program steps**

1. Filters reads with high quality at each position, programmed for Phred 33.
`perl quality_at_positions.pl $file`

2. Maps the high quality reads to tRNA sequences, exact matches only. Reads that do not map are outputted to $file.hq_cs.notEM.
`perl tdrMappingExactMatches.pl $tRNAFasta $file.hq_cs > $file.hq_cs.mapped`

3. Reads that did not map in the previous step are mapped, allowing for one mismatch. Reads that do not map are outputted to $file.hq_cs.notEM.not1MM.
`perl tdrMappingOneMisMatch.pl $tRNAFasta $file.hq_cs.notEM >> $file.hq_cs.mapped`

4. Reads that did not map in the previous step are mapped, allowing for one deletion. Reads that do not map are outputted to $file.hq_cs.notEM.not1MM.not1del.
`perl tdrMappingOneGap.pl $tRNAFasta $file.hq_cs.notEM.not1MM >> $file.hq_cs.mapped`

5. Reads that did not map in the previous step are mapped, allowing for two mismatches. Reads that do not map are outputted to $file.hq_cs.notEM.not1MM.not1del.not2MM.
`perl tdrMappingTwoMisMatches.pl $tRNAFasta $file.hq_cs.notEM.not1MM.not1del >> $file.hq_cs.mapped`

6. Reads that did not map in the previous step are mapped, allowing for two deletions. Reads that do not map are outputted to $file.hq_cs.notEM.not1MM.not1del.not2MM.not2del.
`perl tdrMappingTwoDeletions.pl $tRNAFasta $file.hq_cs.notEM.not1MM.not1del.not2MM >> $file.hq_cs.mapped`

7. Reads that did not map in the previous step are mapped, allowing for a three base pair deletions. Reads that do not map are outputted to $file.hq_cs.notEM.not1MM.not1del.not2MM.not2del.not3cons.
`perl tdrMappingThreeConsGap.pl $tRNAFasta $file.hq_cs.notEM.not1MM.not1del.not2MM.not2del >> $file.hq_cs.mapped`

8. The directory is cleaned up. If you do not want files automatically removed, then delete or comment out this line.
`rm $file.hq_cs.*not*`

9. All of the mapped reads above are in one file, small_RNA-seq.fastq.mapped. This file is then assessed for tDR quantification.
`perl makeCovgPlotTop50_and_overallStats.pl $tRNAFasta $file.hq_cs.mapped`

10. Generates visualization of the top 50 (ranked by expression) tDRs derived from mature tRNAs.
`Rscript rCovgPlot.r $file.hq_cs.mapped.top50covg.txt`

11. Generates visualization of the top 50 (ranked by expression) tDRs derived from pre-tRNAs.
`Rscript rCovgPlotPre.r $file.hq_cs.mapped.top50covgPre.txt`


#**Outputs**

**(a)** *.mapped

**(b)** *.speciesInfo.txt

**(c)** *.covg.txt

**(d)** *.covgPre.txt

**(e)** *.top50covg.txt

**(f)** *.top50covgPre.txt

**(g)** *.top50Pre_tdr.pdf

**(h)** *.top50_tdr.pdf

**Output descriptions**

**(a)** The reads that map to mature or pre-tRNAs are outputted into *.mapped.


From left to right, the columns are:
(1) count: Number of times that exact sequence occurs in the FASTQ after the filtration step,
(2) length: length of the sequence,
(3) tdrSeq: the sequence,
(4) genomicMatchType: which “error type” (mismatch or deletion) the read mapped with,
(5) From: the original sequence,
(6) To: what the alteration was,
(7) tdrStartPos: The first position the sequence aligns to in the parent tRNA,
(8) tdrMusPos: The location(s) where the mismatch or deletion occurred,
(9) tRNAName: all of the tRNAs that read aligned to,

*(b-f) Step 9 of the program outputs* 


**(b)** *speciesInfo.txt, the main output with the quantification results and the tDR species assignment

From left to right, the columns are:
(1) The .mapped file that was inputted into step 9, 
(2) the parent tRNA name,
(3) the assigned majority tDR species name,
(4) quantification of that tDR species: (the percent of tRNA-derived RNA reads that map to that tRNA)*proportion of maximum coverage for that tRNA,
(5) the nucleotide positions that have coverage > 50% (number of reads at that position / number of reads mapping to that tRNA).

**(c)** *covg.txt: this output is designed for inputting into R and generating a tRNA mature coverage plot

From left to right, the columns are:
(1) file: The .mapped file that was inputted into step 9,
(2) tRNA: the parent tRNA name,
(3) tRNAPer: quantification of that tDR species,
(4) Catted: info for the y-axis of the coverage plots (tRNA proportion, tRNA, and the species),
(5) Position: then nucleotide position within the tRNA,
(6) perCovg: the percent of coverage at that position, (number of reads at that position / number of reads mapping to that tRNA,
(7) GM: "error type" listed if there is an “error type" that is present in more than 5% of the reads and the majority "error type" at that position is listed,
(8) perGM: the proportion of “error type” at that position (number of reads that have a mismatch or gap / number of total reads at each position),
(9) base: the nucleotide at that position, unless that position part of the anti-codon

**(d)** *covgPre.txt: this output is designed for inputting into R and generating a pre-tRNA coverage plot

From left to right, the columns are:
(1) file: The .mapped file that was inputted into step 9,
(2) tRNA: the parent tRNA name,
(3) tRNAPer: quantification of that tDR species,
(4) Catted: info for the y-axis of the coverage plots (tRNA proportion, tRNA, and the species),
(5) Position: then nucleotide position within the tRNA,
(6) perCovg: the percent of coverage at that position, (number of reads at that position / number of reads mapping to that tRNA,
(7) base: location in the pre-tRNA, (A) -40 to -1 nts downstream of tRNA, (B) tRNA sequence, (C) +1 to +40 nts upstream of tRNA

**(e)** *.top50covg.txt: same description as *covg.txt (c), but with only the top 50 most highly expressed tDRs derived from mature tRNAs.

**(f)** *.top50covgPre.txt: same description as *covg.txt (c), but with only the top 50 most highly expressed tDRs derived from pre-tRNAs.

**(g)** *top50_tdr.pdf: Automatic visualization of the mature tDR profile.

<img src="https://github.com/sararselitsky/tDRmapper/blob/master/tDRmapper_Fig/mature-tRNA_covg_for_git.png" width="800">

The y-axis of the tRNA coverage map shows the top 50 most highly abundant tDRs derived from mature tRNAs in descending order, and also includes the relative abundance. The x-axis shows the position within the tRNA. Each row displays the percent read coverage at each position, the nucleotide sequence of each tRNA, and the positions and proportions of any “error types” that are present at >5% of the reads that map to a given position.

**(h)** *top50Pre_tdr.pdf: Automatic visualization of the pre-tDR profile.

<img src="https://github.com/sararselitsky/tDRmapper/blob/master/tDRmapper_Fig/pre-tRNA_covg_for_git.png" width="800">

The y-axis of the tRNA coverage map shows the top 50 most highly abundant tDRs derived from pre-tRNAs in descending order, and also includes the relative abundance. The x-axis shows the position within the tRNA. Each row displays the percent read coverage at each position.

#**Naming tDRs**

<img src="https://github.com/sararselitsky/tDRmapper/blob/master/tDRmapper_Fig/namingScheme.png" width="600">

tDRmapper will assign to each tDR a name that has three components:
 
1. The first component of the tDR name indicates the parent tRNA “family” from which the TDR is derived.

  a. For the mature tRNA sequences, the “family” names consist of four parts, “W-X-Y-Z”, where W is the tRNA amino acid (sometimes preceded by “nmt-tRNA,” which means “nuclear encoded mitochondrial tRNA”), X is the anti-codon, Y is a unique identifier for each tRNA family, and Z is the number of mature tRNA genes with the identical sequence. For example, Asp-GTC-2-11 represents a mature tRNA “family” sequence that could be derived from 11 different tRNA genes, has a unique ID, “2”, bears the GTC anti-codon, and associates with Aspartate. This naming scheme builds on the nomenclature for tRNAs used by gtRNAdb.

  b. For the pre-tRNA sequences, the “family” names consist of 6 parts, “pre-W-X-Y-Z.n”. This reflects the same naming scheme described above in (a), but with the prefix “pre” and the suffix “.n”. The “.n” refers to the number of pre-tRNAs from the W-X-Y mature tRNA family that have the identical pre-tRNA sequence. From among those with the identical pre-tRNA sequence, the largest “Z” is chosen for the “family” name. For example, the pre-Gly-TCC-2-5.4 sequence accounts for four pre-tRNAs with identical sequence. The family members included under this name are pre-Gly-TCC-2-2, pre-Gly-TCC-2-3, pre-Gly-TCC-2-4, and pre-Gly-TCC-2-5.

2. The second component of the tDR name indicates the size of the tDR (refer to above figure). tDRmapper determines the primary tDR associated with a parent tRNA by counting the number of positions in the tRNA that have >50% coverage (where coverage at a position is defined as the percent of all reads mapping to the tRNA at that position). If the primary TDR sequence is <41 nts and =>28 nts, it is defined as a tRNA-half (tRH), and if it is >14 nts and <28 nts, it is defined as a tRNA-fragment (tRF). 

3. The last component of the tDR name indicates the region in the mature (a, above) or pre-tRNA (b, above) from which the read is derived.

  a. For the tDRs derived from mature tRNAs, we use a generalized tRNA secondary structure (Methods). First we determine if a read is derived from the 5’ or 3’ end of the tRNA. If not, then we assess whether it overlaps the D-loop, anti-codon loop (A-loop), or T-loop by at least one nucleotide. Details are provided below: 

     i. “5’” is added as a suffix to the TDR name if the coverage is >50% at position +1 of the tRNA (first nucleotide at the 5’-end).

     ii.	“3’” is added as a suffix to the tDR name if the coverage is >50% at position -7 of the tRNA (7 nucleotides from the 3’ end). Position -7 was used instead of position -1 due to the tapering signal (graded reduction in coverage) observed at the 3’ ends of some TDRs.

     iii. “D”, denoting the D-loop, is added as a suffix to the TDR name if the coverage is >50% at any position between 13 and 22, and is not >50% at position 1.

     iv.	“A”, denoting the A-loop, is added as a suffix to the TDR name if the coverage is >50% at any position between 31 and 39, and not >50% at position 1 or position -7.

     v. “T”, denoting the T-loop, is added as a suffix to the TDR name if the coverage is >50% at any position between -23 and -15, and not >50% at position -7. The T-loop is denoted using positions determined from the 3’ end (as opposed to the D-loop and A-loop which are denoted using positions determined from the 5’-end – see [iii] and [iv] above) due to variability in the size of the region between the A-loop and the T-loop (which contains what is known as the “variable loop”).
	
  b. For the tDRs derived from pre-tRNAs, we annotate where in relation to the header, trailer, and tRNA “body” the tDR is derived (where “body” is defined as the full-length tRNA sequence provided by gtRNAdb). Details are provided below:

     i. “0” is added as a suffix to the TDR name if the coverage is >50% at one or more nucleotides 5’ of the tRNA body, the leader sequence.

     ii.	“1” is added as a suffix to the tDR name if the coverage is >50% at one or more nucleotides 3’ of the tRNA body, the trailer sequence. This annotation is consistent with the already described “tRF-1 series”18, which are tRFs derived exclusively from trailer sequences. 

     iii. “B”, denoting tRNA “body”, is added as a suffix to the tDR name (after either a “0” or a “1”) if the coverage is >50% in any position in the body of the tRNA.

