#
# Cookbook Name:: python_server
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end

include_recipe 'apt'
include_recipe 'git'
include_recipe 'nginx'
include_recipe 'python'

include_recipe 'python_server::nginx' 
include_recipe 'python_server::python'