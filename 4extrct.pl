#!/usr/bin/perl 	-w
use strict;
open FH,$ARGV[0];
my @file = <FH>;
close FH;        
chomp $ARGV[1];

		# 

		for(my$j=0;$j<@file;$j++)   
		{
			my @temp = split (/\s+/,$file[$j]);
			if($j<230){print "$ARGV[1] ";}else{print "$ARGV[1] ";}
		#	print"$temp[0] ";
			my $counter=1;
			for(my$k=0;$k<@temp;$k++)
			{
				if($temp[$k])
				{chomp $temp[$k];
				my @tempp = split(/\:/,$temp[$k]);
				$tempp[1] =~ s/NA/0/;
				my $rounded = sprintf("%.10f",$tempp[1]);
				print"$counter:$rounded ";
				$counter++;
				}else{
				print"$counter:0 ";
				$counter++;}
			}
			print "\n";
		}		



