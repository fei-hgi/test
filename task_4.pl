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

my $seqnum = 0;

if($opt_s)
{
    print "====> Couting the number of sequences.\n";
    while(<IN>)
    {
        chomp $_;
        if($_ ne "")
        {
            $seqnum++;
        }
    }
    print "No. of sequences: ".($seqnum/4)."\n";
}
else
{
    print "====> Nothing Running, please provide flag to count.\n"
}

