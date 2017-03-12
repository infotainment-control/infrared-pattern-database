# infrared-pattern-database
Repository for code that constructs/builds the infrared commands pattern database

Figuring we can use this to stash backend items that support the application:
- scripts for scraping websites / using website APIs
- raw data (hahaha, store it in a repo? Gross? Yeah, well... It's a school project)
- scripts to build and populate the pattern database, which would contain
  - device information
  - command information
  - pronto hex infrared sequences (consumed by the application for its infrared API usage)
- a gradle file that can work with the main application to construct the app's private database

Storing raw data and database creation/modification scripts here might work
for the main application repo, if that repo's gradle files can access this
repository and pull it in.

If not, however, then a sub-project should be constructed for the main application.
A gradle file there would be able to manage all the build tasks. If that's the route
we go, this repo might just store raw data... Or nothing & we kill it. Who knows!
