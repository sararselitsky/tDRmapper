$fa = shift;
open(FA,$fa);

while($line = <FA>){
   chomp $line;	
   if($line =~ />/){
      $header = $line;
   }
   my($tRNA,$chrID,$loc,$strand,$aa,$codon,$len,$pb,$sc,$score) = split(" ",$header);
   $tRNA =~  s/>Mus_musculus_tRNA-//g; 
      $loc =~ s/[:-]/\t/g;
   $strand =~ s/[()]//g;
   my($chr,$start,$end) = split(/\t/,$loc);
   if(!exists $tRNAHash{$tRNA}){
      if($start < $end){
	 $preS = $start - 41;
	 $preE = $end + 40;
	 print "$chr\t$preS\t$preE\tpre-$tRNA\t0\t$strand\n";
      }
      else{
	 $preS = $end - 40;
	 $preE = $start + 40;
	 print "$chr\t$preS\t$preE\tpre-$tRNA\t0\t$strand\n";
      }
   	$tRNAHash{$tRNA} = $tRNA;
   }
}

