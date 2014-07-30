##
# Cookbook Name:: clakeb
# Recipe:: dev
#
# Copyright (C) 2014 C. Blake Barber
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

node[:dev][:dirs].each do |folder, repos|
  directory "#{node['etc']['passwd'][node['current_user']]['dir']}/#{folder}" do
    owner node['current_user']
  end

  repos.each do |repo_folder, repo|

    directory "#{node['etc']['passwd'][node['current_user']]['dir']}/#{folder}/#{repo_folder}" do
      owner node['current_user']
    end

    git "#{node['etc']['passwd'][node['current_user']]['dir']}/#{folder}/#{repo_folder}" do
      repository repo
      enable_submodules true
      action :checkout
      user node['current_user']
    end
  end
end

## APM
# Packages
node[:dev][:apms].each do |apm|
  execute "apm install #{apm}"
end
