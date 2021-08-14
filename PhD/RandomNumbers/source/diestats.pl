#!/usr/bin/perl -w
#
# Script to analyse the output of diequick and produce per-test stats 
# and a total stats.
##
## Uses the method by Johnson 

#Article [Johnson:1996]
#Author:  Johnson B. C.
#Title:   Radix-b extensions to some common empirical tests for pseudorandom number generators.
#Journal: ACM Transactions on Modelling and COmputer Simulation
#Date:    1996
#Volume:  6
#Number:  4
#Pages:   261-273

$usage="Please give filename to analyse";
 
$arg1 = shift(@main::ARGV) || die $usage;

processfile($arg1);

my $total;
my $current;
my $tst;

sub processfile {
    my $file = shift(@_);

    $total = 0;
    $current = 0;
    $tst = "";

    open F, "$file" || die "Cannot open file $file for reading";
    while(<F>) {
	chop;
	if (/begin/) {
	    (my $b,$e) = split;
	    dostart($e);
	}
	elsif (/end/) {
	    (my $e) = split;
	    doend();
	}
	else {
	    (my $val) = split;
	    dovalue($val);
	}
    }
    print "Total $total\n";
}

sub dostart {
    my $e = shift;
    $tst = $e;
    $current = 0;
}

sub doend {
    $total += $current;
    print "$tst  $current\n";
}

sub dovalue {
    my $val = shift;

    if($val >= 0.998) {
	$current += 4;
    } elsif ($val >= 0.95 && $val < 0.998) {
	$current += 2;
    } else {
    }
}
