###########################################################################
# perl tdrMappingExactMatches.pl $tRNAFasta $file.hq_cs > $file.hq_cs.mapped
# maps TDRs, outputs exact matched reads to *mapped, otherwise *.notEM  
# Sara R. Selitsky, contact: SaraRSelitsky@gmail.com                      
# Date: July 14, 2015                                                      
###########################################################################

## open tRNA.fa
$tRNASeqs = shift;
open(T,$tRNASeqs);
## open in organized trimmed and filtered reads
$countSeq = shift;

@nt = ("A","C","G","T");
open(NEM,">$countSeq.notEM");

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
   if($name !~ /pre/){
      open(IN,$countSeq);
#reads in filtered organized reads ("countSeq")
      while($line = <IN>){
	 chomp $line;
	 my($len,$tdrSeq,$count) = split(/\t/,$line);
	 $tdrSeqHash{$tdrSeq} = $count;
#if full length tRNA sequence contains the read
	 if($tRNASeq =~ /$tdrSeq/){
#record the first position of alignment
	    $pos = index($tRNASeq,$tdrSeq);
#since indexing starts at 0, add 1
	    $posPlusOne = $pos + 1;
	    $info = join("\t",$count,$len,$tdrSeq,"exactMatch","-","-");
	    $tdrExactMatchs{$tdrSeq} = $count;
#store information in a hash since the read may align to more than one tRNA
	    if(exists $tdrInfoHash{$info}){ 
	       $tdrInfoHash{$info} = $tdrInfoHash{$info}.",". $name;
	       $tdrPosHash{$info} = $tdrPosHash{$info}.",". $posPlusOne;
	    }
	    if(!exists $tdrInfoHash{$info}){ 
	       $tdrInfoHash{$info} = $name;
	       $tdrPosHash{$info} = $posPlusOne;
	    }
	    $pos = "";
	 }
      }
   }
}

print "count\tlength\ttdrSeq\tgenomicMatchType\tfrom\tto\ttdrStartPos\ttdrMutPos\ttRNAName\n";
# print out the exact matches to *mapped
foreach $info (keys %tdrInfoHash){
   print "$info\t$tdrPosHash{$info}\t-\t$tdrInfoHash{$info}\n";
}

# print out all the reads that did NOT map exactly to *notEM
foreach $seq (keys %tdrSeqHash){
   if(!exists $tdrExactMatchs{$seq}){
      $len = length($seq);	
      print NEM "$len\t$seq\t$tdrSeqHash{$seq}\n";
   }
}
