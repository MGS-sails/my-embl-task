# Alternative ways of converting coordinates

### Navigating from GRCh37 site to corresponding location on main website:

**Description:**
This involves visiting the main website, finding the chromosome 10, from 25000 to 30000, and then clicking on Ensembl GRCh37 from the Other genome browsers option. 

**Advantages of this approach include:**
The graphical user interface, which makes the data more easily accessible to a wider range of users.
I would say this is probably the more straightforward way of converting the coordinates for a specific chromosome.

**The disadvantages to this include:**
This would have to be done one at a time as opposed to accessing the  Ensemble REST API using a PERL script, where you could write a script to convert multiple coordinates at one time.


### Using the Assembly Converter Tool

**Description:**
This involves using the online Assembly converter tool, found in the web tools section of the website.

**Advantages include:** 
Having a graphical user interface.
Ability to convert multiple regions at once, by uploading a data file.

**Disadvantages**
Conversion is not done instantly, ad jobs are added to a queue. I can imagine that this would also take a longer time as you scale up.
would be limited in what and how you can define the details of your request as you are able to through the API
Users need genome browser software or similar to view the outputted data file.
