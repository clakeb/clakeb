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
git node[:rbenv][:repo][:location] do
  repository node[:rbenv][:repo]
  reference node[:rbenv][:revision]
  action :sync
  user node[:system][:user]
  group node[:system][:group]
end

# rbenv plugins
node[:rbenv][:plugins].each do |plugin, repo|
  git "#{node[:rbenv][:plugins][:location]}/#{plugin}" do
    repository repo
    reference node[:rbenv][:revision]
    action :sync
    user node[:system][:user]
    group node[:system][:group]
  end
end

# Rubies & Gems
node[:rbenv][:install][:rubies].each do |version, gems|
  ruby_ruby version

  gems.each do |gem|
    rbenv_gem gem do
      ruby_version version
      options "--no-rdoc --no-ri"
    end
  end

end
