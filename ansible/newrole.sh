#!/bin/bash

set -e -u -o pipefail

readonly ROLENAME="$1"

if ! [ -d roles ] ; then
  echo "Please run $0 from the ansible directory." 1>&2
  exit 1
fi

if [ -e roles/"$ROLENAME" ] ; then
  echo "roles/$ROLENAME already exists." 1>&2
  exit 1
fi

/bin/mkdir -pv roles/"$ROLENAME"/{tasks,handlers,templates,files,vars,defaults,meta}
/usr/bin/touch roles/"$ROLENAME"/tasks/main.yml

/bin/cat > roles/"$ROLENAME"/README.md <<EOF
$ROLENAME
=========

TODO($USER) Write a brief description for the $ROLENAME role.

EOF
