$TESTING=true
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rspec/its'
require 'action_params_sanitizer'
require 'pry-nav'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.order = "random"
end