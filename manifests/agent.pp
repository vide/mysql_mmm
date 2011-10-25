class mysql_mmm::agent {

    # common configuration for all the hosts working in a MMM cluster
    include mysql_mmm::common
    
    package { ["mysql-mmm-agent" ]: ensure => present }
    
    service { "mysql-mmm-agent":
        enable      => true,            
        pattern     => "mmm_agentd",        
        require     => [ Package["mysql-mmm-agent"], File["/etc/mysql-mmm/mmm_common.conf"] ],
        subscribe   => [ File["/etc/mysql-mmm/mmm_agent.conf"], File["/etc/mysql-mmm/mmm_common.conf"] ]
    }
    
    case $operatingsystem {
        'Debian','Ubuntu': {
                # enable mmm_monitor at boot
                file { "/etc/default/mysql-mmm-agent":
                        ensure  => "file",
                        content => "ENABLED=1",                
                        owner   => "root",
                        group   => "root",
                        mode    => 0644,
                        require => Package["mysql-mmm-agent"]
                    }
                }
     # TODO: implement more OSes
    }
    
}
