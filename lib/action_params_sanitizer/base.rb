class ActionParamsSanitizer::Base < Struct.new(:params)
  include ActionParamsSanitizer::Concerns::SingleParamBuilder
  include ActionParamsSanitizer::Concerns::ResourceParamBuilder
end
