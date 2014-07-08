define line($file, $line, $ensure = 'present') {
    case $ensure {
        default : { err ( "unknown ensure value ${ensure}" ) }
        present: {
            exec { "/bin/echo '${line}' >> '${file}'":
                unless => "/bin/grep -qFx '${line}' '${file}'"
            }
        }
        absent: {
            exec { "/bin/grep -vFx '${line}' '${file}' | /usr/bin/tee '${file}' > /dev/null 2>&1":
              onlyif => "/bin/grep -qFx '${line}' '${file}'"
            }

            # Use this resource instead if your platform's grep doesn't support -vFx;
            # note that this command has been known to have problems with lines containing quotes.
            # exec { "/usr/bin/perl -ni -e 'print unless /^\\Q${line}\\E\$/' '${file}'":
            #     onlyif => "/bin/grep -qFx '${line}' '${file}'"
            # }
        }
    }
}

include backuppc-client
include deployment-user
include nrpe
include java

notice("Primary talkserver fqdn set to: ${$::primary_talkserver_fqdn}")
notice("Primary talkserver port set to: ${$::primary_talkserver_port}")
notice("Primary talkserver cert set to: ${$::primary_talkserver_cert}")
notice("Primary talkserver key set to : ${$::primary_talkserver_key}")
notice("Primary talkserver backend set to : ${$::primary_talkserver_backend}")

notice("Secondary talkserver fqdn set to: ${$::secondary_talkserver_fqdn}")
notice("Secondary talkserver port set to: ${$::secondary_talkserver_port}")
notice("Secondary talkserver cert set to: ${$::secondary_talkserver_cert}")
notice("Secondary talkserver key set to : ${$::secondary_talkserver_key}")
notice("Secondary talkserver backend set to : ${$::secondary_talkserver_backend}")

notice("Filecache fqdn set to : ${$::filecache_fqdn}")
notice("Filecache port set to : ${$::filecache_port}")
notice("Filecache cert set to : ${$::filecache_cert}")
notice("Filecache key set to  : ${$::filecache_key}")

class { 'talk-production':
  primary_talkserver_fqdn => $::primary_talkserver_fqdn,
  primary_talkserver_port => $::primary_talkserver_port,
  primary_talkserver_cert => $::primary_talkserver_cert,
  primary_talkserver_key => $::primary_talkserver_key,
  primary_talkserver_backend => $::primary_talkserver_backend,

  secondary_talkserver_fqdn => $::secondary_talkserver_fqdn,
  secondary_talkserver_port => $::secondary_talkserver_port,
  secondary_talkserver_cert => $::secondary_talkserver_cert,
  secondary_talkserver_key => $::secondary_talkserver_key,
  secondary_talkserver_backend => $::secondary_talkserver_backend,

  filecache_fqdn  => $::filecache_fqdn,
  filecache_port  => $::filecache_port,
  filecache_cert  => $::filecache_cert,
  filecache_key  => $::filecache_key,
}

file_line { 'urandom fix':
  path  => '/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/java.security',
  line  => 'securerandom.source=file:/dev/./urandom',
  match => '^securerandom.source=.*',
  require => Package['java'],
}
