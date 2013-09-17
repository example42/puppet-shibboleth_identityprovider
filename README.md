# Puppet module: shibboleth_identityprovider

This is a Puppet module for shibboleth_identityprovider based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-shibboleth_identityprovider

Module enhancements sponsored by [AllOver.IO](http://www.allover.io)

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.

This module is based on ActiveMQ packages provided by the PuppetLabs repository.
For RedHat derivatives it requires Example42's yum module (or at least yum/manifests/repo/puppetlabs.pp).

## USAGE - Basic management

* Install shibboleth_identityprovider with default settings

        class { 'shibboleth_identityprovider': }

* Install shibboleth_identityprovider without including the (needed) dependencies that rely on other Example42 modules. When you set install_dependencies to false you need to provide in some way the equivant of what is placed in shibboleth_identityprovider/manifests/dependencies.pp

        class { 'shibboleth_identityprovider':
          install_dependencies => false,
        }

* Install shibboleth_identityprovider directly from upstream site. Must specify the wanted version. Also, by default, an shibboleth_identityprovider user is created which runs the service

        class { 'shibboleth_identityprovider':
          install             => 'source',
          version             => '5.8.0',
          install_destination => '/opt',      # Default value
          create_user         => true,        # Default value
          process_user        => 'shibboleth_identityprovider',  # Default value
        }

* Install a specific version of shibboleth_identityprovider package

        class { 'shibboleth_identityprovider':
          version => '1.0.1',
        }

* Disable shibboleth_identityprovider service.

        class { 'shibboleth_identityprovider':
          disable => true
        }

* Remove shibboleth_identityprovider package

        class { 'shibboleth_identityprovider':
          absent => true
        }

* Enable auditing without without making changes on existing shibboleth_identityprovider configuration files

        class { 'shibboleth_identityprovider':
          audit_only => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'shibboleth_identityprovider':
          source => [ "puppet:///modules/lab42/shibboleth_identityprovider/shibboleth_identityprovider.conf-${hostname}" , "puppet:///modules/lab42/shibboleth_identityprovider/shibboleth_identityprovider.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'shibboleth_identityprovider':
          source_dir       => 'puppet:///modules/lab42/shibboleth_identityprovider/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'shibboleth_identityprovider':
          template => 'example42/shibboleth_identityprovider/shibboleth_identityprovider.conf.erb',
        }

* Automatically include a custom subclass

        class { 'shibboleth_identityprovider':
          my_class => 'shibboleth_identityprovider::example42',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'shibboleth_identityprovider':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'shibboleth_identityprovider':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'shibboleth_identityprovider':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'shibboleth_identityprovider':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


[![Build Status](https://travis-ci.org/example42/puppet-shibboleth_identityprovider.png?branch=master)](https://travis-ci.org/example42/puppet-shibboleth_identityprovider)
