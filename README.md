# Perl Training

## Overview

This repository is dedicated for training Perl language.

## Prerequisites

* [Perl](https://www.perl.org)

## Installation

* move to the desired directory
```bash
$ git clone https://github.com/mjakobczyk/perl-training.git
$ cd perl-training
```
* import project to code editor or IDE


## Problem description

Given following steps:
- download data 
- data structure is as it follows:

```vim
$ ls -la
list.txt
seq/
examplary-result.txt
```

- structure of `list.txt` if as it follows:

```bash
$ cat list.txt
1A2VC
# other lines
```

- first four signs indicate the name of the file to look for in `seq` directory, the last sign is the one that will be a starting sign of lines inside the file that should be parsed
- if file does not exist then ommit this line and proceed

```
1A2VC
=> 1a2v is a initial part of file name
=> C is a first sign of lines that should be parsed
```

- inside a file there are multiple columns
- if a line starts with a desired sign there should be values from 3rd and 4th columns taken

```bash
C 300,R,E,-137.3, 165.4
=> first value to take: R
=> second value to take: E
```

- final result should consist of name of every file that has been parsed and two more lines - the first one consisting of  first value taken and second one consisting of second value taken

```vim
$ cat results.txt
> 1a2v_c
R
E
```

## Usage

This section covers details on how to run the code.

### Examples

```vim
$ cd examples
$ perl hello-world.pl
```

### Excersise

```vim
$ cd exercise
```
