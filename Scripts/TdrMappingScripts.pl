###########################################################################
# usage: perl TdrMappingScripts.pl tRNA.fa trimmedFastq 
# runs all scripts involved in TDRmapper pipeline
# Sara R. Selitsky, contact: SaraRSelitsky@gmail.com
# Date: May 26, 2015
###########################################################################

$tRNAFasta = shift or die;
open(TF,$tRNAFasta);
while($header = <TF>){
   if($header !~ />/){die "no FASTA detected\n";}
   $seq = <TF>;
}

$file = shift or die;

## filters out lower quality reads
`perl quality_at_positions.pl $file`;

## maps reads exactly to the tRNA sequences, if map exactly > $file.hq_cs.mapped, if not then outputted to to smallRNASeqInputFile.notEM 
`perl tdrMappingExactMatches.pl $tRNAFasta $file.hq_cs > $file.hq_cs.mapped`;

## maps reads exactly to the tRNA sequences, if map exactly > $file.hq_cs.mapped, if not then outputted to to smallRNASeqInputFile.notEM 
`perl tdrMappingExactMatchesPretRNA.pl $tRNAFasta $file.hq_cs.notEM >> $file.hq_cs.mapped`;

## maps reads allowing for one mismatch to the tRNA sequences, if map >> $file.hq_cs.mapped, if not then outputted to to smallRNASeqInputFile.notEM.not1MM 
`perl tdrMappingOneMisMatch.pl $tRNAFasta $file.hq_cs.notEM.notPre >> $file.hq_cs.mapped`;

## maps reads allowing for one deletion to the tRNA sequences, if map >> $file.hq_cs.mapped, if not then outputted to to smallRNASeqInputFile.notEM.not1MM.not1del 
`perl tdrMappingOneDeletion.pl $tRNAFasta $file.hq_cs.notEM.notPre.not1MM >> $file.hq_cs.mapped`;

## maps reads allowing for two mismatches to the tRNA sequences, if map >> $file.hq_cs.mapped, if not then outputted to to smallRNASeqInputFile.notEM.not1MM.not1del.not2MM 
`perl tdrMappingTwoMisMatches.pl $tRNAFasta $file.hq_cs.notEM.notPre.not1MM.not1del >> $file.hq_cs.mapped`;

## maps reads allowing for two deletions to the tRNA sequences, if map >> $file.hq_cs.mapped, if not then outputted to to smallRNASeqInputFile.notEM.not1MM.not1del.not2MM.not2del 
`perl tdrMappingTwoDeletions.pl $tRNAFasta $file.hq_cs.notEM.notPre.not1MM.not1del.not2MM >> $file.hq_cs.mapped`;

## maps reads allowing for three consecutive deletion to the tRNA sequences, if map >> $file.hq_cs.mapped 
`perl tdrMappingThreeConsGap.pl $tRNAFasta $file.hq_cs.notEM.notPre.not1MM.not1del.not2MM.not2del >> $file.hq_cs.mapped`;

## clean up directory
#`rm $file.hq_cs.*not*`;

## determine TDR information, coverage, species, outputs: $file.hq_cs.mapped.covg.txt, $file.hq_cs.mapped.top50covg.txt, and $file.hq_cs.mapped.speciesInfo.txt
`perl makeCovgPlotTop50_and_overallStats.pl $tRNAFasta $file.hq_cs.mapped`;

## inputs top 50 coverage file generated above and makes a visualization using R.
`Rscript rCovgPlot.r $file.hq_cs.mapped.top50covg.txt`;

## inputs top 50 coverage file generated above and makes a visualization using R.
`Rscript rCovgPlotPre.r $file.hq_cs.mapped.top50covgPre.txt`;
