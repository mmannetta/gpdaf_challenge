package "nginx" do
  action :disable
end

package "nginx" do
  action :stop
end

package "httpd" do
  action :install
end

service "httpd" do
  action :enable
end

service "httpd" do
  action :start
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  owner 'mark'
  group 'mark'
  mode  '755'
  action :create
end

template '/var/www/cgi-bin/sysinfo.cgi' do
  source 'sysinfo.cgi.erb'
  owner 'mark'
  group 'mark'
  mode  '755'
  action :create
end

