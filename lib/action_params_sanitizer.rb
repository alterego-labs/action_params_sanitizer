require "action_params_sanitizer/version"

module ActionParamsSanitizer
  autoload :Base, 'action_params_sanitizer/base.rb'

  module Concerns
    autoload :SingleParamBuilder, 'action_params_sanitizer/concerns/single_param_builder.rb'
    autoload :ResourceParamBuilder, 'action_params_sanitizer/concerns/resource_param_builder.rb'
  end

  module Helpers
    autoload :Controller, 'action_params_sanitizer/helpers/controller.rb'
    autoload :SanitizerClassBuilder, 'action_params_sanitizer/helpers/sanitizer_class_builder.rb'
  end
end
