require 'rails_helper'

RSpec.describe GreatThemesController, type: :controller do
  context 'json' do
    describe 'GET #index' do
      before { get :index, params: { format: :json } }
      it { expect(response.status).to eq(200) }
      it { expect(response.content_type).to eq('application/json') }
    end
  end

  describe 'GET #index' do
    before { get :index }
    it { expect(response.status).to eq(200) }
  end

  describe 'GET #new' do
    before { get :new}
  end
end
