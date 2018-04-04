require 'rails_helper'

describe Admin::Portfolios::PagesController do
  let!(:page) { FactoryBot.create(:page) }

  describe 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :index }
  end

  describe 'GET #new' do
    before { get :new }

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :new }
  end

  describe 'POST #create' do
    let(:params) do
      { page: { name: 'P1', description: 'Description of P1' } }
    end

    before { post :create, params: params }

    it { is_expected.to redirect_to admin_path }
    it 'should create a new page' do
      expect do
        post :create, params: params
      end.to change(Page, :count).by(+1)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: page } }

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :show }
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: page } }

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :edit }
  end

  describe 'PUT #update' do
    let(:params) do
      { id: page,
        page: { name: 'New name',
                description: 'New description' } }
    end

    before { put :update, params: params }

    it { is_expected.to redirect_to edit_admin_page_path(page) }
    it 'should update the page' do
      expect(find_page.name).to eq params.dig(:page, :name)
      expect(find_page.description)
        .to eq params.dig(:page, :description)
    end
  end

  def find_page
    Page.find(page.id)
  end

  describe 'DELETE #destroy' do
    it 'should delete the page' do
      expect do
        delete :destroy, params: { id: page }
      end.to change(Page, :count).by(-1)
    end

    describe 'redirection' do
      let(:new_page) { FactoryBot.create(:page) }

      before { delete :destroy, params: { id: new_page } }

      it { is_expected.to redirect_to admin_path }
    end
  end
end
