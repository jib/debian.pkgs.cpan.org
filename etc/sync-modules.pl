use strict;

use Getopt::Std;
use CPANPLUS::Backend;
use CPANPLUS::Dist::Deb;
use CPANPLUS::Dist::Deb::Constants;

my $conf = CPANPLUS::Backend->new->configure_object;

my $opts = {};
getopts('b:u:', $opts);

my $base = $opts->{'b'} || $conf->get_conf('base');
$conf->set_conf( base => $base );

my $deb  = DEB_BASE_DIR->( $conf, $^X );
my $path = $opts->{'u'} or die usage();


for my $type ( DEB_METAFILE_SOURCES, DEB_METAFILE_PACKAGES ) {
    my $loc = CPANPLUS::Dist::Deb->write_meta_files( 
                                        basedir => $base, type => $type ) 
                or die "Could not write metafile '$type'";

    print "Wrote '$type' to $loc\n";
}

system("rsync -avrH $deb $path") and die "$!";

sub usage { };
