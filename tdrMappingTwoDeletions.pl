###########################################################################
# perl tdrMappingTwoDeletions.pl $tRNAFasta $file.hq_cs.notEM.not1MM.not1del.not2MM >> $file.hq_cs.mapped
# maps TDRs, outputs reads to *mapped, otherwise *.notEM.not1MM.not1del.not2MM.not2del
# Sara R. Selitsky, contact: SaraRSelitsky@gmail.com
# Date: July 14, 2015
###########################################################################

## opens tRNA.fa
$tRNASeqs = shift;
open(T,$tRNASeqs);
## opens in *.not2MM, no reads that map exactly, with one mismatch, with one deletion, or two mismatches
$countSeq = shift;

open(NEM,">$countSeq.not2del");
@nt = ("A","C","G","T");

# reads in tRNA.fa
while($name = <T>){
   chomp $name;
   $name =~ s/[\t](.*)//g;
   $name =~ s/>//g;
#manipulate name to be just amino acid and anti-codon
   $tRNASeq = <T>;
   chomp $tRNASeq;
#Read in tRNA sequence, convert to all uppercase
   $tRNASeq = uc($tRNASeq);
#reads in filtered organized reads "countSeq" which do not map exactly, *not2MM
   if($name !~ /pre/){
      open(IN,$countSeq);
      while($line = <IN>){
	 chomp $line;
	 my($len,$tdrSeq,$count) = split(/\t/,$line);
	 $tdrSeqHash{$tdrSeq} = $count;
	 $len = length($tdrSeq);
	 for($i=0;$i<$len;$i++){
	    for($j=0;$j<$len-($i+1);$j++){
#split the read into three substrings to test out every possible combination of two deletions
	       $subFirst = substr($tdrSeq,0,$i);
	       $subMiddle = substr($tdrSeq,$i,$j);
	       $subLast = substr($tdrSeq,($j+$i),$len-($j+$i));
	       if($tRNASeq =~ /$subFirst.$subMiddle.$subLast/){
		  for($k=0;$k<4;$k++){
		     for($l=0;$l<4;$l++){
			$misNT = $subFirst.$nt[$k].$subMiddle.$nt[$l].$subLast;
# if a read with two deletions matches then the information is recorded
			if($tRNASeq =~ /$misNT/){
			   $pos = index($tRNASeq,$misNT);
			   $posPlusOne = $pos + 1;
			   $firstChange = $nt[$k];
			   $secondChange = $nt[$l];
			   $firstMis = substr($seq,$i,1);
			   $secondMis = substr($seq,($j+$i),1);
			   $tRNAModPos1 = $i + $pos + 1;
			   $tRNAModPos2 = $j + $i + 2 + $pos;
			   $fromChanges = $firstChange .":".$secondChange;
			   $tRNAModLocs = $tRNAModPos1.":".$tRNAModPos2;
			   $info = join("\t",$count,$len,$tdrSeq,"twoDeletions");
			   $tdrTwoDel{$tdrSeq} = $tdrSeqHash{$tdrSeq};
			   if(exists $tdrInfoHash{$info}){
			      $tdrInfoHash{$info} = $tdrInfoHash{$info}.",". $name;
			      $tdrPosHash{$info} = $tdrPosHash{$info}.",". $posPlusOne;
			      $tdrMutPosHash{$info} = $tdrMutPosHash{$info}.",". $tRNAModLocs;
			      $tdrFromHash{$info} = $tdrFromHash{$info}.",". $fromChanges;
			   }
			   if(!exists $tdrInfoHash{$info}){
			      $tdrInfoHash{$info} = $name;
			      $tdrPosHash{$info} = $posPlusOne;
			      $tdrMutPosHash{$info} = $tRNAModLocs;
			      $tdrFromHash{$info} = $fromChanges;
			   }
			}
		     }
		  }
	       }
	    }
	 }
      }
   }
}

# print out every read that maps with two deletions to *mapped
foreach $info (keys %tdrInfoHash){
   print "$info\t$tdrFromHash{$info}\t-:-\t$tdrPosHash{$info}\t$tdrMutPosHash{$info}\t$tdrInfoHash{$info}\n";
}
# print out the reads that did not map to *not2del
foreach $seq (keys %tdrSeqHash){
   if(!exists $tdrTwoDel{$seq}){
      $len = length($seq);	
      print NEM "$len\t$seq\t$tdrSeqHash{$seq}\n";
   }
}
