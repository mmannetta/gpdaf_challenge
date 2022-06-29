#
# Cookbook:: mark
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#
file "/var/www/html/index.html" do
  content '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
<META http-equiv=Refresh Content="0; Url=cgi-bin/sysinfo.cgi">
</HEAD>
</HTML>'
  end

file "/var/www/cgi-bin/sysinfo.cgi" do
  content '#!/bin/bash

echo "Content-type: text/html"
echo ""
echo "<html><head><title>Demo</title></head><body>"
echo "Today is $(date) <br>"
echo "The operating system is $(uname -a | awk \'{print $1" "$3}\') <br>"
echo "This system\'s IP is $(ifconfig | grep .141 | awk \'{print $2}\')"
echo "</body></html>"'
  end

