class profile::puppetserver {

  class {'puppetserver':}
  
  class { '::puppetserver::hiera::eyaml':
    require => Class['puppetserver::install'],
  }

  file {'/etc/puppetlabs/puppet/autosign.conf':
    ensure  => present,
    content => '*.wildemann.nl',
  }

  file {'/etc/consul/service_puppetserver.json':
    ensure  => present,
    content => '{"service":{"name":"puppetserver","port":8140}}',
  }
}
