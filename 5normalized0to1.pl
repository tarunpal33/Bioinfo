#!/usr/bin/perl 	-w
use strict;
open FH,$ARGV[0];
my @file = <FH>;
close FH;        



		for(my$j=0;$j<@file;$j++)   
		{
			my @temp = split(/\s+/,$file[$j]);
			my$min =0;
			my $max =0;
			for(my$i=1;$i<@temp;$i++) 
			{
				my @temp1 = split(/\:/,$temp[$i]);
				if($temp1[1] < $min)
				{
					$min=$temp1[1];
				}
				if($temp1[1] > $max)
				{
					$max=$temp1[1];
				}

			}
			print "$temp[0]";
			for(my$i=1;$i<@temp;$i++) 
			{
				my @temp1 = split(/\:/,$temp[$i]);
				my $n_val = (($temp1[1]-$min)/($max-$min));
				my $rounded = sprintf("%.10f",$n_val);
				print " $temp1[0]:$rounded";
			}
			print "\n";

		}
