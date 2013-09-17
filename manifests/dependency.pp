# Class: shibboleth_identityprovider::dependency
#
# This class includes resources provided by other Example42 modules
# It's automatically included by default in order to provide
# a correct module setup, but you might want to provide the same
# resources in a custom way, using other modules.
#
# == Usage
#
# This class is not intended to be used directly.
#
class shibboleth_identityprovider::dependency {

  case $shibboleth_identityprovider::install {
    'source','puppi': {
      require java
    }
    default: {}
  }

}
