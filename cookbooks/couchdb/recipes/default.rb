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
