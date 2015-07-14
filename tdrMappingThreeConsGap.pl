###########################################################################
# perl tdrMappingThreeConsGap.pl $tRNAFasta $file.hq_cs.notEM.not1MM.not1del.not2MM.not2del >> $file.hq_cs.mapped
# maps TDRs, outputs reads to *mapped, otherwise *.notEM.not1MM.not1del.not2MM.not2del
# Sara R. Selitsky, contact: SaraRSelitsky@gmail.com
# Date: July 14, 2015
###########################################################################

## maps TDRs and outputs sequences with three consecutive deletions only to *mapped
## opens tRNA.fa
$tRNASeqs = shift;
open(T,$tRNASeqs);
## opens in *.not2del, with no reads that map exactly, with one mismatch, with one deletion, two mismatches or two deletions
$countSeq = shift;

@nt = ("A","C","G","T");
open(NEM,">$countSeq.not3ConsDel");

%tdrInfoHash= ();
%tdrPosHash = ();
%tdrMutPosHash = ();
%tdrFromHash = ();

#read tRNA.fa
while($name = <T>){
   chomp $name;
#manipulate name to be just amino acid and anti-codon
   $name =~ s/[\t](.*)//g;
   $name =~ s/>//g;
# read in tRNA sequence and store it as uppercase to "tRNASeq"
   $tRNASeq = <T>;
   chomp $tRNASeq;
   $tRNASeq = uc($tRNASeq);
#reads in filtered organized reads "countSeq", *.not2del
   if($name !~ /pre/){
      open(IN,$countSeq);
      while($line = <IN>){
	 chomp $line;
	 my($len,$tdrSeq,$count) = split(/\t/,$line);
	 $tdrSeqHash{$tdrSeq} = $count;
	 for($i=0;$i<$len;$i++){
# divide the read into two strings, see if maps with three deletions
	    $sub = substr($tdrSeq,0,$i);
	    $sub2 = substr($tdrSeq,$i,$len-$i);
	    if($tRNASeq =~ /$sub...$sub2/){
#loop through each nt for each position in the three consecutive gap
	       for($k=0;$k<4;$k++){
		  for($l=0;$l<4;$l++){
		     for($m=0;$m<4;$m++){
			$misNT = $sub.$nt[$k].$nt[$l].$nt[$m].$sub2;
#if maps, then record info
			if($tRNASeq =~ /$misNT/){
			   $pos = index($tRNASeq,$misNT);
			   $firstChange = $nt[$k];
			   $secondChange = $nt[$l];
			   $thirdChange=$nt[$m];
			   $mis = $i + 1;
			   $tRNAModPos = $mis + $pos;
			   $posPlusOne = $pos + 1;
			   $fromChanges = $firstChange.$secondChange.$thirdChange;
			   if($fromChanges =~ /[ACGT]{3}/){
			      $info = join("\t",$count,$len,$tdrSeq,"threeConsDel");
			      $tdrGap{$tdrSeq} = $count;
			      if(!exists $posHash{$tdrSeq}{$tRNAModPos}){
				 $posHash{$tdrSeq}{$tRNAModPos} = 1;
				 if(exists $tdrInfoHash{$info}){
				    $tdrInfoHash{$info} = $tdrInfoHash{$info}.",". $name;
				    $tdrPosHash{$info} = $tdrPosHash{$info}.",". $posPlusOne;
				    $tdrMutPosHash{$info} = $tdrMutPosHash{$info}.",". $tRNAModPos;
				    $tdrFromHash{$info} = $tdrFromHash{$info}.",". $fromChanges;
				 }
				 if(!exists $tdrInfoHash{$info}){
				    $tdrInfoHash{$info} = $name;
				    $tdrPosHash{$info} = $posPlusOne;
				    $tdrMutPosHash{$info} = $tRNAModPos;
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
   }
}
# print out every read that maps with three consecutive deletions to *mapped
foreach $info (keys %tdrInfoHash){
   print "$info\t$tdrFromHash{$info}\t---\t$tdrPosHash{$info}\t$tdrMutPosHash{$info}\t$tdrInfoHash{$info}\n";
}
# print out reads that don't map, output to *.not3ConsDel
foreach $seq (keys %tdrSeqHash){
   if(!exists $tdrGap{$seq}){
      $len = length($seq);	
      print NEM "$len\t$seq\t$tdrSeqHash{$seq}\n";
   }
}
