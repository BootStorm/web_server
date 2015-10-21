#main class
# sets up a basic database and apache vhost
# really ugly and needs work

class web_server (
	$db_name,
	$db_user = 'mysql',
	$db_password = 'password',
	$site_name = 'website',
) {

	include apache
	include mysql::db

	mysql::db { $db_name:
		user     => $db_user,
		password => $db_passwd,
		host     => 'localhost',
		grant    => ['ALL'],
	}

	apache::vhost { $site_name:
		port    => '80',
		docroot => "/var/www/${site_name}",
	}
}

