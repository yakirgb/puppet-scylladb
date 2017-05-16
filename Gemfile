source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 3.3']
gem 'puppet', puppetversion
gem 'puppetlabs_spec_helper'
gem 'metadata-json-lint'
gem 'puppet-lint'
gem 'facter'
gem "puppet-blacksmith"


# Changelog generation gems
gem 'github_changelog_generator', '~> 1.13.0' if RUBY_VERSION < '2.2.2'
gem 'github_changelog_generator'              if RUBY_VERSION >= '2.2.2'
gem 'rack', '~> 1.0'                          if RUBY_VERSION < '2.2.2'
