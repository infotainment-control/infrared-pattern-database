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


Another topic of concern: Mapping. An honest-to-god database would need to understand
that devices and the information associated with them don't necessarily map to protocols
and commands obviously. For instance, here's a bunch of information you'd think would
functionally determine how to control the cable box I've got...
- brand=Arris
- provider=Spectrum (or was it... Time Warner Cable?)
- model=DCX3200-M

But let's say we've scraped our (as of 3/12) 2 known code sources:
- http://www.remotecentral.com/cgi-bin/codes/
- http://irdb.tk/

We don't have a functional determination of the info. There's no lookup that, given a person
entering "Arris" or "DCX3200-M" or both would yield the correct codes.

Those codes are under an unreasonable-to-know, difficult-to-derive alias:
- brand=Motorola
- model=DCT-2224



This means we need a lookup table. A relation that says
"Oh, you've entered this brand and this model?"
(I'm assuming that's what ought to be enough to yield codes accurately)
"Well, we recognize that pair maps to this real pair: (brand,model)"
"Now why don't you take that pair and use that, instead, to look up the codes?"


..... so, let's step back a second. A user enters their information: a device and model.
(and a device type? not sure yet)
Well, there's three cases:
- brand,model yields a set of commands
- brand,model yields no commands, but yields an alias (which must yield a set of commands)
- brand,model yields no commands and no alias (the device is entirely unknown)

That first case is excellent, as our scraping and database construction (a requisite for
any case, anyhow) is enough to provide the user with the commands they so yearn for.

The second case is good, too, but it took a lot more work. The set of devices whose codes
we know is finite, provided by the databases we can scour. The set of devices whose codes
are under the guise of a different device is possibly quite larger. I bet many, many more
manufacturers and companies reuse the command sets / infrared setups that have already
been created. Companies buy out other companies all the time...

So the seed of all this was me trying to control our cablebox, and it took human searching
to find that the arris dcx3200-m mapped to the motorola dct-2224 from the remotecentral db.
I guess my only proposal is that for our demo purposes, we make sure any devices we wish to
use have their mappings established...

Anyhow, the third case sucks. Can't do anything with it.
