#!/bin/bash

function usage() {
    cat << EOF

Usage: $0 old-id new-id

EOF
}

if [ $# -eq 0 ] ; then
    usage
    exit 1
fi

OLD=$1
NEW=$2

salt $OLD test.ping && salt $OLD cmd.run "echo $NEW > /etc/salt/minion_id"
salt $OLD service.restart salt-minion
mv -f /etc/salt/pki/master/minions/$OLD /etc/salt/pki/master/minions/$NEW
echo "Waiting 10 sec..."
sleep 10
salt $NEW test.ping # check if new host works
