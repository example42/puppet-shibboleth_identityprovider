# Class: shibboleth_identityprovider::spec
#
# This class is used only for rpsec-puppet tests
# Can be taken as an example on how to do custom classes but should not
# be modified.
#
# == Usage
#
# This class is not intended to be used directly.
# Use it as reference
#
class shibboleth_identityprovider::spec inherits shibboleth_identityprovider {

  # This just a test to override the arguments of an existing resource
  # Note that you can achieve this same result with just:
  # class { "shibboleth_identityprovider": template => "shibboleth_identityprovider/spec.erb" }

  File['shibboleth_identityprovider.conf'] {
    content => template('shibboleth_identityprovider/spec.erb'),
  }

}
