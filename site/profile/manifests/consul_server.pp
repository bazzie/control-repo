class profile::consul_server {


  package {'unzip':
    ensure => present,
  }

  class { '::consul':
    config_hash => {
      'bootstrap_expect' => 1,
      'data_dir'         => '/opt/consul',
      'log_level'        => 'INFO',
      'node_name'        => 'server',
      'server'           => true,
      'ui'               => true,
    }
  }



}
