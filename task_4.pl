#!/usr/bin/perl -w

use strict;
use warnings;

use Getopt::Std;
use vars qw($opt_s $opt_b $opt_i);
getopts("sbi:");

my $runningTime = localtime(time);
my $startTime = time;

my $usage = "usage:\n\tperl $0 -option parameter ...\n".
            "\nOptions:\n".
            "\t-s\tget sequence count)\n".
            "\t-b\tget base count\n".
            "\t-i\tthe fastq file\n";

my $fqFile = $opt_i || die "ERROR! Parameter => -i Please provide the fastq file\n$usage\n";

if($fqFile =~ /.gz$/)
{
    open(IN, "gunzip -c $fqFile |") or die "Cannot open the gz file to read.\n";
}
else
{
    open IN, "<$fqFile" or die "Cannot open the fastq file to read.\n";
}


