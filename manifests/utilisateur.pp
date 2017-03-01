# Garantie sur le package zsh/bash
define utilisateur (String[2] $username = $title, $ensure = 'present') {
	$shell_user = $osfamily ? {
		'Debian' => 'zsh',
		'Suse' => 'bash',
	}

	if $ensure == 'present' and ! defined(Package[$shell_user]) {
		package { "$shell_user":
		}
	}

	# Utilisateur gilles, avec un shell non présent par défaut
	user { $username:
		ensure => $ensure,
		comment => "Utilisateur Puppet ${username}",
		shell => "/bin/${shell_user}",
		home => "/home/${username}",
		# Dépendance entre les 2 ressources
		require => Package["$shell_user"],
	}
}
