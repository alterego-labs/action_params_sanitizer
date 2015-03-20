require "action_params_sanitizer/version"

module ActionParamsSanitizer
  autoload :Base, 'action_params_sanitizer/base.rb'

  module Concerns
    autoload :MethodBuilder, 'action_params_sanitizer/concerns/method_builder.rb'
  end
end
