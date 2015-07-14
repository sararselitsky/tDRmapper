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
   ntColor=c("#C70A36","#ff7d4a","#FCEB77","#030C70","#500091","white")
#create coverage plot
   myplot<-ggplot(data=seq,aes(x=Position,y=Catted,color=base))+
#each nucleotide's base and coverage
   geom_point(aes(size=perCovg+30,color=base),show_guide = FALSE,shape=15)+
#genomic match type
   geom_point(aes(size=perCovg))+
#formatting details
   theme(axis.text.x=element_text(hjust=0.5,colour = 'black',size=18),panel.background = element_rect(fill = "gray",colour = NA),panel.grid=element_blank(),axis.text.y = element_text(size = 18, colour = 'black',hjust=1),axis.title.x = element_text(size = 18, colour = 'black',vjust=0.4),legend.position="none")+
   scale_color_manual("",values=ntColor)+
   scale_y_discrete("",limits=unique(oSeq$Catted))+
   scale_x_continuous('Position within tRNA',breaks=seq(0,170,10))+
coord_cartesian(xlim=c(0,170))

#save file
   newName<-gsub('.fq.hq_cs.mapped.top50covgPre.txt','',args)
   ggsave(myplot,filename=paste(newName,".top50Pre_tdr.pdf",sep=""),width=25,height=12)
