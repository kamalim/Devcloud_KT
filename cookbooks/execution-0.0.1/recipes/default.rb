#
# Cookbook Name:: execution
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "wget" do
	cwd "/tmp"
	command "wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz"
	not_if "test -f /tmp/ruby-1.9.3-p194.tar.gz"
end
execute "tar" do 
	cwd "/tmp"
	command "tar -zxvf ruby-1.9.3-p194.tar.gz"
	not_if "test -d /tmp/ruby-1.9.3-p194"
	
end

