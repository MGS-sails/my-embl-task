# How to run the script

#### There are 2 possible ways of running this script:

**The intended way to run this script is as follows:**

1. Follow the instructions on the Ensembl Api docs, to install the Perl API:
http://www.ensembl.org/info/docs/api/api_installation.html
2. Add the EMBLCoordConverter Module to your PERL5LIB environment variable:
PERL5LIB=${PERL5LIB}:${HOME}/path-to-the-modules-folder/modules
3. Run the main.pl file using the command: perl main.pl in your terminal.

The main.pl script accepts optional arguments, which are the region name you intend to convert, the start and end coordinates.
for example: 
```
perl main.pl 10 25000 30000
```
this will convert the coordinates on Chromosome 10 (from 25000 to 30000) from the GRCh38 assembly to GRCh37.
If arguments are not passed, it defaults to what was mentioned on the task description, which is the Chromosome 10, from 25000 to 30000.

**The second way of running this script has been done to aid simplicity in running the script.**
This can simply be done by running perl simple.pl from the command line. It converts coordinates on the Chromosome 10, from 25000 to 30000, from the 
GRCh38 assembly to GRCh37 as required in the task.

