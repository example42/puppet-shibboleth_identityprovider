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
  $install_dependencies = true
  $install = 'package'
  $install_source = undef
  $install_destination = '/opt'
  $base_install_source = 'http://www.eu.apache.org/dist/shibboleth_identityprovider/apache-shibboleth_identityprovider'
  $create_user = true

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'shibboleth_identityprovider',
  }

  $service = $::operatingsystem ? {
    default => 'shibboleth_identityprovider',
  }

  $service_status = $::operatingsystem ? {
    default => true,
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
    default => '/etc/shibboleth_identityprovider',
  }

  $config_file = $::operatingsystem ? {
    'ubuntu' => '/etc/shibboleth_identityprovider/instances-available/main/shibboleth_identityprovider.xml',
    default  => '/etc/shibboleth_identityprovider/shibboleth_identityprovider.xml',
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

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/shibboleth_identityprovider',
    default                   => '/etc/sysconfig/shibboleth_identityprovider',
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

  $port = '8161'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
