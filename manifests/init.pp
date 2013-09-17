# = Class: shibboleth_identityprovider
#
# This is the main shibboleth_identityprovider class
#
#
# == Parameters
#
# Module Specific variables
# [*install*]
#   Kind of installation to attempt:
#     - package : Installs shibboleth_identityprovider using the OS common packages
#     - source  : Installs shibboleth_identityprovider downloading and extracting a specific
#                 tarball or zip file
#     - puppi   : Installs shibboleth_identityprovider tarball or file via Puppi, creating the
#                 "puppi deploy shibboleth_identityprovider" command
#   Can be defined also by the variable $shibboleth_identityprovider_install
#
#
# [*install_source*]
#   The URL from where to retrieve the source tarball.
#   Used if install => "source" or "puppi"
#   Default is from upstream developer site. Update the version when needed.
#   Can be defined also by the variable $shibboleth_identityprovider_install_source
#
# [*install_destination*]
#   The base path where to place the tarball.
#   Used if install => "source" or "puppi"
#   Can be defined also by the variable $shibboleth_identityprovider_install_destination
#
# [*dependency_class*]
#   Name of the class tha provides third modules dependencies.
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, shibboleth_identityprovider class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $shibboleth_identityprovider_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, shibboleth_identityprovider main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $shibboleth_identityprovider_source
#
# [*source_dir*]
#   If defined, the whole shibboleth_identityprovider configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $shibboleth_identityprovider_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $shibboleth_identityprovider_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, shibboleth_identityprovider main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $shibboleth_identityprovider_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $shibboleth_identityprovider_options
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $shibboleth_identityprovider_absent
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $shibboleth_identityprovider_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for shibboleth_identityprovider checks
#   Can be defined also by the (top scope) variables $shibboleth_identityprovider_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $shibboleth_identityprovider_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $shibboleth_identityprovider_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $shibboleth_identityprovider_puppi_helper
#   and $puppi_helper
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $shibboleth_identityprovider_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $shibboleth_identityprovider_audit_only
#   and $audit_only
#
# Default class params - As defined in shibboleth_identityprovider::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of shibboleth_identityprovider package
#
# [*process*]
#   The name of shibboleth_identityprovider process
#
# [*process_args*]
#   The name of shibboleth_identityprovider arguments. Used by puppi and monitor.
#   Used only in case the shibboleth_identityprovider process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user shibboleth_identityprovider runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include shibboleth_identityprovider"
# - Call shibboleth_identityprovider as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class shibboleth_identityprovider (
  $install              = params_lookup('install'),
  $install_source       = params_lookup('install_source'),
  $install_destination  = params_lookup('install_destination'),
  $dependency_class     = params_lookup( 'dependency_class' ),
  $my_class             = params_lookup( 'my_class' ),
  $source               = params_lookup( 'source' ),
  $source_dir           = params_lookup( 'source_dir' ),
  $source_dir_purge     = params_lookup( 'source_dir_purge' ),
  $template             = params_lookup( 'template' ),
  $options              = params_lookup( 'options' ),
  $version              = params_lookup( 'version' ),
  $absent               = params_lookup( 'absent' ),
  $monitor              = params_lookup( 'monitor' , 'global' ),
  $monitor_tool         = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target       = params_lookup( 'monitor_target' , 'global' ),
  $puppi                = params_lookup( 'puppi' , 'global' ),
  $puppi_helper         = params_lookup( 'puppi_helper' , 'global' ),
  $debug                = params_lookup( 'debug' , 'global' ),
  $audit_only           = params_lookup( 'audit_only' , 'global' ),
  $package              = params_lookup( 'package' ),
  $process              = params_lookup( 'process' ),
  $process_args         = params_lookup( 'process_args' ),
  $process_user         = params_lookup( 'process_user' ),
  $config_dir           = params_lookup( 'config_dir' ),
  $config_file          = params_lookup( 'config_file' ),
  $config_file_mode     = params_lookup( 'config_file_mode' ),
  $config_file_owner    = params_lookup( 'config_file_owner' ),
  $config_file_group    = params_lookup( 'config_file_group' ),
  $config_file_init     = params_lookup( 'config_file_init' ),
  $pid_file             = params_lookup( 'pid_file' ),
  $data_dir             = params_lookup( 'data_dir' ),
  $log_dir              = params_lookup( 'log_dir' ),
  $log_file             = params_lookup( 'log_file' )
  ) inherits shibboleth_identityprovider::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_absent=any2bool($absent)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $shibboleth_identityprovider::bool_absent ? {
    true  => 'absent',
    false => $shibboleth_identityprovider::version,
  }

  $manage_file = $shibboleth_identityprovider::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $shibboleth_identityprovider::bool_absent == true
  or $shibboleth_identityprovider::bool_monitor == false {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  $manage_audit = $shibboleth_identityprovider::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $shibboleth_identityprovider::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $shibboleth_identityprovider::source ? {
    ''        => undef,
    default   => $shibboleth_identityprovider::source,
  }

  $manage_file_content = $shibboleth_identityprovider::template ? {
    ''        => undef,
    default   => template($shibboleth_identityprovider::template),
  }

  $real_install_source = $shibboleth_identityprovider::install_source ? {
    ''      => "${shibboleth_identityprovider::params::base_install_source}/${shibboleth_identityprovider::version}/shibboleth-identityprovider-${shibboleth_identityprovider::version}-bin.tar.gz",
    default => $shibboleth_identityprovider::install_source,
  }

  $shibboleth_identityprovider_dir = $shibboleth_identityprovider::install ? {
    package => $shibboleth_identityprovider::params::data_dir,
    default => "${shibboleth_identityprovider::install_destination}/shibboleth-identityprovider",
  }

  $real_config_file = $shibboleth_identityprovider::install ? {
    package => $shibboleth_identityprovider::config_file,
    default => "${shibboleth_identityprovider::install_destination}/shibboleth-identityprovider/conf/shibboleth2.xml",
  }

  $real_config_dir = $shibboleth_identityprovider::install ? {
    package => $shibboleth_identityprovider::config_dir,
    default => "${shibboleth_identityprovider::install_destination}/shibboleth-identityprovider/conf",
  }

  ### Managed resources
  # Installation is managed in a dedicated class
  require shibboleth_identityprovider::install

  if $shibboleth_identityprovider::source or
  if $shibboleth_identityprovider::template {
    file { 'shibboleth_identityprovider.conf':
      ensure  => $shibboleth_identityprovider::manage_file,
      path    => $shibboleth_identityprovider::real_config_file,
      mode    => $shibboleth_identityprovider::config_file_mode,
      owner   => $shibboleth_identityprovider::config_file_owner,
      group   => $shibboleth_identityprovider::config_file_group,
      require => Class['shibboleth_identityprovider::install'],
      source  => $shibboleth_identityprovider::manage_file_source,
      content => $shibboleth_identityprovider::manage_file_content,
      replace => $shibboleth_identityprovider::manage_file_replace,
      audit   => $shibboleth_identityprovider::manage_audit,
    }
  }

  # The whole shibboleth_identityprovider configuration directory can be recursively overriden
  if $shibboleth_identityprovider::source_dir {
    file { 'shibboleth_identityprovider.dir':
      ensure  => directory,
      path    => $shibboleth_identityprovider::real_config_dir,
      require => Class['shibboleth_identityprovider::install'],
      source  => $shibboleth_identityprovider::source_dir,
      recurse => true,
      purge   => $shibboleth_identityprovider::bool_source_dir_purge,
      replace => $shibboleth_identityprovider::manage_file_replace,
      audit   => $shibboleth_identityprovider::manage_audit,
    }
  }


  ### Include custom class if $my_class is set
  if $shibboleth_identityprovider::my_class {
    include $shibboleth_identityprovider::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $shibboleth_identityprovider::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'shibboleth_identityprovider':
      ensure    => $shibboleth_identityprovider::manage_file,
      variables => $classvars,
      helper    => $shibboleth_identityprovider::puppi_helper,
    }
  }


  ### Monitoring, if enabled ( monitor => true )
  if $shibboleth_identityprovider::bool_monitor == true {
    monitor::process { 'shibboleth_identityprovider_process':
      process  => $shibboleth_identityprovider::process,
      pidfile  => $shibboleth_identityprovider::pid_file,
      user     => $shibboleth_identityprovider::process_user,
      argument => $shibboleth_identityprovider::process_args,
      tool     => $shibboleth_identityprovider::monitor_tool,
      enable   => $shibboleth_identityprovider::manage_monitor,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $shibboleth_identityprovider::bool_debug == true {
    file { 'debug_shibboleth_identityprovider':
      ensure  => $shibboleth_identityprovider::manage_file,
      path    => "${settings::vardir}/debug-shibboleth_identityprovider",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
    }
  }

  ### Include dependencies provided by other Example42 modules
  if $dependency_class {
    require $shibboleth_identityprovider::dependency_class
  }

}
