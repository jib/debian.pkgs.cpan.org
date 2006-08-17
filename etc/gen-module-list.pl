use strict;
use CPANPLUS::Backend;
use Module::Load;

my $Pkg = 'Module::Phalanx100';
my $Up  = @ARGV ? 1 : 0;

if( $Up ) {
    my $CB  = CPANPLUS::Backend->new;
    my $Mod = $CB->module_tree($Pkg);

    $Mod->install unless $Mod->is_uptodate;
}

load $Pkg; $Pkg->import;

print join $/, $Pkg->modules;
