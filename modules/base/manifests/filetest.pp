class base::filetest {
  $ftroot="/tmp/filetest"

  file { "${ftroot}":
    ensure => directory,
  }

  file { "${ftroot}/content":
    ensure  => file,
    content => "testing contents",
  }

  file { "${ftroot}/source":
    ensure => file,
    source => puppet:///modules/base/filetest/source,
  }

  file { "${ftroot}/symlink_source":
    ensure  => file,
    content => "symlink source",
  }

  file { "${ftroot}/symlink":
    ensure => symlink,
    target => "${ftroot}/symlink_source",
  }
}
