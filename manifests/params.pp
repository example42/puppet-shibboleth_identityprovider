# Class: shibboleth_identityprovider::params
#
# This class defines default parameters used by the main module class shibboleth_identityprovider
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to shibboleth_identityprovider class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class shibboleth_identityprovider::params {

  ### Module specific variables
  $dependency_class = 'shibboleth_identityprovider::dependency'
  $install = 'upstream'
  $install_source = undef
  $install_destination = '/opt'
  $base_install_source = 'http://shibboleth.net/downloads/identity-provider'

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'shibboleth_identityprovider',
  }

  $process = $::operatingsystem ? {
    default => 'java',
  }

  $process_args = $::operatingsystem ? {
    default => 'shibboleth_identityprovider',
  }

  $process_user = $::operatingsystem ? {
    default => 'shibboleth_identityprovider',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/shibboleth',
  }

  $config_file = $::operatingsystem ? {
    default  => '/etc/shibboleth/shibboleth_identityprovider.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0755',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/shibboleth_identityprovider/shibboleth_identityprovider.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/log/shibboleth_identityprovider/shibboleth_identityprovider-data',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/shibboleth_identityprovider',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/shibboleth_identityprovider/shibboleth_identityprovider.log',
  }

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $version = 'present'
  $absent = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
