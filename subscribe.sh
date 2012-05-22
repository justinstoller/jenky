#!/bin/bash

# subscribe.sh
# Simple shell script for registering github pubsub api callbacks
#
# Takes a mandatory password for your account as the first argument
# otherwise all defaults are my own testing defaults :)
#
# In case it's not obvious below the positional arguments should be:
# your github password (quoted to do an valid shell escaping)
# your github username
# your repository
# the event you want to subscribe to (push, pull_request, etc)
# the server github should ping when the event occurs
# whether or not to 'subscribe' or 'unsubscribe'
# the user (or organization) name of the repository (puppetlabs)

pass=$1
user=${2:-'justinstoller'}
repo=${3:-'puppet-acceptance'}
event=${4:-'push'}
server=${5:-'http://justinstoller.com:4567'}
sub=${6:-'subscribe'}
org=${7:-$user}

echo "Contacting https://api.github.com/hub with:"
echo "username: $user"
echo "password: $pass"
echo "$sub $server to $event events for $org/$repo"
echo ""

curl -u "$user:$pass" -i https://api.github.com/hub          \
  -F "hub.mode=$sub"                                         \
  -F "hub.topic=https://github.com/$org/$repo/events/$event" \
  -F "hub.callback=$server"

