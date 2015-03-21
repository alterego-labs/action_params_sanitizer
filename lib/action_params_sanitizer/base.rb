class ActionParamsSanitizer::Base < Struct.new(:params)
  include ActionParamsSanitizer::Concerns::SingleParamBuilder
end
