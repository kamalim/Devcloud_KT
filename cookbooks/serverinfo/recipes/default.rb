#
# Cookbook Name:: serverinfo
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "/root/serverinfo.sh" do
	source "serverinfo.sh"
	mode "755"
	action :create
end
cron "serverreport" do
	minute "*/5"
	command "/root/serverinfo.sh"
	mailto "kamalim@thoughtworks.com"
	action :create
end
	
	
