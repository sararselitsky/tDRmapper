###########################################################################
# perl quality_at_positions.pl $file, outputs $file.hq_cs
# inputs the trimmed fastq to filter out reads with quality lower than 28 at any position
# also filters out reads <13 and >41
# compresses fasta to print out: len seq countOfSeq
# Sara R. Selitsky, contact: SaraRSelitsky@gmail.com
# Date: May 26, 2015
###########################################################################


$fq = shift;
if ($fq=~/gz$/){
    open(FQ, "zcat $fq | ")
}else{
open(FQ,$fq);
}

## open output file
open(HI, ">$fq.hq_cs");

## read in all reads and determine which ones have quality lower than 28
while($seqID = <FQ>){
   chomp($seqID);
   $seq=<FQ>;
   chomp $seq;
   $sep=<FQ>;
   $qual=<FQ>;
   chomp $qual;
   $info = join("\t",$qual,$seq);
   @ASCII = unpack("C*",$qual);
   $allQualHash{$seqID} = $seq;
   for($i=0;$i<scalar(@ASCII);$i++){
#Phred of 28
      if($ASCII[$i] < 62){
	 $lowQualHash{$seqID} = $seq;
      }
   }
}
## organize reads by sequence if they do not have quality lower than 28
foreach $ID (keys %allQualHash){
   if(!exists $lowQualHash{$ID}){	
      $seq = $allQualHash{$ID};
      $countHash{$seq} += 1;
   }
}
## outputs filtered compressed reads
foreach $seq (keys %countHash){
   $len = length($seq);
   if($len > 13 && $len < 41 && $countHash{$seq} > 100){
      print HI "$len\t$seq\t$countHash{$seq}\n";
   }
}

