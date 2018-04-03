class role::puppetserver {

  include profile::consul_agent
  include profile::puppetserver
  include profile::puppetdb
  include prometheus::node_exporter

}
