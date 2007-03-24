package MooseX::TypeLibrary::Moose;

=head1 NAME

MooseX::TypeLibrary::Moose - Types shipped with L<Moose>

=cut

use warnings;
use strict;

use MooseX::TypeLibrary;
use Moose::Util::TypeConstraints ();
use namespace::clean;

=head1 SYNOPSIS

  package Foo;
  use Moose;
  use MooseX::TypeLibrary::Moose qw( Int Str );
  use Carp qw( croak );

  has 'name',
    is  => 'rw',
    isa => Str;

  has 'id',
    is  => 'rw',
    isa => Int;

  sub add {
      my ($self, $x, $y) = @_;
      croak 'First arg not an Int'  unless is_Int($x);
      croak 'Second arg not an Int' unless is_Int($y);
      return $x + $y;
  }

  1;

=head1 DESCRIPTION

This package contains a virtual library for L<MooseX::TypeLibrary> that
is able to export all types known to L<Moose>. See L<MooseX::TypeLibrary>
for general usage information.

=cut

# all available builtin types as short and long name
my %BuiltIn_Storage 
  = map { ($_) x 2 } 
    Moose::Util::TypeConstraints->list_all_builtin_type_constraints;

=head1 METHODS

=head2 type_storage

Overrides L<MooseX::TypeLibrary::Base>' C<type_storage> to provide a hash
reference containing all built-in L<Moose> types.

=cut

# use prepopulated builtin hash as type storage
sub type_storage { \%BuiltIn_Storage }

=head1 SEE ALSO

L<MooseX::TypeLibrary::Moose>,
L<Moose>, 
L<Moose::Util::TypeConstraints>

=head1 AUTHOR AND COPYRIGHT

Robert 'phaylon' Sedlacek C<E<lt>rs@474.atE<gt>>, with many thanks to
the C<#moose> cabal on C<irc.perl.org>.

=head1 LICENSE

This program is free software; you can redistribute it and/or modify
it under the same terms as perl itself.

=cut

1;
