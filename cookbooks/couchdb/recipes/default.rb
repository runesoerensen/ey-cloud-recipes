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

template "/etc/couchdb/local.ini" do
  owner node[:owner_name]
  group node[:owner_name]
  mode 0644
  source "couchdb_conf.erb"
end