###########################################################################
# perl makeCovgPlotTop50_and_overallStats_species.pl $tRNAFasta $file.hq_cs.mapped
# To make a final quantification and annotation of the TDRs in the small RNA-seq reads
# Sara R. Selitsky, contact: SaraRSelitsky@gmail.com
# Date: May 26, 2015
##########################################################################

# tRNA.fa
$tRNASeq = shift;
open(TS,$tRNASeq);
## mapped TDR file
$mapped = shift;
open(MA,$mapped);

#store tRNA sequence, each base separetely
while($name = <TS>){
   chomp $name;
   $seq = <TS>;
   chomp $seq;
   my($tRNAName,$codon) = split(/\t/,$name);
   $tRNAName =~ s/>//g;
#store name and sequence of each tRNA
   if(length($codon) == 5){
      $codonHash{$tRNAName} = $codon;
   }
   $tSeqHash{$tRNAName} = $seq;
   @base = split("",$seq);
   if($tRNAName !~ /pre/){
      for($j=0; $j<scalar(@base); $j++){
	 $tRNABaseHash{$tRNAName}[$j] = $base[$j];
      }
   }
}

## read through "mapped" file
while($map = <MA>){
   chomp $map;
   my($count,$len,$tdrSeq,$genMatch,$from,$to,$startPos,$mutPos,$tRNA) = split(/\t/,$map);
   @tRNAs = split(/\,/,$tRNA);
   @starts = split(/\,/,$startPos);
   @mut = split(/\,/,$mutPos);
   for($i=0; $i<scalar(@tRNAs); $i++){
## count genomic match type counts
      if($genMatch !~ /exact/){
	 if(!exists $seqHash{$tdrSeq}{$tRNAs[$i]}{$mut[$i]}){	  
	    if($genMatch !~ /two/){
	       $seqHash{$tdrSeq}{$tRNAs[$i]}{$mut[$i]} = $tdrSeq;
	       $mutTypeHash{$tRNAs[$i]}{$mut[$i]}{$genMatch} += $count;
	       $mutCountHash{$tRNAs[$i]}{$mut[$i]} += $count;
	    }
	    else{
	       @mutsTwo = split(":",$mut[$i]);
	       for($k=0;$k<scalar(@mutsTwo);$k++){
		  $seqHash{$tdrSeq}{$tRNAs[$i]}{$mutsTwo[$k]} = $tdrSeq;
		  $countHalf = $count / 2;
		  if(!exists $mutTypeHash{$tRNAs[$i]}{$mutsTwo[$k]}{$genMatch}){
		     $mutTypeHash{$tRNAs[$i]}{$mutsTwo[$k]}{$genMatch} += $countHalf;
		     $mutCountHash{$tRNAs[$i]}{$mutsTwo[$k]} += $countHalf;
		  }
	       }
	    }
	 }
      }
# count the reads for each tRNA at each position
      $lentRNA = length($tSeqHash{$tRNAs[$i]});
      if(!exists $seqHash2{$tdrSeq}{$tRNAs[$i]}){
	 $tRNACountHash{$tRNAs[$i]} += $count;
	 $seqHash2{$tdrSeq}{$tRNAs[$i]} = 1;
	 if(!exists $tRNACovgHash{$tRNAs[$i]}){
	    for($j=0; $j<$lentRNA; $j++){	
	       $tRNACovgHash{$tRNAs[$i]}[$j] = 0.0000001;
	    }	
	 }
	 for($j=$starts[$i]-1; $j<$len+$starts[$i]-1; $j++){
	    $tRNACovgHash{$tRNAs[$i]}[$j] += $count;
	 }
      }
   }
   $totalCount = $totalCount + $count;
}

foreach $tRNA (keys %tRNACountHash){
# $per = $tRNACountHash{$tRNA} / $totalCount;
#   if(($tRNACountHash{$tRNA} / $totalCount) > 0.0001){
   $expressedHash{$tRNA} = $tRNACountHash{$tRNA};
}
#}

open(COV,">$mapped.covg.txt");
open(COV50,">$mapped.top50covg.txt");
open(PCOV,">$mapped.covgPre.txt");
open(PCOV50,">$mapped.top50covgPre.txt");
print COV "file\ttRNA\ttRNAPer\tCatted\tPosition\tperCovg\tGM\tperGM\tbase\n";
print COV50 "file\ttRNA\ttRNAPer\tCatted\tPosition\tperCovg\tGM\tperGM\tbase\n";
print PCOV "file\ttRNA\ttRNAPer\tCatted\tPosition\tperCovg\tbase\n";
print PCOV50 "file\ttRNA\ttRNAPer\tCatted\tPosition\tperCovg\tbase\n";

