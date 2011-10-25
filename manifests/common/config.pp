define mysql_mmm::common::config (
    $cluster_interface      = "eth0",    
    $agent_default_pid      = "/var/run/mmm_agentd.pid",
    $agent_default_binpath  = "/usr/lib/mysql-mmm/",
    $replication_user       = "replication",
    $replication_password   = undef,
    $agent_user             = "mmm_agent",
    $agent_password         = undef,
    $mmm_hosts              = []
    ) {    
    file { "/etc/mysql-mmm/mmm_common.conf":
            owner   => "root",
            group   => "root",
            mode    => "0600",
            path    => "/etc/mysql-mmm/mmm_common.conf",
            content => template("mysql_mmm/etc/mysql-mmm/mmm_common.conf.erb"),
            require => Class["mysql_mmm::common"]
            
         }
}
