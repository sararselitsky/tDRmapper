###########################################################################
# Rscript rCovgPlot.r $file.hq_cs.mapped.top50covg.txt
# Generates a TDR profile visualization, tRNA coverage plot
# Sara R. Selitsky, contact: SaraRSelitsky@gmail.com
# Date: May 26, 2015
##########################################################################

library("ggplot2")
#read in top50Ccovg file
args <- commandArgs(TRUE)
   seq <- read.delim(args, sep="\t")
#order by tRNA coverage
   oSeq<-seq[order(seq$tRNAPer,decreasing=FALSE),]
# color scheme of each nucleotide
#ntColor=c("black","#039C22","#464747","#030C70","#500091","white")
ntColor=c("black","#5BB304","#464747","#030C70","#0B5C73","white")
#create coverage plot
   myplot<-ggplot(data=seq,aes(x=Position,y=Catted,fill=perGM,shape=GM,color=base))+
#each nucleotide's base and coverage
   geom_point(aes(size=perCovg+30,color=base),show_guide = FALSE,shape=15)+
#genomic match type
   geom_point(aes(size=perCovg))+
   scale_shape_manual("Genomic type",limits=c("","oneDeletion","oneMismatch","twoDeletions","twoMismatches","threeConsDel"),values=c(15,21,23,24,25,22))+
   scale_fill_gradient2('Prop genomic type',high = "red", mid = "yellow", low ="white", space = "rgb",guide = "colourbar",na.value = "black",midpoint=0.5,limit=c(0,1))+
#formatting details
   theme(axis.text.x=element_text(hjust=0.5,colour = 'black',size=14),panel.background = element_rect(fill = "gray",colour = NA),panel.grid=element_blank(),axis.text.y = element_text(size = 14, colour = 'black',hjust=1),axis.title.y = element_text(size = 16, colour = 'black',angle=90,vjust=0.3),axis.title.x = element_text(size = 16, colour = 'black',vjust=0.4),legend.position="none")+
   scale_color_manual("",values=ntColor)+
   scale_y_discrete("",limits=unique(oSeq$Catted))+
   scale_x_continuous('Position within tRNA',breaks=seq(0,90,10))+
coord_cartesian(xlim=c(0,90))

#save file
   newName<-gsub('.fq.hq_cs.mapped.top50covg.txt','',args)
   ggsave(myplot,filename=paste(newName,".top50_tdr.pdf",sep=""),width=17,height=12)
