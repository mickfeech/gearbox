require 'gearbox'
require 'rspec/its'
require 'support/shared_configuration'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<GEARBOX_AUTH_TOKEN>') {ENV['auth_token']}
  c.filter_sensitive_data('<GEARBOX_BASE_URL>') {ENV['base_url']}
  c.filter_sensitive_data('<SERVER>') {ENV['server_names']}
end