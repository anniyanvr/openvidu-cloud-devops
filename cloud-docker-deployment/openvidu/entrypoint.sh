#!/bin/bash

# Set debug mode
DEBUG=${DEBUG:-false}
[ "$DEBUG" == "true" ] && set -x

# Enable turn
cat>/etc/default/coturn<<EOF
TURNSERVER_ENABLED=1
EOF

# Turn server configuration
cat>/etc/turnserver.conf<<EOF
external-ip=${PUBLIC_IP}
listening-port=${KMS_STUN_PORT}
fingerprint
lt-cred-mech
max-port=65535
min-port=40000
pidfile="/var/run/turnserver.pid"
realm=openvidu
simple-log
redis-userdb="ip=127.0.0.1 dbname=0 password=turn connect_timeout=30"
verbose
EOF

/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf