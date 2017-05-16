require 'rails_helper'

RSpec.describe GreatThemesController, type: :controller do
  context 'json' do
    describe 'GET #index' do
      let(:discipline) { Fabricate :discipline }
      before { get :index, params: { discipline_id: discipline.id, format: :json } }
      it { expect(response.status).to eq(200) }
      it { expect(response.content_type).to eq('application/json') }
      it { expect(response.body).to eq discipline.great_themes.to_json }
    end
  end

  context 'rails' do
    let(:discipline) { Fabricate :discipline }

    describe 'GET #index' do
      before { get :index, params: { discipline_id: discipline.id } }
      it { expect(response).to render_template :index }
      it { expect(assigns(:great_themes)).to match_array discipline.great_themes }
    end

    describe 'GET #new' do
      before { get :new }
      it { expect(response).to render_template :new }
    end

    describe 'GET #show' do
      let(:gt) { Fabricate :great_theme }
      before { get :show, params: { discipline_id: discipline.id, id: gt.id } }
      it { expect(response).to render_template :show }
    end

    describe 'GET #edit' do
      let(:gt) { Fabricate :great_theme }
      before { get :edit, params: { discipline_id: discipline.id, id: gt.id } }
      it { expect(response).to render_template :edit }
    end

    describe 'DELETE' do
      let(:gt) { Fabricate :great_theme }
      before { delete :destroy, params: { discipline_id: discipline.id, id: gt.id } }
      it { expect(response).to redirect_to great_themes_path }
      it { expect(GreatTheme.count).to eq 0 }
    end

    context 'with invalid values' do
      describe 'POST #create' do
        let(:discipline) { Fabricate :discipline }
        let(:gt) { { description: '', discipline_id: discipline.id } }
        before { post :create, params: { great_theme: gt } }
        it { expect(response.status).to eq 400 }
        it { expect(response).to render_template :new }
      end

      describe 'PUT #update' do
        let(:discipline) { Fabricate :discipline }
        let(:gt) { Fabricate :great_theme, discipline: discipline }
        let(:invalid_gt) { { description: '' } }
        before { put :update, params: { discipline_id: discipline.id, id: gt.id, great_theme: invalid_gt } }
        it { expect(response.status).to eq 400 }
        it { expect(response).to render_template :edit }
      end
    end

    context 'with valid values' do
      describe 'POST #create' do
        let(:discipline) { Fabricate :discipline }
        let(:gt) { { description: 'foo', discipline_id: discipline.id } }
        before { post :create, params: { great_theme: gt } }
        it { expect(assigns(:great_theme).discipline).to eq discipline }
        it { expect(response).to redirect_to great_themes_path }
      end

      describe 'PUT #update' do
        let(:discipline) { Fabricate :discipline }
        let(:gt) { Fabricate :great_theme, discipline: discipline }
        let(:valid_gt) { { description: 'foo' } }
        before { put :update, params: { discipline_id: discipline.id, id: gt.id, great_theme: valid_gt } }
        it { expect(response).to redirect_to great_themes_path }
      end
    end
  end

end
