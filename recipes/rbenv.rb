##
# Cookbook Name:: clakeb
# Recipe:: rbenv
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

# Install rbenv
directory "#{node['etc']['passwd'][node['current_user']]['dir']}/#{node[:rbenv][:dir]}" do
  owner node['current_user']
end

git "#{node['etc']['passwd'][node['current_user']]['dir']}/#{node[:rbenv][:dir]}" do
  repository node[:rbenv][:repo]
  enable_submodules true
  action :checkout
  user node['current_user']
end

%w{shims versions plugins}.each do |dir_name|
  directory "#{node['etc']['passwd'][node['current_user']]['dir']}/#{node[:rbenv][:dir]}" do
    owner node['current_user']
    mode "2775"
    action [:create]
  end
end

# rbenv plugins
node[:rbenv][:plugins].each do |folder, repo|

  directory "#{node['etc']['passwd'][node['current_user']]['dir']}/#{node[:rbenv][:dir]}/plugins/#{folder}" do
    owner node['current_user']
  end

  git "#{node['etc']['passwd'][node['current_user']]['dir']}/#{node[:rbenv][:dir]}/plugins/#{folder}" do
    repository repo
    enable_submodules true
    action :checkout
    user node['current_user']
  end
end

# Rubies & Gems
node[:rbenv][:install][:rubies].each do |version, gems|
  rbenv_ruby version

  gems.each do |gem|
    rbenv_gem gem do
      ruby_version version
      # options ["--no-rdoc", "--no-ri"]
    end
  end

end
