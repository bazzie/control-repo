class profile::consul_server {


  package {'unzip':
    ensure => present,
  }

  class { '::consul':
    config_hash => {
      'client_addr'      => '0.0.0.0',
      'bootstrap_expect' => 1,
      'data_dir'         => '/opt/consul',
      'log_level'        => 'INFO',
      'node_name'        => 'server',
      'server'           => true,
      'ui'               => true,
    }
  }

  consul::service { 'puppetserver':
    port    => 8140,
    tags    => ['consul_service']
  }  

}
