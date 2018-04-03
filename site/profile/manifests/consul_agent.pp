class profile::consul_agent {

  package {'unzip':
    ensure => present,
  }



  class { '::consul':
    config_hash => {
      'data_dir'   => '/opt/consul',
      'datacenter' => 'east-aws',
      'log_level'  => 'INFO',
      'node_name'  => 'agent',
      'retry_join' => ['monitoring.wildemann.nl'],
    }
}



}
