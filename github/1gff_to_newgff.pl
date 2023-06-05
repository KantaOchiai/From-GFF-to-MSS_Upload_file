#!/usr/bin/perl

use strict;
use warnings;


#======================================================================================================
#Kanta Ochiai v.0.1:23/05/18
#
#Extract the ID (column 8), gene orientation(column 6), and CDS (column 3, 4) region from gff file. It can be used for gff files that contain only CDS regions.
#For example (excluding the first #)
#contig1	lemon	CDS	5368	5642	.	+	.	ID=Bplumosa0014567.mrna1.cds1;Parent=Bplumosa0014567.mrna1
#contig1	lemon	CDS	5986	6142	.	+	.	ID=Bplumosa0014567.mrna1.cds1;Parent=Bplumosa0014567.mrna1
#contig1	lemon	CDS	16157	16509	.	-	.	ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1
#contig1	lemon	CDS	16603	16782	.	-	.	ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1
#contig1	lemon	CDS	17221	17437	.	-	.	ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1
#contig1	lemon	CDS	17511	17666	.	-	.	ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1
#contig1	lemon	CDS	22930	23182	.	-	.	ID=Bplumosa0010795.mrna1.cds1;Parent=Bplumosa0010795.mrna1
#contig1	lemon	CDS	23276	23292	.	-	.	ID=Bplumosa0010795.mrna1.cds1;Parent=Bplumosa0010795.mrna1
#======================================================================================================


my @raw = ();

#ループ処理
while (<>) { #ファイルハンドルSTDINやコマンドライン引数に指定されたファイルを読み込んで、1行ずつ特殊変数$_に読み込むperlの特殊な書き方 、ダイヤモンド演算子という。
    chomp; #chomp関数で末尾の改行コードを捨てる（変数を指定していない時は特殊変数$_(直前に実行したコマンドの最後の引数；ここではwhile）が対象になる。＄_には指定したアノテーションファイルが１行読み込まれているはず）
    
    push (@raw, $_);
    }
    
my @oldlines = ();    

    foreach (@raw){
     my @column = split(/\t/, $_); 
     push (@oldlines, "$column[8]$column[6] $column[3] $column[4]"); #８行目のIDと３，４行目の配列を配列データとしてまとめる
     }

     my @newgff =join ("\n", @oldlines);
     
print "$_\n" for @newgff; #最後の行をプリント


