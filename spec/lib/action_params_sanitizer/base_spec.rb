require 'spec_helper'

describe ActionParamsSanitizer::Base do
  subject(:base_sanitizer) { described_class.new(params) }

  let(:params) { ActionController::Parameters.new(raw_params) }
  let(:raw_params) { {} }

  it { is_expected.to respond_to :params }

  context 'sets params properly' do
    its(:params) { is_expected.to eq params }
  end
end
