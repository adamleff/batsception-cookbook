#
# Cookbook Name:: batsception
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'batsception::default' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  it 'installs git' do
    expect(chef_run).to install_package('git')
  end
  
  it 'creates the scratch directory' do
    expect(chef_run).to create_directory('/var/tmp/bats-install')
  end

  it 'syncs the git repo' do
    expect(chef_run).to sync_git('/var/tmp/bats-install')
      .with(repository: 'https://github.com/sstephenson/bats.git')
  end

  it 'runs the install script' do
    expect(chef_run).to run_execute('/var/tmp/bats-install/install.sh')
  end
end
