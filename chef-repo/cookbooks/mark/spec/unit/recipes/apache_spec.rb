#
# Cookbook:: mark
# Spec:: apache
#
# Copyright:: 2021, The Authors, All Rights Reserved.

require 'chefspec'

describe 'mark::apache' do
  context 'When all attributes are default, on Ubuntu 20.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '20.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs the httpd package' do
      expect(chef_run).to install_package('httpd')
    end

    it 'creates the index.html file from template' do
      expect(chef_run).to create_template('/var/www/html/index.html')
    end

    it 'creates the sysinfo.cgi file from template' do
      expect(chef_run).to create_template('/var/www/cgi-bin/sysinfo.cgi')
    end

    it 'enables and starts httpd service' do
      expect(chef_run).to enable_service('httpd')
      expect(chef_run).to start_service('httpd')
    end
  end
end
