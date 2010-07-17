package "dev-db/couchdb" do
  package_name "dev-db/couchdb"
  action :upgrade
  version "0.9.1"
end

directory "/var/run/couchdb" do
  owner 'couchdb'
  group 'couchdb'
  mode 0644
  recursive true
end

template "/data/monit.d/couchdb_util.monitrc" do
  owner 'root'
  group 'root'
  mode 0644
  source "couchdb.monitrc.erb"
end

execute "start-couchdb" do
  command "/usr/bin/couchdb start -b"
  action :run
  not_if "/usr/bin/couchdb status"
end