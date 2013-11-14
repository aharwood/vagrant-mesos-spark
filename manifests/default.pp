package { "git": }

exec { "mesos":
	command => "git clone git://git.apache.org/mesos.git",
	path => "/usr/bin",
	timeout => 600,
	require => Package["git"]
}

exec { "bootstrap-mesos":
	command => "/home/vagrant/mesos/bootstrap",
	require => Exec["mesos"]
}

exec { "configure-mesos":
	command => "/home/vagrant/mesos/configure",
	require => Exec["bootstrap-mesos"]
}
