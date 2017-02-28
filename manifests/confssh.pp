package { 'openssh-server':
	ensure => 'present',
}

file { '/etc/ssh/sshd_config':
	ensure => 'present',
	owner => 'root',
	group => 'root',
	mode => '0644',
	require => Package['openssh-server'],
	notify => Service['ssh'],
	content => 'Port 22
Protocol 2
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_dsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key
UsePrivilegeSeparation yes
KeyRegenerationInterval 3600
ServerKeyBits 1024
SyslogFacility AUTH
LogLevel INFO
LoginGraceTime 120
PermitRootLogin without-password
StrictModes yes
RSAAuthentication yes
PubkeyAuthentication yes
IgnoreRhosts yes
RhostsRSAAuthentication no
HostbasedAuthentication no
PermitEmptyPasswords no
ChallengeResponseAuthentication no
X11Forwarding yes
X11DisplayOffset 10
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
AcceptEnv LANG LC_*
Subsystem sftp /usr/lib/openssh/sftp-server
UsePAM yes',
}
	
service { 'ssh':
	ensure => 'running',
	enable => 'true',
}

file { '/root/.ssh':
	ensure => 'directory',
	mode => '0700',
	owner => 'root',
	group => 'root',	
}

file { '/root/.ssh/authorized_keys':
	ensure => 'present',
	mode => '0600',
	owner => 'root',
	group => 'root',
	require => File['/root/.ssh'],
	content => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVdkRhhTVuXUcIES0jq8kOFb3GERM4Q0FxN15H0fn6JASkXAyJwJEiRUQqXf+3qXrRRKKgOl/81eif8pMLHI2S87iyJJQYuUHi7INNsVOX5jUD8MH0vTFC9O3JjyK7WzVrQV+FJdSVJ9yCzdO1+x6DQfxibkeVU9H/aUVe+4737ZZldWTU4T5/z7D8x/4P8U+3Wz1rjrFtFiw4vbzZhxBdMkioLwH7+ZXWbqfITKStAKLg4LNGSpL112VQ1B8q6BLs3v5U8pZ/r8V0ffFb0vYjKK5n0+cG7kSojx7r4PRInQ6bc5skfxae7wnqgols8XVNAurhO4+TWXVDoar1tFqf antemeta@gpiertri-debian-master',

}