require 'rails_helper'

RSpec.describe KnowledgeObjectsController, type: :controller do
  context 'json' do
    describe 'GET #index' do
      let(:great_theme) { Fabricate :great_theme }
      before { get :index, params: { great_theme_id: great_theme.id, format: :json } }
      it { expect(response.status).to eq(200) }
      it { expect(response.content_type).to eq('application/json') }
      it { expect(response.body).to eq great_theme.knowledge_objects.to_json }
    end
  end

  context 'rails' do
    let(:gt) { Fabricate :great_theme }

    context 'GET #index' do
      describe 'with great_theme_id' do
        before { get :index, params: { great_theme_id: gt } }
        it { expect(response).to render_template :index }
        it { expect(assigns(:knowledge_objects)).to eq gt.knowledge_objects }
      end

      describe 'without great_theme_id' do
        before { get :index }
        it { expect(response).to render_template :index }
        it { expect(assigns(:knowledge_objects)).to eq KnowledgeObject.all }
      end
    end

    describe 'GET #new' do
      before { get :new }
      it { expect(response).to render_template :new }
      it { expect(assigns(:knowledge_object)).to be_a_new KnowledgeObject }
    end

    describe 'GET #show' do
      let(:ko) { Fabricate :knowledge_object }
      before { get :show, params: { id: ko } }
      it { expect(response).to render_template :show }
      it { expect(assigns(:knowledge_object)).to eq ko }
    end

    describe 'GET #edit' do
      let(:ko) { Fabricate :knowledge_object }
      before { get :edit, params: { id: ko } }
      it { expect(response).to render_template :edit }
      it { expect(assigns(:knowledge_object)).to eq ko }
    end

    describe 'DELETE' do
      let(:ko) { Fabricate :knowledge_object }
      before { delete :destroy, params: { id: ko } }
      it { expect(response).to redirect_to knowledge_objects_path }
      it { expect(KnowledgeObject.all.include?(ko)).to eq false }
    end

    context 'with invalid values' do
      describe 'POST #create' do
        let(:ko) { { description: '', great_theme_id: gt } }
        before { post :create, params: { knowledge_object: ko } }
        it { expect(response.status).to eq 400}
        it { expect(response).to render_template :new }
      end

      describe 'PUT #update' do
        let(:ko) { Fabricate :knowledge_object }
        let(:invalid_ko) { { description: '', great_theme_id: gt } }
        before { put :update, params: { id: ko, knowledge_object: invalid_ko } }
        it { expect(response.status).to eq 400 }
        it { expect(response).to render_template :edit }
      end
    end

    context 'with valid values' do
      describe 'POST #create' do
        let(:ko) { { description: 'foo', great_theme_id: gt } }
        before { post :create, params: { knowledge_object: ko } }
        it { expect(assigns(:knowledge_object).great_theme).to eq gt }
        it { expect(response).to redirect_to knowledge_objects_path }
      end

      describe 'PUT #update' do
        let(:ko) { Fabricate :knowledge_object }
        let(:valid_ko) { { description: 'foo', great_theme_id: gt } }
        before { put :update, params: { id: ko, knowledge_object: valid_ko } }
        it { expect(response).to redirect_to knowledge_objects_path }
      end
    end
  end

end
