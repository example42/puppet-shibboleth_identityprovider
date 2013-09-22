# Class shibboleth_identityprovider::appserver::tomcat
#
class shibboleth_identityprovider::appserver::tomcat {

  include ::tomcat
  include shibboleth_identityprovider::install

  file { "${::tomcat::data_dir}/idp.war":
    source  => "file:///${shibboleth_identityprovider::home}/war/idp.war",
    notify  => Service[$::tomcat::service],
  }

  file { "${::tomcat::catalina_home}/endorsed/":
    ensure  => directory,
    source  => "file:///${shibboleth_identityprovider::install_destination}/shibboleth-identityprovider-${shibboleth_identityprovider::version}/endorsed/",
    recurse => true,
    notify  => Service[$::tomcat::service],
  }

}
