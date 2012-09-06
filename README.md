INSTALL
=======

The parody command is written as a Perl script and has several dependencies. At some point
I will release a dependency free (but feature reduced) version of the source.

You'll need to install several CPAN modules:
Getopt::Long, Pod::Usage, Term::ANSIColor, LWP::Simple, Data::Serializer::Data::Dumper

You can get all of the above with the following, using cpanm:

    $ curl -L http://cpanmin.us | perl - --sudo -i Getopt::Long -i Pod::Usage -i Term::ANSIColor -i LWP::Simple -i Data::Serializer::Data::Dumper

or if you only have wget and not curl:

    $ wget -O - http://cpanmin.us | perl - --sudo -i Getopt::Long -i Pod::Usage -i Term::ANSIColor -i LWP::Simple -i Data::Serializer::Data::Dumper

Once you have the dependencies installed, you just need to add the thesaurus data onto the
end of the parody Perl script, and drop it into your PATH.

    $ git clone git://github.com/MattOates/parody.git
    $ cd parody
    $ cat parody posthes.dat > ~/bin/parody
    $ chmod a+x ~/bin/parody

GETTING HELP
============

The perl script should come with its own usage and help built-in, try:

    $ parody --help

Failing this there is a precompiled man page [man.html](parody/blob/master/man.html) in the source.

TRY ONLINE
==========

If you dont want to go through the effort of installing everything you can try this parody script online at:

http://mattoates.co.uk/work/parody.php

This has the advantage of including the emotional thesaurus if you wish to see what sorts of results you 
can acheieve with access to these data.

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