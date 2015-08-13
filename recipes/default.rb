#
# Cookbook Name:: batsception
# Recipe:: default
#
# Copyright (c) 2015 Adam Leff
#

package 'git'

directory '/var/tmp/bats-install' do
  recursive true
  action :create
end

git '/var/tmp/bats-install' do
  repository 'https://github.com/sstephenson/bats.git'
  action :sync
end

execute 'install bats' do
  command '/var/tmp/bats-install/install.sh /usr/local'
  cwd '/var/tmp/bats-install'
  action :run
  not_if { ::File.exist?('/usr/local/bin/bats') }
end