# determine the major genomic match types
foreach $tRNA (keys(%mutTypeHash)){
   if(exists $expressedHash{$tRNA}){
      foreach $mutPos (keys %{$mutTypeHash{$tRNA}}){
	 foreach $genMatch (keys %{$mutTypeHash{$tRNA}{$mutPos}}){
	    if($mutTypeHash{$tRNA}{$mutPos}{$genMatch} > $majCountHash{$tRNA}{$mutPos}){
	       $majCountHash{$tRNA}{$mutPos}= $mutTypeHash{$tRNA}{$mutPos}{$genMatch};
	       $majTypeHash{$tRNA}{$mutPos} = $genMatch;
	    }
	 }
      }
   }
}

# define the TDR species
foreach $tRNA (keys %expressedHash){
   $lentRNA = length($tSeqHash{$tRNA});
   $pos = 0;
   foreach $coverage (@{$tRNACovgHash{$tRNA}}){
      $pos = $pos+1;
      $per = $coverage/$expressedHash{$tRNA};
      if($per > .50){
	 $TDRlen{$tRNA} += 1;
	 if(exists $TDRpos{$tRNA}){
	    $TDRpos{$tRNA} = $TDRpos{$tRNA} .",". $pos;
	 }
	 if(!exists $TDRpos{$tRNA}){
	    $TDRpos{$tRNA} = $pos;
	 }
      }
      if($per > .67){
	 $tdrSpeciesHash{$tRNA} = "defined";
      }
      if($per > $coverageMax{$tRNA}){
	 $coverageMax{$tRNA} = $per;
      }
   }
   if($tdrSpeciesHash{$tRNA} ne "defined"){
      $tdrSpeciesHash{$tRNA} = "Undefined";
   }
   elsif($TDRlen{$tRNA} >= 28){
      $tdrSpeciesHash{$tRNA} = "tRH-";
   }
   else{
      $tdrSpeciesHash{$tRNA} = "tRF-";
   }
}

foreach $tRNA (keys %TDRpos){
   $lentRNA = length($tSeqHash{$tRNA});
   @positions = split(",",$TDRpos{$tRNA});
   for($i=0;$i<scalar@positions;$i++){
      if($tRNA =~ /pre/){
	 if($positions[$i] > ($lentRNA-40) && $tdrSpeciesHash{$tRNA} !~ /1/ && $tdrSpeciesHash{$tRNA} !~ /Un/){
	    $tdrSpeciesHash{$tRNA} = $tdrSpeciesHash{$tRNA} . "1";
	 }
	 if($positions[$i] <= 40 && $tdrSpeciesHash{$tRNA} !~ /Un/ && $tdrSpeciesHash{$tRNA} !~ /0/){
	    $tdrSpeciesHash{$tRNA} = $tdrSpeciesHash{$tRNA} . "0";
	 }
	 if(($positions[$i] > 40 && $positions[$i] < $lentRNA-40) && $tdrSpeciesHash{$tRNA} !~ /Un/ && $tdrSpeciesHash{$tRNA} !~ /B/){
	    $tdrSpeciesHash{$tRNA} = $tdrSpeciesHash{$tRNA} . "B";
	 }
      }
      else{
	 if(($positions[$i] > ($lentRNA - 6)) && $tdrSpeciesHash{$tRNA} !~ /[35]/ && $tdrSpeciesHash{$tRNA} !~ /Un/){
	    $tdrSpeciesHash{$tRNA} = $tdrSpeciesHash{$tRNA} . "3'";
	 }
	 if(($positions[$i] == 1) && $tdrSpeciesHash{$tRNA} !~ /[35]/ && $tdrSpeciesHash{$tRNA} !~ /Un/){
	    $tdrSpeciesHash{$tRNA} = $tdrSpeciesHash{$tRNA} . "5'";
	 }
      }
   }
}

