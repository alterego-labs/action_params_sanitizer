module ActionParamsSanitizer
  module Helpers
    class SanitizerClassBuilder < Struct.new(:method_name, :controller_name)
      def build_class
        "#{namespace}::#{sanitizer_class_name}".constantize
      end

      private

      def namespace
        controller_name.to_s.gsub(/Controller$/, '')
      end

      def action
        method_name.to_s.gsub(/_params$/, '')
      end

      def sanitizer_class_name
        "#{action.capitalize}ParamsSanitizer"
      end
    end
  end
end
