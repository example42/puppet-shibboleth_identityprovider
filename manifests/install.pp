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

      $created_file = "shibboleth-identityprovider-${shibboleth_identityprovider::version}"

      puppi::netinstall { 'netinstall_shibboleth_identityprovider':
        url                 => $shibboleth_identityprovider::real_install_source,
        destination_dir     => $shibboleth_identityprovider::install_destination,
        # extract_command     => 'tar -zxf',
        # preextract_command  => $shibboleth_identityprovider::install_precommand,
        extracted_dir       => $created_file,
        owner               => $shibboleth_identityprovider::process_user,
        group               => $shibboleth_identityprovider::process_user,
      }

      exec { 'install_shibboleth_identityprovider':
        command     => "${shibboleth_identityprovider::install_destination}/${created_file}/install.sh",
        cwd         => "${shibboleth_identityprovider::install_destination}/${created_file}",
        environment => [
          "JAVA_HOME=${shibboleth_identityprovider::java_home}",
          "ANT_OPTS=-Didp.home.input=${shibboleth_identityprovider::home} -Didp.hostname.input=${shibboleth_identityprovider::idp_hostname} -Didp.keystore.pass=${shibboleth_identityprovider::idp_keypass}",
        ],
        creates     => "${shibboleth_identityprovider::home}/war/idp.war",
        require     => Puppi::Netinstall['netinstall_shibboleth_identityprovider'],
        timeout     => '3600',
      }

      file { 'shibboleth_identityprovider_link':
        ensure  => $shibboleth_identityprovider::home,
        path    => "${shibboleth_identityprovider::home_destination}/shibboleth-idp" ,
        require => Exec['install_shibboleth_identityprovider'],
      }

    }
  }
}
