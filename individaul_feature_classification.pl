#!/usr/bin/perl -w
use strict;
use warnings;
use Statistics::R;
#......This prog  <querySquences conatinning file>  <Database path>   <outdirectoryPath>.............#
	my $file = $ARGV[0];
	system ("rm v3.txt");
	open FH,$file;
	my $file1;
	my @query = <FH>;
	my $i = 0;
	my $fastal;
	my $fastal1;
	my $liness;
	my $count =0;
	close (FH);
	
		foreach my $xyz (@query)
		{
			
			if ($xyz =~ />/ && $count == 0)
			{$count = 1;
				$liness = $xyz;
				
				$i++;
				next;
			}
			if ($xyz !~ />/)
			{
				$liness = "$liness$xyz";
				next;
			}
			if ($xyz =~ />/ && $count == 1)	
			{
				#$file1 = "file_$i.fasta";
				$file1 = "f.txt";
				open (FH1,">$file1");
				print FH1 "$liness";
				close (FH1);
				open (FH10,">v.txt");
				Rrun();
				$liness = $xyz;
				$i++;
				next;
			}
		}
#$file1 = "file_$i.fasta";
$file1 = "f.txt";
			open (FH1,">$file1");
			print FH1 "$liness";
			close (FH1);
open (FH10,">v.txt");
Rrun();



			
sub Rrun
{
	
	my $R = Statistics::R->new();
	$R->startR ;
	$R -> send('library(protr);');
	for(my$i=0;$i<1;$i++)
	{
		
		$R -> send('setwd("/home/JUIT/drppp_17aug/");');
		$R -> send('LL = readFASTA(system.file("../../../../../../home/JUIT/drppp_17aug/f.txt", package = "protr"))[[1]];');
		$R -> send('y = extractAAC(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g0.txt");');
		$R -> send('y = extractDC(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g1.txt");');
		$R -> send('y = extractTC(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g2.txt");');
		$R -> send('y = extractMoreauBroto(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g3.txt");');
		$R -> send('y = extractMoran(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g4.txt");');
		$R -> send('y = extractGeary(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g5.txt");');
		$R -> send('y = extractCTDC(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g6.txt");');
		$R -> send('y = extractCTDT(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g7.txt");');
		$R -> send('y = extractCTDD(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g8.txt");');
		$R -> send('y = extractCTriad(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g9.txt");');
		$R -> send('y = extractAPAAC(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g10.txt");');
		$R -> send('y = extractPAAC(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g11.txt");');
		$R -> send('y = extractQSO(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g12.txt");');
		$R -> send('y = extractSOCN(LL);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g13.txt");');
		$R -> send('y = extractBLOSUM(LL, submat = "AABLOSUM62", k = 5, lag = 7, scale = TRUE, silent = TRUE);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g14.txt");');
		$R -> send('y = extractDescScales(LL, propmat = "AATopo", index = c(37:41, 43:47), pc = 5, lag = 7, silent = FALSE);');
		$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g15.txt");');
		#$R -> send('y = extractPropScales(LL, index = c(160:165, 258:296), pc = 5, lag = 7, silent = FALSE);');
		#$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g16.txt");');

		#$R -> send('LL = x;');
		#$R -> send('y <- rbind(extractAAC(LL),extractAAC(LL))');
		#$R -> send('tprops = AATopo[,c(37:41,43:47)];');
		#$R -> send('AAidxmat = t(na.omit(as.matrix(AAindex[, 7:26])));');
		#$R -> send('y = extractMDSScales(LL, propmat = "tprops", k = 5, lag = 7, silent = FALSE);');
		#$R -> send('y = extractScales(LL, propmat = "AAidxmat", pc = 5, lag = 7, silent = FALSE);');
		#$R -> send('y = extractFAScales(LL, propmat = "tprops", factors = 5, lag = 7, silent = FALSE);');
		#$R -> send('write.table(y, "/home/JUIT/drppp_17aug/g1.txt");');
			
		my $file1 = "/home/JUIT/drppp_17aug/g1.txt";
		my @l = `awk {'print \$2'} g0.txt g1.txt g2.txt g3.txt g4.txt g5.txt g6.txt g7.txt g8.txt g9.txt g10.txt g11.txt g12.txt g13.txt g14.txt g15.txt`;
		my @l1 = `awk {'print \$1'} g0.txt g1.txt g2.txt g3.txt g4.txt g5.txt g6.txt g7.txt g8.txt g9.txt g10.txt g11.txt g12.txt g13.txt g14.txt g15.txt`;
		#my @l = `awk '{print \$2}' g1.txt g0.txt`;
		system ("rm -rf g*.txt");
		my $cunter = 1;
		for(my$i=0;$i<@l;$i++)
		{
			if($l[$i] ne "\n")
			{
				chomp $l[$i];
				print FH10 "$cunter:$l[$i] ";
				$cunter++;	
			}
		
		}print "\n";
		open FH,$file1;
		
		close FH;	
	#system ("rm g1.txt");
	}
$R->stopR() ;



close FH10;
system ("perl 4extrct.pl v.txt 1 > v1.txt");
system ("perl 5normalized0to1.pl v1.txt > v2.txt");
system ("./libsvm-3.20/svm-predict v2.txt 6train_n.libsvm.model o1");
system ("cat o1 >> v3.txt");
}
				
