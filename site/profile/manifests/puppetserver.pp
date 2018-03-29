class profile::puppetserver {

  class {'puppetserver':}

  file {'/etc/puppetlabs/puppet/autosign.conf':
    ensure  => present,
    content => '*.wildemann.nl',
  }

}
