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

## Dirs & Repos
node[:dev][:dirs].each do |parent, repos|
  unless Dir.exist? "#{node[:system][:home_dir]}/#{parent}"
    directory "#{node[:system][:home_dir]}/#{parent}" do
      owner node[:system][:user]
      group node[:system][:group]
      mode 00755
    end
  end

  repos.each do |repo|
    git "#{node[:system][:home_dir]}/#{parent}" do
      repository repo
      action :sync
      user node[:system][:user]
      group node[:system][:group]
    end
  end
end

## ST3
# Get package control

# Move settings, packages, keymaps & license

## APM
# Packages
node[:dev][:apms].each do |apm|
  execute "apm install #{apm}"
end
# Config, theme & keymaps

## NPM
# Packages
node[:dev][:npms].each do |npm|
  execute "npm install -g #{npm}"
end

link "/etc/hosts" do
  to "#{node[:system][:home_dir]}/Development/hosts"
end
