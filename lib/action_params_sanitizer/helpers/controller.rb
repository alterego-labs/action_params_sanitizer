module ActionParamsSanitizer
  module Helpers
    module Controller
      def method_missing(name, *args, &_block)
        if params_fetching?(name)
          build_params_sanitizer(name)
        else
          super
        end
      end

      private

      def params_fetching?(name)
        name =~ /_params$/
      end

      def build_params_sanitizer(name)
        klass = SanitizerClassBuilder.new(name, self.class.name).build_class
        klass.new params
      end
    end
  end
end
