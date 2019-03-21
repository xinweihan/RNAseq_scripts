#!/usr/bin/env perl

use warnings;

if ($#ARGV != 3){die "Usage: perl $0 THREAD_NUM GENOME_DIR FASTQ_LIST OUTPUT_DIR\n";}

open(INPUT,"$ARGV[2]") or die "cannot read $ARGV[0]: $!";
while(<INPUT>){
	chomp;

	my @field = split /\t/,$_;

	system "STAR --runThreadN $ARGV[0] --genomeDir $ARGV[1] --readFilesIn $field[0] $field[1] --readFilesCommand zcat --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $ARGV[3]/$field[2]";
}