###########################################################################
# perl tdrMappingTwoMisMatches.pl $tRNAFasta $file.hq_cs.notEM.not1MM.not1del >> $file.hq_cs.mapped
# maps TDRs, outputs reads to *mapped, otherwise *.notEM.not1MM.not1Del.not2MM
# Sara R. Selitsky, contact: SaraRSelitsky@gmail.com
# Date: July 14, 2015
###########################################################################

## open tRNA.fa
$tRNASeqs = shift;
open(T,$tRNASeqs);
## opens in *.notEM.not1MM.not1del, no reads that map exactly, with one mismatch or with one deletion
$countSeq = shift;
open(NEM,">$countSeq.not2MM");

@nt = ("A","C","G","T");

#reads in tRNA.fa
while($name = <T>){
   chomp $name;
#manipulate name to be just amino acid and anti-codon
   $name =~ s/[\t](.*)//g;
   $name =~ s/>//g;
#Read in tRNA sequence, convert to all uppercase
   $tRNASeq = <T>;
   chomp $tRNASeq;
   $tRNASeq = uc($tRNASeq);
#reads in filtered organized reads "countSeq" which do not map exactly, *..not1del
   if($name !~ /pre/){
      open(IN,$countSeq);
      while($line = <IN>){
	 chomp $line;
	 my($len,$tdrSeq,$count) = split(/\t/,$line);
	 $tdrSeqHash{$tdrSeq} = $count;
	 for($i=0;$i<$len;$i++){
	    for($j=0;$j<$len-($i+1);$j++){
#split the read into three substrings to test out every possible combination of two mismatches
	       $subFirst = substr($tdrSeq,0,$i);
	       $subMiddle = substr($tdrSeq,$i+1,$j);
	       $subLast = substr($tdrSeq,($j+$i+2),$len-($j+$i));
	       if($tRNASeq =~ /$subFirst.$subMiddle.$subLast/){
		  for($k=0;$k<4;$k++){
		     for($l=0;$l<4;$l++){
			$misNT = $subFirst.$nt[$k].$subMiddle.$nt[$l].$subLast;
			$firstMis = substr($tdrSeq,$i,1);
			$secondMis = substr($tdrSeq,($j+$i+1),1);
# if a read with two mismatches matches then the information is recorded
			if($tRNASeq =~ /$misNT/ && ($firstMis ne $nt[$k]) && ($secondMis ne $nt[$l])){
			   $pos = index($tRNASeq,$misNT);
			   $posPlusOne = $pos + 1;
			   $firstChange = $nt[$k];
			   $secondChange = $nt[$l];
			   $tRNAModPos1 = $i + $pos + 1;
			   $tRNAModPos2 = $j + $i + 2 + $pos;
			   $fromChanges = $firstChange .":".$secondChange;
			   $toChanges = $firstMis.":".$secondMis;
			   $tRNAModLocs = $tRNAModPos1.":".$tRNAModPos2;
			   $info = join("\t",$count,$len,$tdrSeq,"twoMismatches",$fromChanges,$toChanges);
			   $tdrTwoMisMatches{$tdrSeq} = $count;
			   if(exists $tdrInfoHash{$info}){
			      $tdrInfoHash{$info} = $tdrInfoHash{$info}.",". $name;
			      $tdrPosHash{$info} = $tdrPosHash{$info}.",". $posPlusOne;
			      $tdrMutPosHash{$info} = $tdrMutPosHash{$info}.",". $tRNAModLocs;
			   }
			   if(!exists $tdrInfoHash{$info}){
			      $tdrInfoHash{$info} = $name;
			      $tdrPosHash{$info} = $posPlusOne;
			      $tdrMutPosHash{$info} = $tRNAModLocs;
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
# print out every read that maps with two mismatches to *mapped
foreach $info (keys %tdrInfoHash){
   print "$info\t$tdrPosHash{$info}\t$tdrMutPosHash{$info}\t$tdrInfoHash{$info}\n";
}

# print out the reads that did not map to *not2MM
foreach $seq (keys %tdrSeqHash){
   if(!exists $tdrTwoMisMatches{$seq}){
      $len = length($seq);	
      print NEM "$len\t$seq\t$tdrSeqHash{$seq}\n";
   }
}
