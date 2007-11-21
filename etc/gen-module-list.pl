use strict;
use CPANPLUS::Backend;
use Module::Load;

my $Pkg = 'Module::Phalanx100';
my $Up  = @ARGV ? 1 : 0;

if( $Up ) {
    my $CB  = CPANPLUS::Backend->new;
    $CB->configure_object->set_conf( verbose => 0 );

    my $Mod = $CB->module_tree($Pkg);

    unless( $Mod->is_uptodate ) {
        $Mod->fetch;
        $Mod->extract;
        push @INC, $Mod->status->extract .'/lib';
    }      
}

load $Pkg; $Pkg->import;

print join $/, $Pkg->modules;
