#!/bin/sh

# create passwd entry for current uid, fix HOME variable
# only execute, if the current uid does not exist.
if ! id $(id -u) >/dev/null 2>/dev/null; then
    create_user $(id -u)
fi

export HOME=/data/riotbuild

# initialize git cache, bail out if it won't work
git-cache init || exit 0

exec $*
