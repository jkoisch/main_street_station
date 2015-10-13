# Setting up the Development Integration environment

A specific environment has been created to enable full integration testing on a developer's
local workstation. The environment is called 'dev_integration'. There is some additional 
setup required to prepare the environment for use as the database setup for 'extra' 
environments is not done with the normal database rake steps. These special environment steps
need to be performed in both Gringotts and Mainstreet. There is also a text file that
defines an AppleScript for start all the environments and watching the log files, the 
script is dependant on installing iTerm.

The development integration environment runs on a complete set of ports to avoid collisions
with the normal development server. Mainstreet runs on port 8500 and Gringotts runs on 9100.
To ensure that Mainstreet knows about this connect, it is defined in a ne environments file
in config/environments/dev_integration.rb. There is also a new target in database.yml.

To set up the new environments, perform the following steps:

1. Navigate to gringotts
2. rake db:drop
3. rake db:create
4. rake db:migrate
5. rake db:migrate RAILS_ENV=test
6. rake db:migrate RAILS_ENV=dev_integration
7. rake db:csv:load
8. rake db:csv:load RAILS_ENV=dev_integration
9. Navigate to mainstreet
10. rake db:drop
11. rake db:create
12. rake db:migrate
13. rake db:migrate RAILS_ENV=test
14. rake db:migrate RAILS_ENV=dev_integration


The source for an AppleScript is provided to enable the startup of the integration run
environment from a double-click. Note, the iTerm application is required to be installed
for this script to work. To install the script on your Dev workstation:

1. Open AppleScript Editor (located in the Utilities folder in Applications)
2. Select the entire contents of the script file in a text editor.
3. Create a new AppleScript file (menu File->New)
4. Paste the content copied in step 2
5. Save the file to your desktop

When the integration environment is running, you can perform an orderly shut-down by entering
Ctl-C in each of the tabs of the iTerm. You can then close the tabs.