foreach $tRNA (keys %TDRpos){
   $lentRNA = length($tSeqHash{$tRNA});
   @positions = split(",",$TDRpos{$tRNA});
   for($i=0;$i<scalar@positions;$i++){
      if($tRNA !~ /pre/){
	 if(($positions[$i] >= 12 && $positions[$i] <=21) && $tdrSpeciesHash{$tRNA} !~ /[35]/ && $tdrSpeciesHash{$tRNA} !~ /Un/ && $tdrSpeciesHash{$tRNA} !~ /D/){
	    $tdrSpeciesHash{$tRNA} = $tdrSpeciesHash{$tRNA} . "D";
	 }
	 if(($positions[$i] >= 30 && $positions[$i] <=38) && $tdrSpeciesHash{$tRNA} !~ /[35]/ && $tdrSpeciesHash{$tRNA} !~ /Un/ && $tdrSpeciesHash{$tRNA} !~ /A/){
	    $tdrSpeciesHash{$tRNA} = $tdrSpeciesHash{$tRNA} . "A";
	 }
	 if(($positions[$i] >= ($lentRNA - 23) && $positions[$i] <= ($lentRNA - 15)) && $tdrSpeciesHash{$tRNA} !~ /[35]/ && $tdrSpeciesHash{$tRNA} !~ /Un/ && $tdrSpeciesHash{$tRNA} !~ /T/){
	    $tdrSpeciesHash{$tRNA} = $tdrSpeciesHash{$tRNA} . "T";
	 }
      }
   }
   $tdrSpeciesHash{$tRNA} =~ s/B1/1B/g;
   $tdrSpeciesHash{$tRNA} =~ s/B0/0B/g;
}
if($tdrSpeciesHash{$tRNA} !~ /[UATD3510B]/){
   $tdrSpeciesHash{$tRNA} = "other";
}


# organize the information and output the data
open(SPE,">$mapped.speciesInfo.txt");
print SPE "file\ttRNA\tspecies\ttRNAPer\tlocMajorityCovg\n";
foreach $tRNA (sort { $expressedHash{$b} <=> $expressedHash{$a} } keys %expressedHash){
   $tRNACount = $tRNACountHash{$tRNA};
   $perTotal = (($tRNACount / $totalCount)* $coverageMax{$tRNA}) * 100;
   $roundedPerTotal = sprintf("%.3f",$perTotal);
   $species = $tdrSpeciesHash{$tRNA};
#print out species files
   print SPE "$mapped\t$tRNA\t$species\t$roundedPerTotal\t";
   if(!exists $newHash{$tRNA} && $tRNA !~ /pre/){
      $newHash{$tRNA} = 1;
      $top50Count = $top50Count + 1;
   }
   if(!exists $newHash2{$tRNA} && $tRNA =~ /pre/){
      $newHash2{$tRNA} = 1;
      $top50CountPre = $top50CountPre + 1;
   }
   $pos = 0;
   $lentRNA = length($tSeqHash{$tRNA});
   @codon = split("-",$codonHash{$tRNA});
   @ac = ($codon[0]..$codon[1]);
   foreach $coverage (@{$tRNACovgHash{$tRNA}}){
      if($tRNA !~ /pre/){
	 $base = $tRNABaseHash{$tRNA}[$pos];
	 $base = uc($base);
      }
      else{
	 if($pos <= 39){
	    $base = "A";
	 }
	 elsif($pos < ($lentRNA-40)){
	    $base = "B";
	 }
	 else{
	    $base = "C";
	 }
      }
      $perPos = ($coverage/$tRNACount) * 100;
      $roundedPerPos = sprintf("%.3f",$perPos);
      $mutPer = $majCountHash{$tRNA}{$pos} / $tRNACount;
      if($roundedPerTotal > 0.01){
	 if($mutPer > 0.05){
	    $mutType = $majTypeHash{$tRNA}{$pos};
	 }
	 else{
	    $mutType = "";
	 }
	 $pos1 = $pos + 1;
	 for($i=0;$i<3;$i++){
	    if($pos1 == $ac[$i]){
	       $base = "ac";
	    }
	 }
	 if($perPos > 50){
	    print SPE "$pos,";
	 }
# print out coverage files
	 if($tRNA !~ /pre/){
	    if($top50Count <= 50 && $base ne ""){
	       print COV50 "$mapped\t$tRNA\t$roundedPerTotal\t$tRNA-$species $roundedPerTotal\t$pos1\t$roundedPerPos\t$mutType\t$mutPer\t$base\n";
	    }
	    print COV "$mapped\t$tRNA\t$roundedPerTotal\t$tRNA-$species $roundedPerTotal\t$pos1\t$roundedPerPos\t$mutType\t$mutPer\t$base\n";
	 }
	 if($tRNA =~ /pre/){
	    if($top50CountPre <= 50 && $base ne ""){
	       print PCOV50 "$mapped\t$tRNA\t$roundedPerTotal\t$tRNA-$species $roundedPerTotal\t$pos1\t$roundedPerPos\t$base\n";
	    }
	    print PCOV "$mapped\t$tRNA\t$roundedPerTotal\t$tRNA-$species $roundedPerTotal\t$pos1\t$roundedPerPos\t$base\n";
	 }
      }
      $pos = $pos + 1;
   }
   print SPE "\n";
}
