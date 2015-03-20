require 'spec_helper'

describe ActionParamsSanitizer::Base do
  subject(:base_sanitizer) { described_class.new(params) }

  let(:params) { double }

  it { is_expected.to respond_to :params }

  context 'sets params properly' do
    its(:params) { is_expected.to eq params }
  end
end
