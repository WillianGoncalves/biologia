require 'rails_helper'

RSpec.describe AbilitiesController, type: :controller do
  describe 'GET #index' do
    let(:great_theme) {Fabricate :great_theme}
    let(:knowledge_object) {great_theme.knowledge_objects.first}
    before {get :index, params: {knowledge_object_id: knowledge_object.id}}
    it {expect(response.status).to eq(200)}
    it {expect(response.content_type).to eq('application/json')}
    it {expect(response.body).to eq(knowledge_object.abilities.to_json)}
  end
end
