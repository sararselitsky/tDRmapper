##################################################################################
# perl tdrMappingOneMisMatch.pl $tRNAFasta $file.hq_cs.notEM >> $file.hq_cs.mapped
# maps TDRs, outputs reads with one mismatch to *mapped, otherwise *.notEM.not1MM  
# Sara R. Selitsky, contact: SaraRSelitsky@gmail.com                             
# Date: July 14, 2015                                                             
##################################################################################

# open tRNA.fa
$tRNASeqs = shift;
open(T,$tRNASeqs);
## open in organized trimmed and filtered reads with no reads that map exactly
$countSeq = shift;

@nt = ("A","C","G","T");
open(NEM,">$countSeq.not1MM");

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
   $tRNASeqHash{$tRNASeq} = $name;
#reads in filtered organized reads "countSeq" which do not map exactly, *.notEM
   if($name !~ /pre/){
      open(IN,$countSeq);
      while($line = <IN>){
	 chomp $line;
	 my($len,$tdrSeq,$count) = split(/\t/,$line);
	 $tdrSeqHash{$tdrSeq} = $count;
	 for($i=0;$i<$len;$i++){
#split the read into two substrings to test out every mismatch at every position
	    $sub = substr($tdrSeq,0,$i);
	    $sub2 = substr($tdrSeq,$i+1,$len-$i);
#if string matches after a single deletion, check which nt matches
	    if($tRNASeq =~ /$sub.$sub2/){
	       $mis = $i + 1;
	       for($k=0;$k<4;$k++){
		  $misNT = $sub.$nt[$k].$sub2;
		  $misSub = substr($tdrSeq,$i,1);
# if a read with a mismatch matches then the information is recorded
		  if($tRNASeq =~ /$misNT/ && $nt[$k] ne $misSub){
		     $pos = index($tRNASeq,$misNT);
		     $change = $nt[$k];
		     $tRNAModPos = $mis + $pos;
		     $posPlusOne = $pos + 1;
		     $info = join("\t",$count,$len,$tdrSeq,"oneMismatch");
		     $tdrOneMisMatch{$tdrSeq} = $count;
		     if(exists $tdrInfoHash{$info}){
			$tdrInfoHash{$info} = $tdrInfoHash{$info}.",". $name;
			$tdrPosHash{$info} = $tdrPosHash{$info}.",". $posPlusOne;
			$tdrMutPosHash{$info} = $tdrMutPosHash{$info}.",". $tRNAModPos;
			$tdrChangeHash{$info} = $tdrChangeHash{$info} . "," . $change;
			$tdrMisHash{$info} = $tdrMisHash{$info} . "," . $misSub;

		     }
		     if(!exists $tdrInfoHash{$info}){
			$tdrInfoHash{$info} = $name;
			$tdrPosHash{$info} = $posPlusOne;
			$tdrMutPosHash{$info} = $tRNAModPos;
			$tdrChangeHash{$info} = $change;
			$tdrMisHash{$info} = $misSub;
		     }
		  }
	       }
	    }
	 }
      }
   }
}

# print out the reads that map with one mismatch and their information to mapped
foreach $info (keys %tdrInfoHash){
   print "$info\t$tdrMisHash{$info}\t$tdrChangeHash{$info}\t$tdrPosHash{$info}\t$tdrMutPosHash{$info}\t$tdrInfoHash{$info}\n";
}

# print out all reads that did not map, *.notEM.not1MM
foreach $seq (keys %tdrSeqHash){
   if(!exists $tdrOneMisMatch{$seq}){
      $len = length($seq);	
      print NEM "$len\t$seq\t$tdrSeqHash{$seq}\n";
   }
}
