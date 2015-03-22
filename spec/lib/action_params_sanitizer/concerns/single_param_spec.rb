require 'spec_helper'

class SomeParamsSanitizer < ActionParamsSanitizer::Base
  param :some_single
  param :another_single, scope: -> { scope_for_another }

  def scope_for_another
    params[:some_resource]
  end
end

describe 'Defining single params' do
  subject(:sanitizer) { SomeParamsSanitizer.new(params) }

  let(:params) { ActionController::Parameters.new(raw_params) }
  let(:raw_params) do
    {
      some_single: 'single_value',
      some_resource: {
        another_single: 'another_value'
      }
    }
  end

  context 'by default' do
    it { is_expected.to respond_to :some_single }

    its(:some_single) { is_expected.to eq 'single_value' }
  end

  context 'with scope' do
    it { is_expected.to respond_to :another_single }

    its(:another_single) { is_expected.to eq 'another_value' }
  end
end
