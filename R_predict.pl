####################################################################################################
## -- GENERAL INFORMATION                                                                          #
##												   #	
## FILE 		main_program.pl							   	   #	
## AUTHORS		Tarun Pal,Dr. Varun Jaiswal,Dr.Rajinder Singh Chauhan    		   #
## LAST MODIFIED	10-07-2016							           #
##												   #	
## 												   #
##    COPYRIGHT DISCLAIMER									   #
##												   #
##    Disease.pl, is the main interface program of DRPPP			     		   #	
##    Copyright (C) 2016  Tarun Pal,Dr. Varun Jaiswal,Dr.Rajinder Singh chauhan	   		   #	#												   #
##    This program is free software: you can redistribute it and/or modify			   #
##    it under the terms of the GNU Affero General Public License as				   #
##    published by the Free Software Foundation, either version 3 of the			   #	
##    License, or (at your option) any later version.						   #	
##												   #
##    This program is distributed in the hope that it will be useful,				   #	
##    but WITHOUT ANY WARRANTY; without even the implied warranty of				   #	
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                                #
##   GNU Affero General Public License for more details.					   #	
##												   #	
##    You should have received a copy of the GNU Affero General Public License			   #	
##    along with this program.  If not, see <http://www.gnu.org/licenses/>.           		   #
####################################################################################################
#!/usr/bin/perl

use strict;
use warnings;
use Tk;
my $current_file;
my $rb_value1;
my $mw = MainWindow->new;
	$mw->minsize( qw(800 300));
	$mw->configure(-title=>'DRPPP',-background=>'grey');
	$mw->geometry('+100+300');
my $menu=$mw->Frame(-relief=>'groove',-borderwidth=> 3,-background=>'#90CA77')->pack(-side=>'top',-fill=>'x');
my $file_mb=$menu->Menubutton(-text =>'File',-underline => 0,-background=>'#90CA77',-font => [-weight => 'bold',-size => 10])->pack(-side=>'left');



 

$file_mb->command(-label       => "Close",-accelerator => 'Ctrl-w',-underline   => 0,-command     => \&exit,);


my $edit=$menu->Menubutton(-text =>'Edit',-underline => 0,-background=>'#90CA77',-font => [-weight => 'bold',-size=>10])->pack(-side=>'left');
$edit->command(-label=>'Input file',-activebackground=>'#9E3B33',-command=>\&organismtypee1);
$edit->separator;
$edit->command(-label => 'Preferences',-font => [-weight => 'bold',-size=>10],-activebackground=>'#9E3B33');

my $window=$menu->Menubutton(-text =>'Window',-underline => 0,-background=>'#90CA77',-font => [-weight => 'bold',-size=>10])->pack(-side=>'left');
$window->command(-label=>'Website',-activebackground=>'#9E3B33',-command=>\&web);

sub web{
my $url = 'http://14.139.240.55/NGS/download.php';
open_browser($url);
	}

	
my $help=$menu->Menubutton(-text =>'Help',-underline => 0,-background=>'#90CA77',-font => [-weight => 'bold',-size=>10])->pack(-side=>'left');
$help->command(-label => 'Version',-font => [-weight => 'bold',-size=>10], -command =>\&button22,-activebackground=>'#9E3B33');
    $help->separator;
    #$help->command(-label => 'About',-activebackground=>'#9E3B33');

$help->command(-label => 'About',-font => [-weight => 'bold',-size=>10], -command =>\&button21,-activebackground=>'#9E3B33');


 sub button22{
  my $yesno_button22 = $mw->messageBox(-message => "DRPPP Verion 1.0",-type => "OK", -icon => "info");
 }
 sub button21{
  my $yesno_button21 = $mw->messageBox(-message => "The tool aims to provide the scientific community with a novel machine learning method for prediction of disease resistance proteins in plants.",-type => "OK", -icon => "info");
}



my $lb1=$mw->Label(-text => "DRPPP",-font => [-size   => 50,-weight => 'bold'])->pack(-anchor => "nw");

