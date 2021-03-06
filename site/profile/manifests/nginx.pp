class profile::nginx {

  file { '/var/www/www.wildemann.nl':
    ensure => directory,
  }

  file { '/var/www/www.nextworking.nl':
    ensure => directory,
  }

  file { '/var/www/www.pupept.com':
    ensure => directory,
  }

  class { 'nginx': }

  nginx::resource::server { 'www.wildemann.nl':
    www_root => '/var/www/www.wildemann.nl',
  }
 
  nginx::resource::server { 'www.nextworking.nl':
    www_root => '/var/www/www.nextworking.nl',
  }

  nginx::resource::server { 'www.pupept.com':
    www_root => '/var/www/www.pupept.com',
  }

 

}
