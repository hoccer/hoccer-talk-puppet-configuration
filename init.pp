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

notice("Talkserver fqdn set to: ${$::system_role}")
notice("Talkserver cert set to: ${$::talkserver_cert}")
notice("Talkserver key set to : ${$::talkserver_key}")
notice("Filecache fqdn set to : ${$::filecache_fqdn}")
notice("Filecache cert set to : ${$::filecache_cert}")
notice("Filecache key set to  : ${$::filecache_key}")

class { 'talk-production':
  talkserver_fqdn => $::talkserver_fqdn,
  talkserver_cert => $::talkserver_cert, 
  talkserver_key => $::talkserver_key,
  filecache_fqdn  => $::filecache_fqdn,
  filecache_cert  => $::filecache_cert,
  filecache_key  => $::filecache_key,
}

file_line { 'urandom fix':
  path  => '/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/java.security',
  line  => 'securerandom.source=file:/dev/./urandom',
  match => '^securerandom.source=.*',
  require => Package['java'],
}
