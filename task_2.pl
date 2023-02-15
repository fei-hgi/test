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

open IN, "<$fqFile" or die "Cannot open the fastq file to read.\n";

my $seqnum = 0;

my $basenum = 0;
my $baseindex = 1;

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
elsif($opt_b)
{
    print "====> Couting the number of bases.\n";
    while(<IN>)
    {
        chomp $_;
        if($_ ne "")
        {
            if($baseindex == 2)
            {
                $basenum = $basenum + length($_);
                $baseindex++;
            }
            elsif($baseindex == 4)
            {
                $baseindex = 1;
            }
            else
            {
                $baseindex++;
            }
        }
    }
    print "No. of bases: ".$basenum."\n";
}
else
{
    print "====> Nothing Running, please provide flag to count.\n"
}


