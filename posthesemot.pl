#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;

#Script to compile the thesaurus used by parody.pl from the various data files thes.dat pos.dat and emot.dat

sub zip (\@\@) {
    my $max = -1;
    $max < $#$_ && ( $max = $#$_ ) foreach @_;
    map {
        my $ix = $_;
        map $_->[$ix], @_;
    } 0 .. $max; 
}

my $thes;
open $thes, '<', 'thes.dat' or die "Failed to open ./thes.dat\n";
my %synonyms = map {chomp $_; my ($key, $val) = split /\t/, $_, 2; ($key, [split /\t/, $val]) } <$thes>;
close $thes or die "Couldn't close ./thes.dat\n";

my $pos;
open $pos, '<', 'pos.dat' or die "Failed to open ./pos.dat\n";
my %parts = map {chomp $_; split /\t/, $_, 2} <$pos>;
close $pos or die "Couldn't close ./pos.dat";

my $emot;
open $emot, '<', 'emot.dat' or die "Failed to open ./emot.dat\n";
my @fields = ('Description','Word No.','Valence Mean','Valence SD','Arousal Mean','Arousal SD','Dominance Mean','Dominance SD','Word Frequency');
my %emotion = map {chomp $_; my ($key, $val) = split /\t/, $_, 2; ($key, [split /\t/, $val] )} <$emot>;
close $emot or die "Couldn't close ./emot.dat";

foreach my $word (keys %synonyms) {
	my $rec = $word."_";
	if (exists $emotion{$word}) {
		$rec .= ($emotion{$word}[1]-5).",".($emotion{$word}[3]-5).",".($emotion{$word}[5]-5)."_";
	} else {
		$rec .= "_";
	}
	$rec.= (exists $parts{$word} and $parts{$word})?$parts{$word}."\t":"\t";
	foreach my $syn (@{$synonyms{$word}}) {
		chomp $syn;
		$rec .= $syn."_";
		if (exists $emotion{$syn}) {$rec .= ($emotion{$syn}[1]-5).",".($emotion{$syn}[3]-5).",".($emotion{$syn}[5]-5)."_";} else {$rec .= "_";}
        	$rec .= (exists $parts{$syn} and $parts{$syn})?$parts{$syn}."\t":"\t";
	}
	$rec =~ s/\n//g;
	$rec =~ s/\t$/\n/;
	print $rec;
}
