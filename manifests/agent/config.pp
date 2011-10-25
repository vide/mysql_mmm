define mysql_mmm::agent::config () {    
    file { "/etc/mysql-mmm/mmm_agent.conf":
            owner   => "root",
            group   => "root",
            mode    => "0600",
            path    => "/etc/mysql-mmm/mmm_agent.conf",
            content => template("mysql_mmm/etc/mysql-mmm/mmm_agent.conf.erb"),
            require => Package["mysql-mmm-agent"]
            
         }
}
