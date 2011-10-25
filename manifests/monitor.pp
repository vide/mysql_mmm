class mysql_mmm::monitor {

    # common configuration for all the hosts working in a MMM cluster
    include mysql_mmm::common
    
    package { ["mysql-mmm-monitor" ]: ensure => present }
    
    service { "mysql-mmm-monitor":
        enable      => false,    
        pattern     => "mmm_mond",
        require     => [ Package["mysql-mmm-monitor"], File["/etc/mysql-mmm/mmm_common.conf"] ],
        subscribe   => [ File["/etc/mysql-mmm/mmm_mon.conf"], File["/etc/mysql-mmm/mmm_common.conf"] ]
    }
    
    case $operatingsystem {
        'Debian','Ubuntu': {
                # enable mmm_monitor at boot
                file { "/etc/default/mysql-mmm-monitor":
                        ensure  => "file",                                    
                        content => "ENABLED=1",                        
                        owner   => "root",
                        group   => "root",
                        mode    => 0644,
                        require => Package["mysql-mmm-monitor"]
                    }
                }
     # TODO: implement more OSes
    }
    
}
