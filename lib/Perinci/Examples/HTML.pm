package Perinci::Examples::HTML;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

$SPEC{':package'} = {
    v => 1.1,
    summary => 'Examples related to HTML form generation',
};

$SPEC{hello1} = {
    v => 1.1,
    summary => "Accept a choice of salutation, an optional name and return a greeting",
    description => <<'_',

The acceptable name is restricted to safe characters only so it is safe when it
needs to be displayed as HTML without any escaping.

_
    args => {
        salutation => {
            schema => ['str*', in=>['Mr', 'Mrs']],
            pos => 0,
        },
        name => {
            schema => ['str*', match=>qr/\A[A-Za-z0-9_- ]+\z/],
            pos => 1,
        },
    },
};
sub hello1 {
    my %args = @_;

    my $salutation = $args{salutation};
    my $name = $args{name};

    if (!$salutation) {
        $name //= "you";
    } else {
        $name //= "unnamed";
    }

    [200, "OK", "Hello, ".($salutation ? "$salutation ":"")."$name!"];
}

1;
# ABSTRACT:

=head1 DESCRIPTION
