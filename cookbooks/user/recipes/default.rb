#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user "Sam" do 
		home "/home/sam"
		gid "root"
		comment "Super Sam"
		action :create
end
directory "/opt/script" do
	action :create

end
cookbook_file "/opt/script/sum.sh" do
	source "sum.sh"
	mode "0755"
	
end
script "run_script" do 
	interpreter "bash"
	user "root"
	cwd "/opt/script"
	code <<-EOH
	./sum.sh
	EOH

end
	
cron "sum" do
hour "19"
minute "30"
command "/opt/script/sum.sh"
	action :create
end

		
