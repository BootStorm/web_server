class web_server::mysql {

	class { '::mysql::server':
		root_password           => hiera('mysql::server::root_password'),
		remove_default_accounts => true,
	}
}

