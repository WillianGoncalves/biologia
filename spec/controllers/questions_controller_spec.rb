require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe 'GET #index' do
    before {get :index}
    it {expect(response.status).to eq(200)}
  end

  describe 'GET #new' do
    before {get :new}
    it {expect(response.status).to eq(200)}    
  end

end
