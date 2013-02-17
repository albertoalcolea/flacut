flacut
======

Automated system for cutting up and tagging ".flac" files using the associated ".cue" files


Dependencies
------------
  * **cuetools**
  * **lltag**


Instalation
-----------
Place flacut in `/usr/local/bin`, preferred, or in `/usr/bin` (or any other existing directory in your 
$PATH environment variable)


Usage
-----

    flacut [options] flac_file cue_file


### Options
  * `-r`, `--rename` - rename format (like lltag format)
  * `-d`, `--delete` - delete the origin files (.flac and .cue) after cutting
  * `-h`, `--help` - show help

  Default format: "%n - %t". See lltag help for more information.

### Examples

    flacut bigflac.flac cueinfo.cue
  
The basic use.
  
    flacut -r "%n - %t" bigflac.flac cueinfo.cue
    
Will rename the multiple flac files with the number and title of track.
