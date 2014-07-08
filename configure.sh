#!/bin/bash

# Configure these variables according to your setup
# Puppet will read these facter variables
export FACTER_primary_talkserver_fqdn=talkserver.talk.hoccer.de
export FACTER_primary_talkserver_port=443
export FACTER_primary_talkserver_cert=/etc/ssl/certs/talkserver.talk.hoccer.de.crt
export FACTER_primary_talkserver_key=/etc/ssl/private/talkserver.talk.hoccer.de.key
export FACTER_primary_talkserver_backend=talkserver_backend

export FACTER_secondary_talkserver_fqdn=talkserver.talk.hoccer.de
export FACTER_secondary_talkserver_port=9999
export FACTER_secondary_talkserver_cert=/etc/ssl/certs/talkserver.talk.hoccer.de.crt
export FACTER_secondary_talkserver_key=/etc/ssl/private/talkserver.talk.hoccer.de.key
export FACTER_secondary_talkserver_backend=review_talkserver_backend

export FACTER_filecache_fqdn=filecache.hoccer.de
export FACTER_filecache_port=80
export FACTER_filecache_cert=/etc/ssl/certs/filecache.talk.hoccer.de.crt
export FACTER_filecache_key=/etc/ssl/private/filecache.talk.hoccer.de.key
