#!/bin/bash

# Configure these variables according to your setup
# Puppet will read these facter variables
export FACTER_talkserver_fqdn=talkserver.hoccer.de
export FACTER_talkserver_port=8443
export FACTER_talkserver_cert=/etc/ssl/certs/talkserver.cert
export FACTER_talkserver_key=/etc/ssl/private/talkserver.key
export FACTER_filecache_fqdn=filecache.hoccer.de
export FACTER_filecache_port=8444
export FACTER_filecache_cert=/etc/ssl/certs/filecache.cert
export FACTER_filecache_key=/etc/ssl/private/filecache.key
