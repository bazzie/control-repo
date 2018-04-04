class profile::nodered {


  package { 'node-red':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['nodejs'],
  }


}
