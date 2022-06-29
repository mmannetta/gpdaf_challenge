package "httpd" do
  action :install
end

service "httpd" do
  action :enable
end

service "httpd" do
  action :start
end

file "/var/www/html/index.html" do
  content '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
<META http-equiv=Refresh Content="0; Url=cgi-bin/sysinfo.cgi">
</HEAD>
</HTML>'
  mode '0755'
  owner 'mark'
  group 'mark'
end

file "/var/www/cgi-bin/sysinfo.cgi" do
  content '#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>Demo</title></head><body>"
echo "Today is $(date) <br>"
echo "The operating system is $(uname -a | awk \'{print $1" "$3}\') <br>"
echo "This system\'s IP is $(ifconfig | grep 192.168.15.1 | awk \'{print $2}\')"
echo "</body></html>"'
  mode '0755'
  owner 'mark'
  group 'mark'
end

