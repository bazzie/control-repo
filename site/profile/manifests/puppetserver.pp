class profile::puppetserver {

  class {'puppetserver':}
  
  class { '::puppetserver::hiera::eyaml':
    require => Class['puppetserver::install'],
  }


  file {'/etc/puppetlabs/puppet/autosign.conf':
    ensure  => present,
    content => '*.wildemann.nl',
  }

  consul::service { 'puppetserver':
    port    => 8140,
    tags    => ['consul_service']
  }

}
