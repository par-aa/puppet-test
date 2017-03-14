# Déclaration de ma ressource, mais en passant un paramètre
notify { 'It wokrs !....!...!':}
notify { 'Checking if r10k can synchronize automatically':}

#include puppet


#node /node[12]\.gilles/ {
#	class { 'bootstrap': 
#		message => 'Ce noeud est gere par Puppet, et des classes evoluees',
#	}
#	include confssh
#}

#node default {
#}
