#!/usr/bin/perl
###########################################################################
# usage: perl TdrMappingScripts.pl tRNA.fa trimmedFastq 
# runs all scripts involved in TDRmapper pipeline
# Sara R. Selitsky, contact: SaraRSelitsky@gmail.com
# Date: May 26, 2015
###########################################################################

use Getopt::Long;
use Pod::Usage;
use Cwd 'abs_path';
use File::Basename;

my $help = 0;
$result = GetOptions ('help|?' => \$help,
                      "fasta=s" => \$fasta_fn,
                      "ref=s"   => \$ref_fn) or pod2usage(2);
pod2usage(1) if $help;

my $scripts = abs_path($0);
$scripts =~ s/TdrMappingScripts.pl//;
$scripts =~ s/\s+//g;

$tRNAFasta = shift or die "No tRNA fasta file."; 
open(TF,$tRNAFasta);
while($header = <TF>){
   if($header !~ />/){die "no FASTA detected\n";}
   $seq = <TF>;
}

$file = shift or die "No fastq file.";
($name,$path,$suffix) = fileparse($file);
## filters out lower quality reads
`perl $scripts/quality_at_positions.pl $file` if (! -e "$file.hq_cs");

if (! -e "$name.hq_cs.mapped") {
## maps reads exactly to the tRNA sequences, if map exactly > $file.hq_cs.mapped, if not then outputted to to smallRNASeqInputFile.notEM 
    `perl $scripts/tdrMappingExactMatches.pl $tRNAFasta $file.hq_cs > $name.hq_cs.mapped` ;

## maps reads exactly to the tRNA sequences, if map exactly > $file.hq_cs.mapped, if not then outputted to to smallRNASeqInputFile.notEM 
    `perl $scripts/tdrMappingExactMatchesPretRNA.pl $tRNAFasta $file.hq_cs.notEM >> $name.hq_cs.mapped`;

## maps reads allowing for one mismatch to the tRNA sequences, if map >> $file.hq_cs.mapped, if not then outputted to to smallRNASeqInputFile.notEM.not1MM 
    `perl $scripts/tdrMappingOneMisMatch.pl $tRNAFasta $file.hq_cs.notEM.notPre >> $name.hq_cs.mapped`;

## maps reads allowing for one deletion to the tRNA sequences, if map >> $file.hq_cs.mapped, if not then outputted to to smallRNASeqInputFile.notEM.not1MM.not1del 
    `perl $scripts/tdrMappingOneDeletion.pl $tRNAFasta $file.hq_cs.notEM.notPre.not1MM >> $name.hq_cs.mapped`;

## maps reads allowing for two mismatches to the tRNA sequences, if map >> $file.hq_cs.mapped, if not then outputted to to smallRNASeqInputFile.notEM.not1MM.not1del.not2MM 
    `perl $scripts/tdrMappingTwoMisMatches.pl $tRNAFasta $file.hq_cs.notEM.notPre.not1MM.not1del >> $name.hq_cs.mapped`;

## maps reads allowing for two deletions to the tRNA sequences, if map >> $file.hq_cs.mapped, if not then outputted to to smallRNASeqInputFile.notEM.not1MM.not1del.not2MM.not2del 
    `perl $scripts/tdrMappingTwoDeletions.pl $tRNAFasta $file.hq_cs.notEM.notPre.not1MM.not1del.not2MM >> $name.hq_cs.mapped`;

## maps reads allowing for three consecutive deletion to the tRNA sequences, if map >> $file.hq_cs.mapped 
    `perl $scripts/tdrMappingThreeConsGap.pl $tRNAFasta $file.hq_cs.notEM.notPre.not1MM.not1del.not2MM.not2del >> $name.hq_cs.mapped`;
}
## clean up directory
#`rm $file.hq_cs.*not*`;

open(RES, "$name.hq_cs.mapped") or die "Not mapped file";
my $n = 0;
while($line = <RES>){
    $n++;
    if ($n > 10){
        break;
    }
}
close(RES);


if ($n > 10){
## determine TDR information, coverage, species, outputs: $file.hq_cs.mapped.covg.txt, $file.hq_cs.mapped.top50covg.txt, and $file.hq_cs.mapped.speciesInfo.txt
    `perl $scripts/makeCovgPlotTop50_and_overallStats.pl $tRNAFasta $name.hq_cs.mapped`;

## inputs top 50 coverage file generated above and makes a visualization using R.
    `Rscript $scripts/rCovgPlot.r $name.hq_cs.mapped.top50covg.txt`;

## inputs top 50 coverage file generated above and makes a visualization using R.
    `Rscript $scripts/rCovgPlotPre.r $name.hq_cs.mapped.top50covgPre.txt`;
}

 __END__

=head1 NAME

 tRNA mapper

=head1 SYNOPSIS

 TdrMappingScripts.pl reference_trna.fa sample.fa

=cut
