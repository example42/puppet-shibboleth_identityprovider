# Class: shibboleth_identityprovider::skel
#
# This class creates additional shibboleth_identityprovider resources
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by shibboleth_identityprovider
#
class shibboleth_identityprovider::skel {

  file { '/etc/shibboleth/identityprovider':
    ensure  => directory,
    owner   => $shibboleth_identityprovider::process_user,
    group   => $shibboleth_identityprovider::process_group,
    audit   => $shibboleth_identityprovider::manage_audit,
  }
}
