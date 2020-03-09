#!/usr/bin/perl
use strict;
use warnings;

# Scalar variable
my $variable = 1;
print $variable, "\n";

# Arrays
my @numbers = (1,2,3); # array of ints
print @numbers, "\n";
print $#numbers + 1 # array length
foreach(@numbers) {
    print "$_ ";   
}

print "\n";

my @reversed = reverse @numbers;
foreach(@reversed) {
    print "$_ ";   
}

print "\n";

my @languages = ("Java", "C++", "Perl");
print @languages, "\n";
print $languages[$#languages], "\n"; # access last element

# Hashes
my %lang_ext = (
    "Java" => ".java",
    "C++" => ".cpp",
    "Perl" => ".pl"
)

my $lang_ext_keys = keys %lang_ext;
my $lang_ext_values = values %lang_ext;
