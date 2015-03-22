require 'spec_helper'

class UsersController
  include ActionParamsSanitizer::Helpers::Controller

  def params
    {}
  end
end

module Users
  class CreateParamsSanitizer < ActionParamsSanitizer::Base
  end
end

describe ActionParamsSanitizer::Helpers::Controller do
  let(:controller) { UsersController.new }

  context 'provides catching implicitly calling params sanitizer' do
    subject(:sanitizer) { controller.create_params }

    it { is_expected.to be_kind_of Users::CreateParamsSanitizer }
  end
end