my $lb2=$mw->Label(-text => "DRPPP stands for  Disease resistance plant protein predictor.The model predicted in this study is implemented as a free standalone tool DRPPP to predict R genes.",-font => [-size   => 7,-weight => 'bold'])->pack(-anchor => "nw");


my $fr2=$mw->Frame(-relief=>'groove',-borderwidth=> 3,-background=>'lightblue')->pack(-side=>'top',-fill=>'x');
my $lb4=$fr2->Label(-text =>'Upload input file in fasta format',-background=>'lightblue',-foreground=>'black',-font => [-weight => 'bold',-size=>20])->pack(-side=>'left');
my $button2= $fr2->Button(-text=>'Browse...',-command =>\&organismtypee1,-background=>'grey')->pack(-side=>'right',-anchor => 'se');

my $lb5=$mw->Label(-text => "Note: Submit Proteome file (protein sequences) in fasta format.",-font => [-size   => 7,-weight => 'bold',])->pack(-side=>'bottom');



my $fr3=$mw->Frame(-relief=>'groove',-borderwidth=> 3,-background=>'lightcyan')->pack(-side=>'top',-fill=>'x');


my $button3= $fr3->Button( -text=> ' Help  ',-command => \&button23, -relief => 'raised',-background=>'grey')->pack(-side=>'left', -expand => 1);
my $button4= $fr3->Button( -text=> ' Run  ',-command => \&button24, -relief => 'raised',-background=>'grey')->pack(-side=>'left', -expand => 1);
my $button5= $fr3->Button( -text=> ' Quit ',-command => sub { exit })-> pack();



sub organismtypee1 	{
		my @types =
	       (["All files",		'*'],
		["Text files", [qw/.txt/]],
		["Fasta files", [qw/.fasta/]],
		["Fasta files", [qw/.fa/]],
        
       		);	
$current_file= $mw->getOpenFile(-filetypes => \@types);
print "$current_file\n";
	my @w=split(/\//,$current_file);
	open (F2 ,">./address.txt")or die "file not found";
	print F2 "$w[-1]\n";
	close(F2);
	#my $filename = 'scriptforblast.pl';

	#open(my $fh, '<:encoding(UTF-8)', $filename) or die "Could not open file '$filename' $!";
	#my $row = <$fh>;
	#print "heelo$row";
	#$row =~ s/home\/varun\/mlpal/\f.txt/$current_file/g;
	#write_file($filename, $row);
			}

  sub button23 	{
 			 my $yesno_button33 = $mw->messageBox(-message => "This application uses in-house developed scripts and predicts disease resistant vrs non-disease resisatance proteins in palnts transcriptomes/proteomes.It accepts input file in fasta format containing protein/peptide sequences.",-type => "OK", -icon => "info");
 		}


 sub button24	{
		print "$current_file\n";
		print "The tool is currently running please wait....";
		system("perl -pe 's/X|B|Z|b|z//g unless (/^>/)' $current_file > out0.fasta");
		system("perl individaul_feature_classification.pl out0.fasta");

		system("grep \"\>\" $current_file > outu2");
		my @l = `cat outu2`;
		my @l2 = `cat v3.txt`;
		open(F1,">Result.xls");
		for(my$i=0;$i<@l;$i++)
		{
			if($l2[$i]==1)
			{
				print F1 "Predicted as DR Protein\t$l[$i]";
			}else
			{

				print  F1 "Not Predicted as DR Protein\t$l[$i]";
			}
	
		}

print "\n The tool has predicted the results please refer to Result.xls file";
close(F1);
		}	
 sub button47	{
		my $address;
		open(F1,"./address.txt")or die "file not find";
		while(<F1>)
		{
			chomp($_);
			$address=$_;
		}
		system("./LibSVM/svm-predict $address ./drprotein1.libsvm  ./Output/".$address.".txt");
		}

MainLoop;

