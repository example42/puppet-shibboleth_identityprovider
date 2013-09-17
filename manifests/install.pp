# Class: shibboleth_identityprovider::install
#
# This class installs shibboleth_identityprovider
#
# == Variables
#
# Refer to shibboleth_identityprovider class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by shibboleth_identityprovider
#
class shibboleth_identityprovider::install inherits shibboleth_identityprovider {

  case $shibboleth_identityprovider::install {

    package: {
      package { 'shibboleth_identityprovider':
        ensure => $shibboleth_identityprovider::manage_package,
        name   => $shibboleth_identityprovider::package,
      }
    }

    upstream: {

      # $created_file = url_parse($shibboleth_identityprovider::real_install_source,'filename')
      $created_file = "apache-shibboleth_identityprovider-${shibboleth_identityprovider::version}"

      puppi::netinstall { 'netinstall_shibboleth_identityprovider':
        url                 => $shibboleth_identityprovider::real_install_source,
        destination_dir     => $shibboleth_identityprovider::install_destination,
        # extract_command     => 'tar -zxf',
        # preextract_command  => $shibboleth_identityprovider::install_precommand,
        extracted_dir       => $created_file,
        owner               => $shibboleth_identityprovider::process_user,
        group               => $shibboleth_identityprovider::process_user,
        before              => File ['shibboleth_identityprovider_link'],
      }

      file { 'shibboleth_identityprovider_link':
        ensure  => "${shibboleth_identityprovider::install_destination}/${created_file}" ,
        path    => "${shibboleth_identityprovider::install_destination}/shibboleth_identityprovider" ,
        require => Puppi::Netinstall['netinstall_shibboleth_identityprovider'],
      }

    }

    puppi: {

      puppi::project::tar { 'shibboleth_identityprovider':
        source                   => $shibboleth_identityprovider::real_install_source,
        deploy_root              => $shibboleth_identityprovider::install_destination,
        report_email             => 'root',
        user                     => $shibboleth_identityprovider::process_user,
        auto_deploy              => true,
        check_deploy             => false,
        run_checks               => false,
        enable                   => true,
        before                   => File ['shibboleth_identityprovider_link'],
      }

      file { 'shibboleth_identityprovider_link':
        ensure  => "${shibboleth_identityprovider::install_destination}/${created_file}" ,
        path    => "${shibboleth_identityprovider::install_destination}/shibboleth_identityprovider" ,
        require => Puppi::Project::Tar['shibboleth_identityprovider'],
      }

    }

    default: { }

  }

}
