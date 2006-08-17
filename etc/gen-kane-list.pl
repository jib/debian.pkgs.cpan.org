use strict;
use CPANPLUS::Backend;

my $CB      = CPANPLUS::Backend->new;
$CB->configure_object->set_conf( verbose => 0 );

my $auth    = $CB->author_tree('KANE');
my @mods    = $auth->modules;

my %seen;
print join $/, map { $_->name } grep { not $seen{$_->package}++ } @mods; 
