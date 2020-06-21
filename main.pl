#!/usr/bin/perl
use 5.18.4;
use strict;
use warnings;
use EmblCoordConverter::ChromosomeConverter;

my ($region, $start, $end) = @ARGV;

EmblCoordConverter::ChromosomeConverter->convert($region, $start, $end);