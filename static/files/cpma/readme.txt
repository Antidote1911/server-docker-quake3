=======================
Challenge ProMode Arena
=======================

Website: https://playmorepromode.com
Discord: https://discord.me/cpma

Where did the docs go?
----------------------

The official docs are now hosted here:
https://playmorepromode.com/guides

If the official website is down for any reason,
you can still consult the original source files here:
https://bitbucket.org/CPMADevs/docs/src
If Bitbucket's Markdown preview fails to display properly,
you can click "Raw" to see the raw unformatted content.

Installation
------------

Unzip this archive in the root Quake3/ directory, with folders enabled.
You should have a newly created directory named "cpma" with these files:
- readme.txt - this file
- changelog.txt - a very terse list of additions, changes, and bugfixes
  it is however BY FAR the most important of the docs, so READ IT!
- description.txt - the entry for the mods menu
- z-cpma-pak<version>.pk3 - the mod itself
- a few standard configuration dirs (modes, cfg-maps, classes, ...)

If you're installing CPMA for the first time and you don't have the maps,
grab them from https://playmorepromode.com/files/cpma-mappack-full.zip 
and extract the archive to "baseq3".

Note: you should NEVER change any of the files installed by CPMA: they
will almost certainly be overwritten by future releases. If you want
to customise things like modes, use a different name for your versions.

Full guide: https://playmorepromode.com/guides/cpma-cnq3-installation

Swelt's tips
------------

Joining the game

After connecting to a server, the next step depends on the game type.
For most gametypes, you will initially spawn as a spectator.
To join the game, either press Escape and select a team or join game.
For multi-arenas (maps with several seperate playing areas), hit escape and
select Choose Arena. The list of  arenas are marked DA for Duel Arena (1v1) or
CA for Clan Arena. If an arena has CPM in red after the name, this signifies
that it is using ProMode settings. Once you are in the arena you want to be,
hit escape again to select a team, or type /team r or /team b to join up.

Config files

The easiest way to give Quake 3 a bunch of config settings is to write a config
file. This is a simple text file which you can execute within the game to pass
Quake 3 all the settings it contains. To create a new config file, create a new
blank text file and enter a list of settings. Save this file in the cpma 
directory with the ".cfg" extension. For instance, I would create a file called 
"swelt.cfg". To apply the settings in the config, type "/exec configname"
(e.g. "/exec swelt") in the console. No need to type the ".cfg" at the end.
