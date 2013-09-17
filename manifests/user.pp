# Class: shibboleth_identityprovider::user
#
# This class creates shibboleth_identityprovider user
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by shibboleth_identityprovider
#
class shibboleth_identityprovider::user inherits shibboleth_identityprovider {
  $user_before = $shibboleth_identityprovider::install ? {
    source  => [ Group[$shibboleth_identityprovider::process_user] , Puppi::Netinstall['netinstall_shibboleth_identityprovider'] ],
    puppi   => [ Group[$shibboleth_identityprovider::process_user] , Puppi::Project::Tar['shibboleth_identityprovider'] ],
    default => undef,
  }
  @user { $shibboleth_identityprovider::process_user :
    ensure     => $shibboleth_identityprovider::manage_file,
    comment    => "${shibboleth_identityprovider::process_user} user",
    password   => '!',
    managehome => false,
    home       => $shibboleth_identityprovider::shibboleth_identityprovider_dir,
    shell      => '/bin/bash',
    before     => $user_before ,
  }
  @group { $shibboleth_identityprovider::process_user :
    ensure     => $shibboleth_identityprovider::manage_file,
  }

  User <| title == $shibboleth_identityprovider::process_user |>
  Group <| title == $shibboleth_identityprovider::process_user |>

}
