# Codex Marianus from the Corpus Cyrillo-Methodianum Helsingiense

This is an updated version of the [Codex
Marianus](http://www.helsinki.fi/slaavilaiset/ccmh/marianus.html) from the
[Corpus Cyrillo-Methodianum
Helsingiense](http://www.helsinki.fi/slaavilaiset/ccmh/index.html).

The corrections have been backported from the [PROIEL
treebank](http://proiel.github.io) version of Codex Marianus, which was
originally derived from the CCMH version.

Included is also a conversion to UTF-8. The converted version comes as a comma
separated (CSV) file with the following columns:

Column number | Column name | Description
--------------|-------------|------------------------------------------------
0             | `BOOK`      | Name of Gospel ("MATT", "MARK", "LUKE", "JOHN")
1             | `CHAPTER  ` | Chapter chapter
2             | `VERSE`     | Verse number
3             | `LINE`      | Line number (see below)
4             | `TEXT`      | The text itself

The following peculiarities have been inherited from the [upstream
version](http://www.helsinki.fi/slaavilaiset/ccmh/marianus.html):

> In the beginning of each Gospel (except for Matthew, the beginning of which is
> missing in the codex) there is a "00-chapter, 00-verse" section into which the
> pericope lists found in the codex are placed. In these passages the line
> division does correspond to that of the codex.

In all other cases the `LINE` column signifies the

> line number inside the verse (in the file, not in the codex: 0,1,2,...)

Note that the conversion to UTF-8 is not completely faithful to the original as
it is not currently possible to represent all the superscripts correctly. If
this matters to you, you should re-run the conversion script, which will print
warnings for all unconverted superscripts.
