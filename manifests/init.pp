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
#   The URL from where to retrieve the source jar.
#   Used if install => "source" or "puppi"
#   Default is from upstream developer site. Update the version when needed.
#   Can be defined also by the variable $shibboleth_identityprovider_install_source
#
# [*install_destination*]
#   The base path where to place the jar.
#   Used if install => "source" or "puppi"
#   Can be defined also by the variable $shibboleth_identityprovider_install_destination
#
# [*install_dependencies*]
#   If dependencies from other Example42 modules are used.
#   Note that these dependencies are needed for an out of the box
#   setup of the module, but you might want to provide them with
#   other modules or functions. Default: true.
#   Set to false if these dependencies interphere with your modules.
#
# [*create_user*]
#   Set to true if you want the module to create the process user of shibboleth_identityprovider
#   (as defined in $logstagh::process_user). Default: true
#   Note: User is not created when $shibboleth_identityprovider::install is package
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
# [*service_autorestart*]
#   Automatically restarts the shibboleth_identityprovider service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
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
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $shibboleth_identityprovider_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $shibboleth_identityprovider_disableboot
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
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $shibboleth_identityprovider_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for shibboleth_identityprovider port(s)
#   Can be defined also by the (top scope) variables $shibboleth_identityprovider_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling shibboleth_identityprovider. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $shibboleth_identityprovider_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $shibboleth_identityprovider_firewall_dst
#   and $firewall_dst
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
# [*service*]
#   The name of shibboleth_identityprovider service
#
# [*service_status*]
#   If the shibboleth_identityprovider service init script supports status argument
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
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $shibboleth_identityprovider_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $shibboleth_identityprovider_protocol
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
  $install               = params_lookup('install'),
  $install_source        = params_lookup('install_source'),
  $install_destination   = params_lookup('install_destination'),
  $install_dependencies = params_lookup( 'install_dependencies' ),
  $create_user          = params_lookup( 'create_user' ),
  $my_class             = params_lookup( 'my_class' ),
  $source               = params_lookup( 'source' ),
  $source_dir           = params_lookup( 'source_dir' ),
  $source_dir_purge     = params_lookup( 'source_dir_purge' ),
  $template             = params_lookup( 'template' ),
  $service_autorestart  = params_lookup( 'service_autorestart' , 'global' ),
  $options              = params_lookup( 'options' ),
  $version              = params_lookup( 'version' ),
  $absent               = params_lookup( 'absent' ),
  $disable              = params_lookup( 'disable' ),
  $disableboot          = params_lookup( 'disableboot' ),
  $monitor              = params_lookup( 'monitor' , 'global' ),
  $monitor_tool         = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target       = params_lookup( 'monitor_target' , 'global' ),
  $puppi                = params_lookup( 'puppi' , 'global' ),
  $puppi_helper         = params_lookup( 'puppi_helper' , 'global' ),
  $firewall             = params_lookup( 'firewall' , 'global' ),
  $firewall_tool        = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src         = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst         = params_lookup( 'firewall_dst' , 'global' ),
  $debug                = params_lookup( 'debug' , 'global' ),
  $audit_only           = params_lookup( 'audit_only' , 'global' ),
  $package              = params_lookup( 'package' ),
  $service              = params_lookup( 'service' ),
  $service_status       = params_lookup( 'service_status' ),
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
  $log_file             = params_lookup( 'log_file' ),
  $port                 = params_lookup( 'port' ),
  $protocol             = params_lookup( 'protocol' )
  ) inherits shibboleth_identityprovider::params {

  $bool_create_user = any2bool($create_user)
  $bool_install_dependencies =any2bool($install_dependencies )
  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $shibboleth_identityprovider::bool_absent ? {
    true  => 'absent',
    false => $shibboleth_identityprovider::version,
  }

  $manage_service_enable = $shibboleth_identityprovider::bool_disableboot ? {
    true    => false,
    default => $shibboleth_identityprovider::bool_disable ? {
      true    => false,
      default => $shibboleth_identityprovider::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $shibboleth_identityprovider::bool_disable ? {
    true    => 'stopped',
    default =>  $shibboleth_identityprovider::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $shibboleth_identityprovider::bool_service_autorestart ? {
    true    => Service[shibboleth_identityprovider],
    false   => undef,
  }

  $manage_file = $shibboleth_identityprovider::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $shibboleth_identityprovider::bool_absent == true
  or $shibboleth_identityprovider::bool_disable == true
  or $shibboleth_identityprovider::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $shibboleth_identityprovider::bool_absent == true
  or $shibboleth_identityprovider::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
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
    ''      => "${shibboleth_identityprovider::params::base_install_source}/${shibboleth_identityprovider::version}/apache-shibboleth_identityprovider-${shibboleth_identityprovider::version}-bin.tar.gz",
    default => $shibboleth_identityprovider::install_source,
  }

  $shibboleth_identityprovider_dir = $shibboleth_identityprovider::install ? {
    package => $shibboleth_identityprovider::params::data_dir,
    default => "${shibboleth_identityprovider::install_destination}/shibboleth_identityprovider",
  }

  $real_config_file = $shibboleth_identityprovider::install ? {
    package => $shibboleth_identityprovider::config_file,
    default => "${shibboleth_identityprovider::install_destination}/shibboleth_identityprovider/conf/shibboleth_identityprovider.xml",
  }

  $real_config_dir = $shibboleth_identityprovider::install ? {
    package => $shibboleth_identityprovider::config_dir,
    default => "${shibboleth_identityprovider::install_destination}/shibboleth_identityprovider/conf",
  }

  ### Managed resources
  # Installation is managed in a dedicated class
  require shibboleth_identityprovider::install

  service { 'shibboleth_identityprovider':
    ensure     => $shibboleth_identityprovider::manage_service_ensure,
    name       => $shibboleth_identityprovider::service,
    enable     => $shibboleth_identityprovider::manage_service_enable,
    hasstatus  => $shibboleth_identityprovider::service_status,
    pattern    => $shibboleth_identityprovider::process,
    require    => Class['shibboleth_identityprovider::install'],
  }

  file { 'shibboleth_identityprovider.conf':
    ensure  => $shibboleth_identityprovider::manage_file,
    path    => $shibboleth_identityprovider::real_config_file,
    mode    => $shibboleth_identityprovider::config_file_mode,
    owner   => $shibboleth_identityprovider::config_file_owner,
    group   => $shibboleth_identityprovider::config_file_group,
    require => Class['shibboleth_identityprovider::install'],
    notify  => $shibboleth_identityprovider::manage_service_autorestart,
    source  => $shibboleth_identityprovider::manage_file_source,
    content => $shibboleth_identityprovider::manage_file_content,
    replace => $shibboleth_identityprovider::manage_file_replace,
    audit   => $shibboleth_identityprovider::manage_audit,
  }

  # The whole shibboleth_identityprovider configuration directory can be recursively overriden
  if $shibboleth_identityprovider::source_dir {
    file { 'shibboleth_identityprovider.dir':
      ensure  => directory,
      path    => $shibboleth_identityprovider::real_config_dir,
      require => Class['shibboleth_identityprovider::install'],
      notify  => $shibboleth_identityprovider::manage_service_autorestart,
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


  ### Service monitoring, if enabled ( monitor => true )
  if $shibboleth_identityprovider::bool_monitor == true {
    monitor::port { "shibboleth_identityprovider_${shibboleth_identityprovider::protocol}_${shibboleth_identityprovider::port}":
      protocol => $shibboleth_identityprovider::protocol,
      port     => $shibboleth_identityprovider::port,
      target   => $shibboleth_identityprovider::monitor_target,
      tool     => $shibboleth_identityprovider::monitor_tool,
      enable   => $shibboleth_identityprovider::manage_monitor,
    }
    monitor::process { 'shibboleth_identityprovider_process':
      process  => $shibboleth_identityprovider::process,
      service  => $shibboleth_identityprovider::service,
      pidfile  => $shibboleth_identityprovider::pid_file,
      user     => $shibboleth_identityprovider::process_user,
      argument => $shibboleth_identityprovider::process_args,
      tool     => $shibboleth_identityprovider::monitor_tool,
      enable   => $shibboleth_identityprovider::manage_monitor,
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $shibboleth_identityprovider::bool_firewall == true {
    firewall { "shibboleth_identityprovider_${shibboleth_identityprovider::protocol}_${shibboleth_identityprovider::port}":
      source      => $shibboleth_identityprovider::firewall_src,
      destination => $shibboleth_identityprovider::firewall_dst,
      protocol    => $shibboleth_identityprovider::protocol,
      port        => $shibboleth_identityprovider::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $shibboleth_identityprovider::firewall_tool,
      enable      => $shibboleth_identityprovider::manage_firewall,
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
  if $bool_install_dependencies {
    require shibboleth_identityprovider::dependencies
  }

  ### Include OS specific dependencies
  case $::operatingsystem {
    'ubuntu': {
      if $shibboleth_identityprovider::install == 'package' {
        file { 'shibboleth_identityprovider_instance_enabled':
          ensure  => "${shibboleth_identityprovider::real_config_dir}/instances-available/main",
          path    => "${shibboleth_identityprovider::real_config_dir}/instances-enabled/main",
          require => File['shibboleth_identityprovider.conf'],
        }
      }
    }
    default: {}
  }

}
