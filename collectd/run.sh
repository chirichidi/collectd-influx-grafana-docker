#!/bin/sh

set -e

exec gosu nobody collectd -f > /dev/null