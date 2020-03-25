#!/usr/bin/perl
use strict;
use warnings;

my $inputListPath = "resources/input/list.txt";
my $outputResultPath = "resources/output/results.txt";
my $seqDirPath = "resources/input/seq/";

# Arg: relative file name to open
sub openInputFileAndGetInputStream {
    my $fileName = shift;
    open(my $stream, "<", "$fileName") or return 0;
    return $stream;
}

# Arg: relative file name to open
sub openOuputFileAndGetOutputStream {
    my $fileName = shift;
    open(my $stream, ">", "$fileName") or die "Could not open output file - $!\n";
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

# Arg: character to check
sub isForbiddenChar {
    my $argument = shift;
    my @forbidden = ("_", "-", "X");
    foreach(@forbidden) {
        if ($argument eq $_) {
            return 1;
        }
    }

    return 0;
}

# Arg: name of file
# arg: output stream
sub generateResultForFile {
    my ($fileName,$outputStream) = @_;
    my $seqFileName = seqFileNameBuilder($fileName);
    my $seqFileInputStream;

    unless ($seqFileInputStream = openInputFileAndGetInputStream("$seqFileName")) {
        return;
    }

    my @seqFileLines = <$seqFileInputStream>;
    my $firstColumnChar = substr($fileName, 4, 5);
    chomp $firstColumnChar;
    
    my $firstResultLine;
    my $secondResultLine;

    foreach(@seqFileLines) {
        my $line = $_;
        my $firstLineChar = substr($line, 0, 1);
        chomp $firstLineChar;

        if ($firstLineChar eq $firstColumnChar) {
            my @delimited = split(',', $line);
            my $firstCharToAppend = $delimited[1];
            my $secondCharToAppend = $delimited[2];

            my $res = isForbiddenChar($firstCharToAppend);

            if (isForbiddenChar($firstCharToAppend) or isForbiddenChar($secondCharToAppend)) {
                next;
            }

            $firstResultLine = $firstResultLine . $firstCharToAppend;
            $secondResultLine = $secondResultLine . $secondCharToAppend;
        }
    }

    my $correctedFileName = lc substr($fileName, 0, 4);
    chomp $correctedFileName;
    my $header = "> " . $correctedFileName . "_" . $firstColumnChar . "\n";
    print $outputStream $header;
    print $outputStream $firstResultLine, "\n";
    print $outputStream $secondResultLine, "\n";
    print $outputStream "\n";
}

my $inputStream = openInputFileAndGetInputStream($inputListPath);
my $outputStream = openOuputFileAndGetOutputStream($outputResultPath);
my @inputListLines = <$inputStream>;

foreach(@inputListLines) {
    generateResultForFile("$_", $outputStream);
}

close $inputStream;
close $outputStream;
