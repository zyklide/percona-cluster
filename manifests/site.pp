node percona1 {
	include percona::repository
	include myhosts

	Class['percona::repository'] -> Class['percona::cluster'] 
        #-> Class['galera::glb']


	class {
		'percona::cluster':
                        mysql_version   => "5.5",
                        enable          => True,
                        ensure          => "running",
			bootstrap 	=> True
	}

	#class {
	#	'galera::glb':
	#		glb_list_backend => "192.168.70.2:3306:1 192.168.70.3:3306:1 192.168.70.4:3306"
	#}

        #mysql::rights { "root":
    	#	user     => "root",
   	# 	password => "dim0",
    	#	database => "*",
    	#	priv     => ["all"],
	#	require  => Class['percona::cluster']
  	#}

}

node percona2 {
	include percona::repository
	#include percona::cluster
	include myhosts

	Class['percona::repository'] -> Class['percona::cluster']

	class {
		'percona::cluster':
                        mysql_version   => "5.5",
                        enable          => "true",
                        ensure          => "running"
	}
}

node percona3 {
	include percona::repository
	#include percona::cluster
	include myhosts

	Class['percona::repository'] -> Class['percona::cluster']

	class {
		'percona::cluster':
                        mysql_version   => "5.5",
                        enable          => "true",
                        ensure          => "running"
	}
}

node percona4 {
	include percona::repository

	class {
                'percona::server':
                        mysql_version   => "5.5",
                        ensure          => "running"
        }

	class {'percona::server::config': perconaserverid => "4" }
}
