require 'spec_helper'

case property[:os][:family]
when /centos/
  describe package('vim-enhanced') do
    it { should be_installed }
  end

  describe package('docker-io') do
    it { should be_installed }
  end

  describe package('chefdk') do
    it { should be_installed.with_version('0.2.2') }
  end

when /ubuntu/
  describe package('vim') do
    it { should be_installed }
  end

  describe package('lxc-docker') do
    it { should be_installed }
  end

  describe package('chefdk') do
    it { should be_installed.with_version('0.2.2-1') }
  end

end

describe package('git') do
  it { should be_installed }
end

describe service('docker') do
#  it { should be_enabled }
  it { should be_running }
end

describe file('/home/vagrant/.bashrc') do
  its(:content) { should match /eval \"\$\(chef shell-init bash\)\"/ }
end

describe file('/home/vagrant/.zshrc') do
  its(:content) { should match /eval \"\$\(chef shell-init zsh\)\"/ }
end

