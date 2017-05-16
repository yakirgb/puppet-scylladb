require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'
require 'metadata-json-lint/rake_task'

exclude_paths = [
  "pkg/**/*",
  "vendor/**/*",
  "spec/**/*",
]

PuppetLint.configuration.log_format = "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}"
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.send("disable_autoloader_layout")
PuppetLint.configuration.ignore_paths = exclude_paths

task :test => [
  :syntax,
  :lint,
  :metadata_lint,
  :spec,
]
