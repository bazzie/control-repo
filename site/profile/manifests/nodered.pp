class profile::nodered {


  package { 'express':
    ensure   => 'nodered',
    provider => 'npm',
    require  => Class['nodejs'],
  }


}
