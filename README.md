# From-GFF-to-MSS_Upload_file
(1) 1gff_to_newgff.pl

"1gff_to_newgff.pl" can be used for gff or gff3 files that contain only CDS regions. For example, the following input file. 

input.gff

contig1	lemon	CDS	5368	5642	.	+	.	ID=Bplumosa0014567.mrna1.cds1;Parent=Bplumosa0014567.mrna1
contig1	lemon	CDS	5986	6142	.	+	.	ID=Bplumosa0014567.mrna1.cds1;Parent=Bplumosa0014567.mrna1
contig1	lemon	CDS	16157	16509	.	-	.	ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1
contig1	lemon	CDS	16603	16782	.	-	.	ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1
contig1	lemon	CDS	17221	17437	.	-	.	ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1
contig1	lemon	CDS	17511	17666	.	-	.	ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1
contig1	lemon	CDS	22930	23182	.	-	.	ID=Bplumosa0010795.mrna1.cds1;Parent=Bplumosa0010795.mrna1
contig1	lemon	CDS	23276	23292	.	-	.	ID=Bplumosa0010795.mrna1.cds1;Parent=Bplumosa0010795.mrna1

It must be tab-separated, with the position of the sequence in columns 3 and 4, the orientation of the strand on which the CDS is coded in column 6, and the ID, such as the gene name, in column 8.
"1gff_to_newgff.pl" can be extracted the ID (column 8), gene orientation(column 6), and CDS (column 3, 4) region from gff file. If you specify a gff file to input and output, and run with the following command, you will get the following gff file.

$ perl 1gff_to_newgff.pl input.gff > output_1.gff

output_1.gff 

ID=Bplumosa0014567.mrna1.cds1;Parent=Bplumosa0014567.mrna1+ 5368 5642
ID=Bplumosa0014567.mrna1.cds1;Parent=Bplumosa0014567.mrna1+ 5986 6142
ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1- 16157 16509
ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1- 16603 16782
ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1- 17221 17437
ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1- 17511 17666
ID=Bplumosa0010795.mrna1.cds1;Parent=Bplumosa0010795.mrna1- 22930 23182
ID=Bplumosa0010795.mrna1.cds1;Parent=Bplumosa0010795.mrna1- 23276 23292

(2) 2newgff_to_preMSS.pl

"2newgff_to_preMSS.pl" can be used for gff files output by "1gff_to_newgff.pl". 

"2newgff_to_preMSS.pl" can output the CDS regions connected by "..", which is the format specified in the MSS Upload file. If there are multiple CDS regions, they will be output connected by commas to lines with the same ID, as shown below.

output_2.gff

ID=Bplumosa0014567.mrna1.cds1;Parent=Bplumosa0014567.mrna1+ 5368..5642,5986..6142
ID=Bplumosa0010794.mrna1.cds1;Parent=Bplumosa0010794.mrna1- 16157..16509,16603..16782,17221..17437,17511..17666
ID=Bplumosa0010795.mrna1.cds1;Parent=Bplumosa0010795.mrna1- 22930..23182,23276..23292

