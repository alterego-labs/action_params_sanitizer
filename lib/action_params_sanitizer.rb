require "action_params_sanitizer/version"

module ActionParamsSanitizer
  autoload :Base, 'action_params_sanitizer/base.rb'

  module Concerns
    autoload :SingleParamBuilder, 'action_params_sanitizer/concerns/single_param_builder.rb'
  end
end
