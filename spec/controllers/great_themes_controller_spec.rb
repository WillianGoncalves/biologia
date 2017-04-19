require 'rails_helper'

RSpec.describe GreatThemesController, type: :controller do
  describe 'GET #index' do
    before {get :index, params: {format: :json}}
    it {expect(response.status).to eq(200)}
    it {expect(response.content_type).to eq('application/json')}
  end
end
