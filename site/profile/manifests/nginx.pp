class profile::nginx {

  file { '/var/www/www.wildemann.nl':
    ensure => directory,
  }

  class { 'nginx': }

  nginx::resource::server { 'www.wildemann.nl':
    www_root => '/var/www/www.www.wildemann.nl',
  }
  

}
