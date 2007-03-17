package TestLibrary;
use warnings;
use strict;

use MooseX::TypeLibrary::Moose qw( Str ArrayRef Int );
use MooseX::TypeLibrary
    -declare => [qw( NonEmptyStr IntArrayRef TwentyThree )];

subtype NonEmptyStr,
    as Str,
    where { length $_ },
    message { 'Str must not be empty' };

coerce NonEmptyStr,
    from Int,
        via { "$_" };

subtype IntArrayRef,
    as ArrayRef,
    where { not grep { $_ !~ /^\d+$/ } @$_ },
    message { 'ArrayRef contains non-Int value' };

coerce IntArrayRef,
    from Int,
        via { [$_] };

subtype TwentyThree,
    as Int,
    where { $_ == 23 },
    message { 'Int is not 23' };

1;
