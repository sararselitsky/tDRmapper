$fa = shift;
open(FA,$fa);

while($line = <FA>){
   chomp $line;	
   if($line =~ />/){
      $header = $line;
   }
   my($tRNA,$chrID,$loc,$strand,$aa,$codon,$len,$pb,$sc,$score) = split(" ",$header);
   $tRNA =~  s/>Mus_musculus_tRNA-//g; 
      $chrID =~ s/[()]//g;
   my($id,$name) = split("-",$chrID);
   $tRNA_id_hash{$id} = $tRNA;
}

$sort = shift;
open(SORT,$sort);

while($name = <SORT>){
   chomp $name;
   $aminoAcidInfo = <SORT>;
   chomp $aminoAcidInfo;
   my($type,$aa,$anti,$anti_nt,$at,$anticodon_loc,$chr) = split(" ",$aminoAcidInfo);
   $HMM = <SORT>;
   if($HMM =~ /intron/){
      $intron = <SORT>;
   }
   $star = <SORT>;
   $seq = <SORT>;
   chomp $seq;
   $seq =~ s/Seq: //g;
   $seq = $seq."CCA";
   $seq = uc($seq);
   $structure = <SORT>;
   $blank = <SORT>;
   my($id,$len) = split(/\t/,$name);
   my($chrID,$loc) = split(" ",$id);
   print ">$tRNA_id_hash{$chrID}\t$anticodon_loc\n$seq\n";
}


