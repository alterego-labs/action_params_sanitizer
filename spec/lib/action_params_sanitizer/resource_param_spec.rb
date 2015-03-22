require 'spec_helper'

class ResourceParamsSanitizer < ActionParamsSanitizer::Base
  resource :user
  resource picture: [:url]
end

describe 'Defining resource params' do
  subject(:sanitizer) { ResourceParamsSanitizer.new(params) }

  let(:params) { ActionController::Parameters.new(raw_params) }
  let(:raw_params) do
    {
      user: {
        nickname: 'nickname',
        email: 'some@mail.com'
      },
      picture: {
        url: 'http://some.url',
        weight: 200,
        height: 100
      }
    }
  end

  context 'by default' do
    it { is_expected.to respond_to :user_params }

    its('user_params.keys') { is_expected.to include('nickname', 'email') }
  end

  context 'with permitting' do
    it { is_expected.to respond_to :picture_params }

    its('picture_params.keys') { is_expected.to include('url') }
    its('picture_params.keys') { is_expected.to_not include('weight', 'height') }
  end
end
