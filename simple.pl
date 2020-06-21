
#PLEASE NOTE: This implementation of the task is provided, to make running the script easier, by not requiring importing EmblCoordConverter module
#PLEASE NOTE: It was not not necessary for me to have fetched the Chromosome record, using the Bio::EnsEMBL::Registry.
#        This has been done simply to demonstrate usage of the EnsEMBL API.

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

my $version = $cs->version();


my $slice_adaptor = $registry->get_adaptor( 'Human', 'Core', 'Slice' );
my $slice = $slice_adaptor->fetch_by_region( 'chromosome', '10', 25000, 30000);
my $coord_sys  = $slice->coord_system()->name();
my $seq_region = $slice->seq_region_name();
my $start      = $slice->start();
my $end        = $slice->end();
my $strand     = $slice->strand();

 
my $server = 'http://rest.ensembl.org';
my $ext = "/map/human/$version/$seq_region:$start..$end:$strand/GRCh37?";
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
 