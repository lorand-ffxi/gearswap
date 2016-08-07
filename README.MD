# GearSwap User Files by Lorand

## Please keep backups of your existing files before switching to new versions of mine!

## I now require new, additional libraries that can be found here: https://github.com/lorand-ffxi/lor_libs

Instructions for where to place the new libraries are in their readme.

The new libraries are not finalized yet.  Recent versions will notify you when dependencies on new versions are not met (i.e., when you need to update them).


## Installation & Configuration

Place these files directly in .../Windower/addons/GearSwap/data/

### Gear

Gear files go in the .../GearSwap/data/gear/ directory.  My files are included for reference.

File name format: CharacterName_JOB_gear.lua

### Settings

For character-specific settings, it will look for files in this order:
settings_CharacterName.lua
CharacterName_settings.lua
settings_deault.lua

The first file that it finds will be loaded, and any others will be ignored.

To initialize a character-specific settings file, I recommend making a copy of settings_default.lua and naming it settings_CharacterName.lua (replacing "CharacterName" with your character's name).

You should make changes to your character-specific settings file instead of settings_default.lua because I may make changes to the default file at any time without warning since it is the one that I use.

### Other files

You shouldn't need to worry about any files other than the settings file, or gear files.  The other files contain the functions that make everything work.





## Gear Sets

(More details soon)


## Modes

(More details soon)





## Other Features

Other features can be accessed by custom commands via `//gs c <command>` (e.g., `\\gs c export`)

### Exporter

I originally wrote my own exporter because I did not support augments (I fully support augments now), and because I didn't like some of the formatting used by GearSwap's built-in exporter.

Exports currently equipped gear to: .../GearSwap/data/export/<CharacterName>_<date>_<time>_<JOB>.lua

**Command:** `//gs c export [list | group] [no_augs] <set_name>`

**Options:**
All arguments are optional.

| Option | Description |
| --- | --- |
| list | Print each item on a separate line (default) |
| group | Print items grouped by equipment window rows |
| no_augs | Do not include item augments (default: include augments) |
| set_name | Set name to print in the file (default: sets.exported) |

### Inventory Management

A number of functions are available that can help determine what you need to retrieve from storage, or what you are able to store, based on the equipment defined in your job-specific gear luas.

Below, "required" refers to an item that is included in your currently loaded Player_JOB_gear.lua file.

#### List items that are storable with a Porter Moogle

**Command:** `//gs c storable <bag_name>`

**Options:**
All arguments are optional.

| Option | Description |
| --- | --- |
| bag_name | Name of the bag you want to inspect (default: all) |

**Output:**
A list of Porter Moogle slips, and the items you possess that can be stored under that slip.

#### List inventory clutter

**Command:** `//gs c inv_check`

**Output:**
A list of items that you have in your primary inventory that aren't required.

#### List required items stored with a Porter Moogle

**Command:** `//gs c slips`

**Output:**
A list of Porter Moogle slips, and the required items that are currently stored under that slip.

#### List required items in unequippable bags

**Command:** `//gs c misplaced`
**Alias:** `//gs c missing`

**Output:**
A list of bag names from which gear cannot be equipped, and the required items in that bag.

### Misc

#### Announce augments on currently equipped gear

**Command:** `//gs c augs2chat [/l | /p | /t <name>]`

**Output:**
Sends a message to the specified chat channel that lists the augments on your currently equipped gear.

#### Announce currently equipped set

**Command:** `//gs c set2chat [/l | /p | /t <name>]`

**Output:**
Sends a message to the specified chat channel that lists your currently equipped gear.
