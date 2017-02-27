notify { 'Manifeste basique pour garantir la presence d\'un utilisateur ': }
user { 'gilles':
	ensure => 'present',
	comment => 'Gilles Pietri',
	shell => '/bin/bash',
	home => '/home/gilles',
}
