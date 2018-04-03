class profile::consul_server {


  class { '::consul':
    config_hash => {
      'bootstrap_expect' => 1,
      'data_dir'         => '/opt/consul',
      'log_level'        => 'INFO',
      'node_name'        => "${FQDN}",
      'server'           => true,
    }
  }



}
