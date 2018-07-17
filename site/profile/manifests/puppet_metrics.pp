class profile::puppet_metrics {

  class { 'puppet_metrics_dashboard':
    configure_telegraf  => true,
    enable_telegraf     => true,
    master_list         => ['puppet.wildemann.nl'],
    puppetdb_list       => ['puppet.wildemann.nl'],
  }


}
