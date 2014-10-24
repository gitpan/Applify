use warnings;
use strict;
use lib qw(lib);
use Test::More;
use Applify ();

plan skip_all => 'Moose is not available' unless(eval 'use Moose; 1');
plan tests => 5;

{
    eval q[
        package My::Class;
        use Moose;
        has exit_value => (is => 'ro', default => 123);
        has o_foo => (is => 'ro', lazy_build => 1);
        sub _build_foo { -1 }
        sub do_stuff { print "some stuff...\n" }
        $INC{'My/Class.pm'} = 'MOCK';
    ] or die $@;

    local @ARGV = qw/ --o-foo 42 /;
    my $app = eval q[
        use Applify;
        extends 'My::Class';
        option int => o_foo => 'Some option';
        app {
            my $self = shift;
            $self->do_stuff;
            return $self->exit_value;
        };
    ] or die $@;

    $app->run;

    can_ok($app, qw/ run o_foo exit_value do_stuff /);
    is($app->exit_value, 123, 'exit_value == 123');
    is($app->o_foo, 42, 'o_foo == 42');
    ok($app->has_o_foo, 'has_o_foo == 1');
    $app->clear_o_foo;
    ok(!$app->has_o_foo, 'has_o_foo == 0');
}
