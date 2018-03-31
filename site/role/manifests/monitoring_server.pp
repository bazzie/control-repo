class role::monitoring_server {

  include profile::prometheus_server
  include prometheus::node_exporter
  include profile::grafana

}
