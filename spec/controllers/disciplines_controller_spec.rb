require 'rails_helper'

RSpec.describe DisciplinesController, type: :controller do
  context 'javascript' do
    describe 'GET #index' do
      before { get :index, params: { format: :json } }
      it { expect(response.status).to eq(200) }
      it { expect(response.content_type).to eq('application/json') }
    end
  end

  context 'rails' do
    describe 'GET #index' do
      before { get :index }
      it { expect(response).to render_template :index }
    end

    describe 'GET #new' do
      before { get :new }
      it { expect(response).to render_template :new }
      it { expect(assigns(:discipline)).to be_a_new Discipline }
    end

    describe 'GET #show' do
      let(:discipline) { Fabricate :discipline }
      before { get :show, params: { id: discipline.id } }
      it { expect(response).to render_template :show }
      it { expect(assigns(:discipline)).to eq discipline }
    end

    describe 'GET #edit' do
      let(:discipline) { Fabricate :discipline }
      before { get :edit, params: { id: discipline.id } }
      it { expect(response).to render_template :edit }
      it { expect(assigns(:discipline)).to eq discipline }
    end

    describe 'DELETE' do
      let(:discipline) { Fabricate :discipline }
      before { delete :destroy, params: { id: discipline.id } }
      it { expect(response).to redirect_to disciplines_path }      
    end

    context 'with invalid values' do
      describe 'POST #create' do
        let(:discipline) { { description: '' } }
        before { post :create, params: { discipline: discipline } }
        it { expect(response.status).to eq 400 }
        it { expect(response).to render_template :new }
      end

      describe 'PUT #update' do
        let(:discipline) { Fabricate :discipline }
        let(:invalid_discipline) { { description: '' } }
        before { put :update, params: { id: discipline.id, discipline: invalid_discipline } }
        it { expect(response.status).to eq 400 }
        it { expect(response).to render_template :edit }
      end
    end

    context 'with valid values' do
      describe 'POST #create' do
        let(:discipline) { { description: 'foo' } }
        before { post :create, params: { discipline: discipline } }
        it { expect(response).to redirect_to disciplines_path }
      end

      describe 'PUT #update' do
        let(:discipline) { Fabricate :discipline }
        let(:valid_discipline) { { description: 'foo' } }
        before { put :update, params: { id: discipline.id, discipline: valid_discipline } }
        it { expect(response).to redirect_to disciplines_path }
      end
    end
  end
end
