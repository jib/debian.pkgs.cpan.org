###############################################
###           CPANPLUS::Config              ###
###  Configuration structure for CPANPLUS   ###
###############################################

#last changed: Mon Oct 31 11:57:23 2005 GMT

### minimal pod, so you can find it with perldoc -l, etc
=pod

=head1 NAME

CPANPLUS::Config

=head1 DESCRIPTION

This is your CPANPLUS configuration file. Editing this
config changes the way CPANPLUS will behave

=cut

package CPANPLUS::Config;

$VERSION = "0.050_04";

$MIN_CPANPLUS_VERSION = "0.050_03";

use strict;

sub new {
    my $class = shift;

    my $conf = {
                 '_build' => {
                               'autdir' => 'authors/',
                               'autobundle' => 'autobundle/',
                               'autobundle_prefix' => 'Snapshot',
                               'distdir' => 'dist/',
                               'moddir' => 'build/',
                               'plugins' => 'plugins/',
                               'sanity_check' => 1,
                               'startdir' => '',
                             },
                 '_daemon' => {
                                'password' => '',
                                'port' => '1337',
                                'username' => 'cpanplus'
                              },
                 '_dist' => {
                              'CPANPLUS::Dist::Build' => 1,
                              'CPANPLUS::Dist::MM' => 1
                            },
                 '_fetch' => {
                               'blacklist' => [
                                                'ftp'
                                              ]
                             },
                 '_mirror' => {
                                'auth' => 'authors/01mailrc.txt.gz',
                                'base' => 'authors/id/',
                                'dslip' => 'modules/03modlist.data.gz',
                                'mod' => 'modules/02packages.details.txt.gz'
                              },
                 '_source' => {
                                'auth' => '01mailrc.txt.gz',
                                'dslip' => '03modlist.data.gz',
                                'hosts' => 'MIRRORED.BY',
                                'mod' => '02packages.details.txt.gz',
                                'stored' => 'sourcefiles',
                                'update' => '86400'
                              },
                 'conf' => {
                             'allow_build_interactivity' => 1,
                             'base' => $ENV{HOME} . '/.cpanplus',
                             'buildflags' => '',
                             'cpantest' => 0,
                             'debug' => 0,
                             'dist_type' => '',
                             'email' => 'cpanplus@example.com',
                             'extractdir' => '',
                             'fetchdir' => '',
                             'flush' => 1,
                             'force' => 0,
                             'hosts' => [
                                          {
                                            'host' => 'www.cpan.org',
                                            'path' => '/',
                                            'scheme' => 'http'
                                          },
                                          {
                                            'host' => 'ftp.nl.uu.net',
                                            'path' => '/pub/CPAN/',
                                            'scheme' => 'ftp'
                                          },
                                          {
                                            'host' => 'cpan.valueclick.com',
                                            'path' => '/pub/CPAN/',
                                            'scheme' => 'ftp'
                                          },
                                          {
                                            'host' => 'ftp.funet.fi',
                                            'path' => '/pub/languages/perl/CPAN/',
                                            'scheme' => 'ftp'
                                          }
                                        ],
                             'lib' => [],
                             'makeflags' => '',
                             'makemakerflags' => '',
                             'md5' => 1,
                             'no_update' => 0,
                             'passive' => 1,
                             'prefer_bin' => 0,
                             'prefer_makefile' => 1,
                             'prereqs' => '1',
                             'shell' => 'CPANPLUS::Shell::Default',
                             'signature' => 0,
                             'skiptest' => 0,
                             'storable' => 1,
                             'timeout' => 300,
                             'verbose' => 1
                           },
                 'program' => {
                                'editor' => (-e '/usr/bin/vi' ? '/usr/bin/vi' : '/bin/nano') ,
                                'make' => '/usr/bin/make',
                                'pager' => (-e '/usr/bin/less' ? '/usr/bin/less' : ''),
                                'perl' => '',
                                'shell' => $ENV{SHELL},
                                'sudo' => (($> and -e '/usr/bin/sudo') ? '/usr/bin/sudo' : ''),
                              }
    };

    bless($conf, $class);
    return $conf;

} #new


1;

