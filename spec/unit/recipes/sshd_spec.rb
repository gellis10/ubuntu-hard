#
# Cookbook:: ubuntu-hard
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'ubuntu-hard::sshd' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end
    let(:template) { chef_run.template('/etc/ssh/sshd_config') }

    it 'creates a template with the default action' do
      expect(chef_run).to create_template('/etc/ssh/sshd_config')
    end

    it 'sends a notification to the ssh service' do
      expect(template).to notify('service[ssh]').to(:restart).delayed
    end

  end
end
