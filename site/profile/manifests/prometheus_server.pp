class profile::prometheus_server {


  class { '::prometheus':
    version => '2.0.0',
    alerts => { 'groups' => [{ 'name' => 'alert.rules', 'rules' => [{ 'alert' => 'InstanceDown', 'expr' => 'up == 0', 'for' => '5m', 'labels' => { 'severity' => 'page', }, 'annotations' => { 'summary' => 'Instance {{ $labels.instance }} down', 'description' => '{{ $labels.instance }} of job {{ $labels.job }} has been down for more than 5 minutes.' } }]}]},
    scrape_configs => [
      { 'job_name' => 'prometheus',
        'scrape_interval' => '10s',
        'scrape_timeout'  => '10s',
        'static_configs'  => [
           { 'targets' => [ 'localhost:9090' ],
             'labels'  => { 'alias'=> 'Prometheus'}
           }
        ]
      },
      { 'job_name' => 'node',
        'scrape_interval' => '5s',
        'scrape_timeout'  => '5s',
        'static_configs'  => [
           { 'targets' => [ 'monitoring.wildemann.nl:9100', 'test.wildemann.nl:9100', 'puppet.wildemann.nl:9100', 'server.wildemann.nl:9100' ],
             'labels'  => { 'alias'=> 'Node'}
           }
        ]
      }
    ],
    alertmanagers_config => [{ 'static_configs' => [{'targets' => [ 'localhost:9093' ]}]}],
  }
#class { '::prometheus::alertmanager':
#  version       => '0.13.0',
#  route         => { 'group_by' => [ 'alertname', 'cluster', 'service' ], 'group_wait'=> '30s', 'group_interval'=> '5m', 'repeat_interval'=> '3h', 'receiver'=> 'slack' },
#  receivers     => [ { 'name' => 'slack', 'slack_configs'=> [ { 'api_url'=> 'https://hooks.slack.com/services/ABCDEFG123456', 'channel' => '#channel', 'send_resolved' => true, 'username' => 'username'}] }]
#}

  include prometheus::node_exporter

}
