#!/bin/bash

# Configure these variables according to your setup
# Puppet will read these facter variables
export FACTER_primary_talkserver_fqdn=whitelabel.talk.hoccer.de
export FACTER_primary_talkserver_port=443
export FACTER_primary_talkserver_cert=/etc/ssl/certs/whitelabel.talk.hoccer.de.crt
export FACTER_primary_talkserver_key=/etc/ssl/private/whitelabel.talk.hoccer.de.key
export FACTER_primary_talkserver_backend=talkserver_backend

export FACTER_secondary_talkserver_fqdn=whitelabel.talk.hoccer.de
export FACTER_secondary_talkserver_port=9999
export FACTER_secondary_talkserver_cert=/etc/ssl/certs/whitelabel.talk.hoccer.de.crt
export FACTER_secondary_talkserver_key=/etc/ssl/private/whitelabel.talk.hoccer.de.key
export FACTER_secondary_talkserver_backend=review_talkserver_backend

export FACTER_filecache_fqdn=filecache-whitelabel.talk.hoccer.de
export FACTER_filecache_port=80
export FACTER_filecache_cert=/etc/ssl/certs/filecache-whitelabel.talk.hoccer.de.crt
export FACTER_filecache_key=/etc/ssl/private/filecache-whitelabel.talk.hoccer.de.key
