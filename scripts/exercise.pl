#!/usr/bin/perl
use strict;
use warnings;

my $inputListPath = "resources/input/list.txt";
my $seqDirPath = "resources/input/seq/";

# Arg: relative file name to open
sub openFileAndGetInputStream {
    my $fileName = shift;
    open(my $stream, "<", "$fileName") or print "Could not open file - $!\n";
    return $stream;
}

# Arg: file name to append to built path
sub seqFileNameBuilder {
    my $line = shift;
    my $correctedLine = substr($line, 0, 4);
    my $suffix = "_seq.txt";
    my $fileName = "$seqDirPath$correctedLine$suffix";
    return $fileName;
}

sub generateResultForFile {
    my $fileName = shift;
    my $seqFileName = seqFileNameBuilder($fileName);
    my $seqFileInputStream = openFileAndGetInputStream("$seqFileName");
    my @seqFileLines = <$seqFileInputStream>;
    my $firstColumnChar = substr($fileName, 4, 5);
    my $firstResultLine;
    my $secondResultLine;

    foreach(@seqFileLines) {
        my $line = $_;
        if (substr("$line", 0, 1) eq $firstColumnChar) {
            my $delimited = split("/,/", $line);
            print $delimited;

            # TODO: values from 3rd and 4th column of split string
        }
    }
}

my $inputStream = openFileAndGetInputStream($inputListPath);
my @inputListLines = <$inputStream>;

# foreach(@inputListLines) {
#     generateResultForFile("$_");
# }

# For testing purposes: take only one argument and run algoritm with it
# my $fileToTest = "$inputListLines[0];"
my $fileToTest = "3K71B";
generateResultForFile("$fileToTest");
