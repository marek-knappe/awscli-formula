require 'serverspec'
require 'yaml'

set :backend, :exec

system "salt-call --local --config-dir=/tmp/kitchen/etc/salt -l quiet --out=yaml --out-file=/tmp/pillar pillar.items 2>&1 > /dev/null"
