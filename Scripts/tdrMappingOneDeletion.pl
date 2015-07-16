##################################################################################
# perl tdrMappingOneDeletion.pl $tRNAFasta $file.hq_cs.notEM.not1MM >> $file.hq_cs.mapped
# maps TDRs, outputs reads with one deletion to *mapped, otherwise *.notEM.not1MM.not1del  
# Sara R. Selitsky, contact: SaraRSelitsky@gmail.com                             
# Date: July 14, 2015                                                             
##################################################################################

## open tRNA.fa
$tRNASeqs = shift;
open(T,$tRNASeqs);
## open in *.notEM.not1MM, no reads that map exactly or with one mismatch
$countSeq = shift;

@nt = ("A","C","G","T");
open(NEM,">$countSeq.not1del");

#reads in tRNA.fa
while($name = <T>){
   chomp $name;
#manipulate name to be just amino acid and anti-codon
   $name =~ s/[\t](.*)//g;
   $name =~ s/>//g;
# read in tRNA sequence and store it as uppercase to "tRNASeq"
   $tRNASeq = <T>;
   chomp $tRNASeq;
   $tRNASeq = uc($tRNASeq);
#reads in filtered organized reads "countSeq", *.notEM.not1MM
   if($name !~ /pre/){
      open(IN,$countSeq);
      while($line = <IN>){
	 chomp $line;
	 my($len,$tdrSeq,$count) = split(/\t/,$line);
	 for($i=0;$i<$len;$i++){ 
#split the read into two substrings to test out a deletion at every position
	    $sub = substr($tdrSeq,0,$i);
	    $sub2 = substr($tdrSeq,$i,$len-$i);
	    $tdrSeqHash{$tdrSeq} = $count;
#if a string matches with a deletion determine which nt
	    if($tRNASeq =~ /$sub.$sub2/){
	       for($k=0;$k<4;$k++){
		  $misNT = $sub.$nt[$k].$sub2;
#if one deletion matches, then record info
		  if($tRNASeq =~ /$misNT/){
		     $pos = index($tRNASeq,$misNT);
		     $change = $nt[$k];
		     $mis = $i + 1;
		     $tRNAModPos = $mis + $pos;
		     $posPlusOne = $pos + 1;
		     $info = join("\t",$count,$len,$tdrSeq,"oneDeletion",$change,"-");
		     $tdrGap{$tdrSeq} = $count;
		     if(exists $tdrInfoHash{$info}){
			$tdrInfoHash{$info} = $tdrInfoHash{$info}.",". $name;
			$tdrPosHash{$info} = $tdrPosHash{$info}.",". $posPlusOne;
			$tdrMutPosHash{$info} = $tdrMutPosHash{$info}.",". $tRNAModPos;

		     }
		     if(!exists $tdrInfoHash{$info}){
			$tdrInfoHash{$info} = $name;
			$tdrPosHash{$info} = $posPlusOne;
			$tdrMutPosHash{$info} = $tRNAModPos;
		     }
		  }
	       }
	    }
	 }
      }
   }
}

# print out the reads that map with one deletion and their information to *mapped
foreach $info (keys %tdrInfoHash){
   print "$info\t$tdrPosHash{$info}\t$tdrMutPosHash{$info}\t$tdrInfoHash{$info}\n";
}

# print out all reads that did not map to *notEM.not1MM.not1del
foreach $seq (keys %tdrSeqHash){
   if(!exists $tdrGap{$seq}){
      $len = length($seq);	
      print NEM "$len\t$seq\t$tdrSeqHash{$seq}\n";
   }
}
