#!/usr/bin/perl

use strict;
use warnings;


#最初か最後に内容、作者、バージョンを書く
#======================================================================================================
#Kanta Ochiai v.0.1:23/05/18
#"2newgff_to_preMSS.pl" can be used for gff files output by "1gff_to_newgff.pl". 
#"2newgff_to_preMSS.pl" can output the CDS regions connected by "..", which is the format specified in the MSS Upload file. If there are multiple CDS regions, they will be output connected by commas to lines with the same ID, as shown below.
#======================================================================================================

my $oldid = ""; #変数oldid初期化（"my "）。perlでは変数（$で始まる）は最初にmyで初期化する
my @lines = (); #配列lineも初期化（配列は@で始まる）

#ループ処理
while (<>) { #ファイルハンドルSTDINやコマンドライン引数に指定されたファイルを読み込んで、1行ずつ特殊変数$_に読み込むperlの特殊な書き方 
    
    chomp; #chomp関数で末尾の改行コードを捨てる（変数を指定していない時は特殊変数$_が対象になる。＄_には指定したアノテーションファイルが１行読み込まれているはず）
    my ($currentid, $rest) = split(/ /, $_, 2); #split 関数を使ってタブ文字で区切った2つの変数に行を分割。1列目を $id 変数に、残りを $rest 変数に代入。2は分割最大数を表す。それより大きい時は残りがすべて２つ目の$restに入る
    
    $rest =~ s/ /../g;  # 最後にはカンマ区切りにしたいので、$restに読み込んだ残りの列（数値）はタブをカンマに置換しておく
    
    if ($oldid eq $currentid) { #もし現在の行の1列目が前の行と同じなら
        push(@lines, $rest);#その行の$rest（数値部分だけ）を@lines配列に追加
    } else {#そうでないなら、
        print join(",", $oldid, @lines), "\n" if @lines;#@lines配列に格納されている行（数値）をカンマで連結し、1つの行にまとめて出力。
        $oldid = $currentid; #プリント後、前の行は現在の行にする
        @lines = ($rest); #プリント後、配列には現在の行の$restを入れる
    }
}
print join(",", $oldid, @lines), "\n" if @lines; #最後の行をプリント


