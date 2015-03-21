module ActionParamsSanitizer
  module Concerns
    module SingleParamBuilder
      def self.included(base)
        base.send :extend, ClassMethods
      end

      module ClassMethods
        DEFAULT_SCOPE = ->{ params }

        def param(*names, scope: nil)
          scope = scope || DEFAULT_SCOPE
          define_single_params [*names], scope
        end

        private

        def define_single_params(names, scope)
          names.each { |name| define_single_param_method(name, scope) }
        end

        def define_single_param_method(name, scope)
          define_method name do
            self.instance_exec(&scope)[name]
          end
        end
      end
    end
  end
end

