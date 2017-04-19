require 'rails_helper'

RSpec.describe KnowledgeObjectsController, type: :controller do
  describe 'GET #index' do
    let(:great_theme) {Fabricate :great_theme}
    before {get :index, params: {great_theme_id: great_theme.id, format: :json}}
    it {expect(response.status).to eq(200)}
    it {expect(response.content_type).to eq('application/json')}
    it {expect(response.body).to eq(great_theme.knowledge_objects.to_json)}
  end
end
