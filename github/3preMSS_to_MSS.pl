#!/usr/bin/perl

use strict;
use warnings;


#最初か最後に内容、作者、バージョンを書く
#======================================================================================================
#Kanta Ochiai v.0.1:23/05/18
#"3preMSS_to_MSS.pl" can be used for gff files output by "2newgff_to_preMSS.pl". 
#"3preMSS_to_MSS.pl" adds join() if there are multiple CDS regions for each gene. 
#======================================================================================================

my @lines = ();

while (<>) {
      chomp;
      my ($id, $sequence) = split(/,/, $_, 2);
      
      if ($sequence =~ /,/) {
      	my $str1 = 'join(';
      	my $str2 = ')';
      	my $newsequence = $str1 . $sequence . $str2;
      	push(@lines, ($id, ',', $newsequence, "\n"));
      	
      	} else {#そうでないなら、
      	push(@lines, ($id, ',', $sequence, "\n"));
      	}
      }
      
      print @lines; #最後の行をプリント
      

