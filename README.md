INSTALL
=======

You just need to add the thesaurus data onto the end of the parody perl script.

    cat parody posthes.dat > ~/bin/parody
    chmod a+x ~/bin/parody

THESAURUS DATA
==============

The parody thesaurus is compiled from the Moby thesaurus synonyms and parts of speech files
created and distributed by Grady Ward in the public domain.
For more details on the Moby project formats and data see: http://en.wikipedia.org/wiki/Moby_Project

The thesaurus file posthes.dat with this distribution comes in the following format:

    devil__NV	annoy__V	bake__tiN	beast__N

Here "devil" is the target word, with a tab delimited list of synonyms to choose from.
Only three are shown for the sake of clarity! Each entry is in turn underscore delimited
for "word text"_"emotional content"_"parts of speech".

Emotional content data is not included with this distribution as the data is not open source,
or available to the general public.

Below is the previous example with emotional content scores added:

    devil_-2.79,1.07,0.35_NV	annoy_-2.26,1.49,0.0899999999999999_V	bake_1.17,0.0999999999999996,0.49_tiN	beast_-0.77,0.57,-0.11_N

As you can see "baking" is more positive than "annoying".
The three numbers (mean scores) for emotional content are comma delimited and represent:
Valence, Arousal, and Dominance.
For some info see http://en.wikipedia.org/wiki/Valence_(psychology).

You can use the posthesemot.pl tool to compile your own thesaurus with emotional content,
this isn't "supported" but is put here so that anyone can have a go hacking if they wish!