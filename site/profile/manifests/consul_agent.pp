class profile::consul_agent {

  package {'unzip':
    ensure => present,
  }



  class { '::consul':
    config_hash => {
      'data_dir'   => '/opt/consul',
      'log_level'  => 'INFO',
      'node_name'  => ${fqdn},
      'retry_join' => ['monitoring.wildemann.nl'],
    }
}



}
