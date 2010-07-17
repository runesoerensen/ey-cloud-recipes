package "dev-db/couchdb" do
  package_name "dev-db/couchdb"
  action :upgrade
  version "0.9.1"
end

directory "/var/run/couchdb" do
  owner 'couchdb'
  group 'couchdb'
  mode 0755
  recursive true
end

template "/data/monit.d/couchdb_util.monitrc" do
  owner 'root'
  group 'root'
  mode 0644
  source "couchdb.monitrc.erb"
  variables({
    :profile => '3',
  })
end

execute "start-couchdb" do
  command "/etc/init.d/couchdb start"
  action :run
  not_if "/etc/init.d/couchdb status"
end