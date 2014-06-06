execute 'create_postgis_template' do
  not_if "psql -qAt --list | grep -q '^#{node['postgis']['template_name']}\|'", :user => 'postgres'
  user 'postgres'
  command <<CMD
(createdb -E UTF8 --locale=#{node['postgis']['locale']} #{node['postgis']['template_name']} -T template0) &&
(psql -d #{node['postgis']['template_name']} --command="CREATE EXTENSION postgis" )
CMD
  action :run
end
