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
		content => '[agent]
runinterval = 15m
[master]
vardir = /opt/puppetlabs/server/data/puppetserver
logdir = /var/log/puppetlabs/puppetserver
rundir = /var/run/puppetlabs/puppetserver
pidfile = /var/run/puppetlabs/puppetserver/puppetserver.pid
codedir = /etc/puppetlabs/code
',
	}

	service { 'puppet':
		ensure => 'running',
		enable => 'true',
		subscribe => File['/etc/puppetlabs/puppet/puppet.conf'],
	}

}

include puppet
