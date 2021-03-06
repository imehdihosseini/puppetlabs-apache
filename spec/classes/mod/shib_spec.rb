# frozen_string_literal: true

require 'spec_helper'

describe 'apache::mod::shib', type: :class do
  it_behaves_like 'a mod class, without including apache'
  context 'on a Debian OS' do
    let :facts do
      {
        osfamily: 'Debian',
        operatingsystemrelease: '8',
        lsbdistcodename: 'jessie',
        operatingsystem: 'Debian',
        id: 'root',
        kernel: 'Linux',
        path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        fqdn: 'test.example.com',
        is_pe: false,
      }
    end

    describe 'with no parameters' do
      it { is_expected.to contain_apache__mod('shib2').with_id('mod_shib') }
    end
  end
  context 'on a RedHat OS' do
    let :facts do
      {
        osfamily: 'RedHat',
        operatingsystemrelease: '6',
        operatingsystem: 'RedHat',
        id: 'root',
        kernel: 'Linux',
        path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        fqdn: 'test.example.com',
        is_pe: false,
      }
    end

    describe 'with no parameters' do
      it { is_expected.to contain_apache__mod('shib2').with_id('mod_shib') }
    end
  end
end
