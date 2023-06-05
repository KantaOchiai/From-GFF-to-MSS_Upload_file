#!/usr/bin/perl

use strict;
use warnings;


#最初か最後に内容、作者、バージョンを書く
#======================================================================================================
#Kanta Ochiai v.0.1:23/05/18
#"4MSS_to_newMSS.pl" can be used for gff files output by "3preMSS_to_MSS.pl".
#"4MSS_to_newMSS.pl" adds complement() if gene orientation is negative. Also, the ID is not output, and the CDS region of each gene is output in units of three lines. The output can be copied and pasted into the third column of the MSS Upload file.
#======================================================================================================

my @newlines = ();

foreach (<>) {
        chomp;
	my ($currentid, $rest) = split(/,/, $_, 2);
	
	if ($currentid =~ /-/) {
	my $str3 = 'complement(';
      	my $str4 = ')';
      	my $newrest = $str3 . $rest . $str4;
      	push (@newlines, $newrest);
      	}
      	
      	elsif ($currentid =~ /1+/) {
	push (@newlines, $rest);
      	}
      }
	  
print "$_\n\n\n" for @newlines; #最後の行をプリント
