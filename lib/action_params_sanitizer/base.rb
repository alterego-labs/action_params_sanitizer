class ActionParamsSanitizer::Base < Struct.new(:params)
  include ActionParamsSanitizer::Concerns::MethodBuilder
end
