#
# Cookbook Name:: gitolite
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "install_gitolite" do
	user "root"
	cwd "/tmp"
	code <<-EOH
	git clone git://github.com/sitaramc/gitolite.git
	gitolite/install -ln /usr/bin
	EOH
end
