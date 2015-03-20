module ActionParamsSanitizer
  module Concerns
    module MethodBuilder
      def self.included(base)
        base.send :extend, ClassMethods
      end

      module ClassMethods
        DEFAULT_SCOPE = ->{ params }

        def param(*names, scope: nil)
          [*names].each do |name|
            define_method name do
              self.instance_exec(&(scope || DEFAULT_SCOPE))[name]
            end
          end
        end
      end
    end
  end
end
