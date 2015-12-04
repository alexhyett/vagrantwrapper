class custom::install {

	exec { 'wordpress_exists':
		command => '/bin/true',
		onlyif => '/usr/bin/test -e /vagrant/wordpress/wp-content/themes',
	}

	# Create a symlink of theme folder
	file { '/vagrant/wordpress/wp-content/themes/test/':
		ensure => 'link',
		target => '/working/theme',
		require => Exec['wordpress_exists'],
	}

	# Create a symlink of plugins folder
	file { '/vagrant/wordpress/wp-content/plugins/':
		ensure => 'link',
		target => '/working/plugins',
		force => true,
		require => Exec['wordpress_exists'],
	}

	# Create a symlink of uploads folder
	file { '/vagrant/wordpress/wp-content/uploads/':
		ensure => 'link',
		target => '/working/puppet/modules/custom/files/uploads',
		force => true,
		require => Exec['wordpress_exists'],
	}

	exec { 'npm install':
		command => '/usr/bin/npm install',
		cwd => '/working/theme/',
		require => File['/vagrant/wordpress/wp-content/themes/test/'],
	}

	#file { '/tmp/wordpress-backup.sql':
	#	source => 'puppet:///modules/custom/wordpress-backup.sql'
	#}

	#exec { 'load-db':
	#    command => '/usr/bin/mysql -u wordpress -pwordpress wordpress < /tmp/wordpress-backup.sql && touch /home/vagrant/db-updated',
	#    creates => '/home/vagrant/db-updated',
	#    require => File['/tmp/wordpress-backup.sql'],
  	#}
}