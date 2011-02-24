# Set FACTER_auditfiles to "true"
# to turn on auditing of files.
# set it to "all" to audit every attribute

class base::filetest {
  $ftroot="/tmp/filetest"

  if $auditfiles == "true" {
    File { audit => [ensure, type] }
  }

  if $auditfiles == "all" {
    File { audit => all, }
  }

  file { "${ftroot}":
    ensure => directory,
  }

  file { "${ftroot}/content":
    ensure  => file,
    content => "testing contents",
  }

  file { "${ftroot}/source":
    ensure => file,
    source => "puppet:///modules/base/filetest/source",
  }

  file { "${ftroot}/symlink_source":
    ensure  => file,
    content => "symlink source",
  }

  file { "${ftroot}/symlink":
    ensure => symlink,
    target => "${ftroot}/symlink_source",
  }

  file { "${ftroot}/recurse":
    source  => "puppet:///modules/base/filetest/recurse",
    recurse => true,
  }
}
