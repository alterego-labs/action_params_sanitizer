require 'spec_helper'

module Users
  class CreateParamsSanitizer
  end

  module Api
    class SearchParamsSanitizer
    end
  end
end

describe ActionParamsSanitizer::Helpers::SanitizerClassBuilder do
  subject(:builder) { described_class.new(method_name, controller_name) }

  context 'when controller is not namespaced' do
    let(:method_name) { :create }
    let(:controller_name) { 'UsersController' }

    its(:build_class) { is_expected.to eq Users::CreateParamsSanitizer }
  end

  context 'when controller is namespaced' do
    let(:method_name) { :search }
    let(:controller_name) { 'Users::ApiController' }

    its(:build_class) { is_expected.to eq Users::Api::SearchParamsSanitizer }
  end
end
