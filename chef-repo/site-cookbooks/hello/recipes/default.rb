#
# Cookbook Name:: hello
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "vim-enhanced" do
  action :install
end

# iptableをstopさせる
# service iptables stop
# chkconfig iptables off

service "iptables" do
  action [:stop, :disable]
end

%w{php mysql-server httpd}.each do |p|
  package p do
    action :install
  end
end

service "httpd" do
  action :start
end

template "index.html" do
  path "/var/www/html/index.html"
  source "index.html.erb"
  mode 0644
end

template "httpd.conf" do
  path "/etc/httpd/conf/httpd.conf"
  source "httpd.conf.erb"
  mode 0644
  notifies :restart, 'service[httpd]'
end
