#
# Cookbook Name:: postfix
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "postfix" do
	action :install
end

service "postfix" do
	action [:enable, :start]
end
