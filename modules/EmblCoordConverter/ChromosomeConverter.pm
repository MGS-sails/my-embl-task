#!/usr/bin/perl;

#PLEASE NOTE: It was not not necessary for me to have fetched the Chromosome record, using the Bio::EnsEMBL::Registry.
#        This has been done simply to demonstrate usage of the EnsEMBL API.
package EmblCoordConverter::ChromosomeConverter;
use 5.18.4;
use strict;
use warnings;

use Bio::EnsEMBL::Registry;
my $registry = 'Bio::EnsEMBL::Registry';

$registry->load_registry_from_db(
    -host => 'ensembldb.ensembl.org',
    -user => 'anonymous'
);
 
use HTTP::Tiny;
 
my $http = HTTP::Tiny->new();

my $cs_adaptor = $registry->get_adaptor( 'Human', 'Core', 'CoordSystem' );
my $cs = $cs_adaptor->fetch_by_name('chromosome');

=convert function

  Arg [1]    : string $region_input
               The name of the sequence region to convert FROM
               optional, defaults, to 10 as specified in the task description
  Arg [2]    : int $start_input
               The start of the region to convert FROM
               optional, defaults to 25000 as specified in the task description
  Arg [3]    : int $end_input
               The end of the region to convert FROM
               optional, defaults to 30000 as specified in the task description
  
  Description: Converts Chromosome coordinates from GRCh38 to GRCh37 assembly
  
  PLEASE NOTE: It was not not necessary for me to have fetched the Chromosome record, using the Bio::EnsEMBL::Registry.
        This has been done simply to demonstrate usage of the EnsEMBL API.

=cut


sub convert {
  my $self = shift;
  my $region_input = shift || '10';
  my $start_input = shift || 25000;
  my $end_input = shift || 30000;
  my $slice_adaptor = $registry->get_adaptor( 'Human', 'Core', 'Slice' );
  my $slice = $slice_adaptor->fetch_by_region( 'chromosome', $region_input, $start_input, $end_input);
  my $start      = $slice->start();
  my $end        = $slice->end();
  my $strand     = $slice->strand();
  
  my $server = 'http://rest.ensembl.org';
  my $ext = "/map/human/GRCh38/$region_input:$start..$end:$strand/GRCh37?";
  my $response = $http->get($server.$ext, {
    headers => { 'Content-type' => 'application/json' }
  });
   
  die "Failed!\n" unless $response->{success};
  
  use JSON;
  use Data::Dumper;
  if(length $response->{content}) {
    my $hash = decode_json($response->{content});
    local $Data::Dumper::Terse = 1;
    local $Data::Dumper::Indent = 1;
    print Dumper $hash;
    print "\n";
  }  
}
1;
 