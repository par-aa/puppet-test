# Manifeste pour valider le déploiement de :
# - puppet-agent (il nous manquera le dépôt, mais tant pis)
# - le fichier /etc/puppetlabs/puppet/puppet.conf adapté
# - le service puppet

class puppet {
	package { 'puppet-agent':
		ensure => 'present',
	}

	file { '/etc/puppetlabs/puppet/puppet.conf':
		ensure => 'present',
		owner => 'root',
		group => 'root',
		mode => '0644',
		require => Package['puppet-agent'],
		source => 'puppet:///modules/puppet/puppet.conf',
	}

	service { 'puppet':
		ensure => 'running',
		enable => 'true',
		subscribe => File['/etc/puppetlabs/puppet/puppet.conf'],
	}

}
