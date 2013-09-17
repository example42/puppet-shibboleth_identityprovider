# Class: shibboleth_identityprovider::dependencies
#
# This class includes resources provided by other Example42 modules
# It's automatically included by default in order to provide
# a correct module setup, but you might want to provide the same
# resources in a custom way, using other modules.
# If so set install_dependencies to false and be sure that what
# is placed here is managed by your modules/manifests.
#
# == Usage
#
# This class is not intended to be used directly.
#
class shibboleth_identityprovider::dependencies {

  # Provide the PuppetLabs yum repo for seamless shibboleth_identityprovider setup
  case $::operatingsystem {
    'centos','redhat','scientific': {
      require yum::repo::puppetlabs
    }
    /(?i:Debian|Ubuntu|Mint)/ : {
      require apt::repo::puppetlabs
    }
    default: {}
  }

  case $shibboleth_identityprovider::install {
    'source','puppi': {
      require java
    }
    default: {}
  }

}