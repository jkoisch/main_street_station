#Mainstreet
Mainstreet is the meeting place for everything - it all comes through mainstreet. Mainstreet 
is the clearing house, the hub for information in YouCentric. Mainstreet orchestrate all
communications with the the Gringotts secure data store performing necessary conversions 
from external interface formats into the internal Ehmbr JSON format used by Gringotts.

##Interfaces
###FHIR
Mainstreet provides a interface for exchange of FHIR resources under the fhir subdomain. 
Mainstreet supports both XML and JSON interfaces.
 
##Design

##Processes
###YouCentric Smoke Test
Upon a redeploy to Heroku,  it is absolutely necessary to verify the core YouCentric
application is functional. To that purpose a THOR file was created specifically to do some
basic validation (a smoke test) following a Heroku deploy. 

The test will perform some very basic actions against the Mainstreet FHIR interface, a basic 
query on the Mainstreet FHIR conformance, a Patient retrieve (which is currently unsecured
to allow authenticate/unauthenticated testing), a login using a valid YouCentric id (the
YouCentric test user is documented elsewhere) and finally a retrieve of a resource from behind
the authentication wall.

To execute the smoke-test, you should be in the root directory of your Mainstreet Rails app
(the same place that you executed the Heroku push from). The API Test is executed from within
Thor using the following command:
```
$ thor api_test:heroku_smoke_test --username=<testing username>

When the smoke-test reaches the appropriate point, you will be prompted for the password for
the user that you provided on the above line.

The smoke-test will proceed sequentially, any failure will prevent further execution. The
smoke-test must fully complete for a successful deploy to be declared.