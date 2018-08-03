# frozen_string_literal: true

require 'rails_helper'

describe Admin::PagesController do
  let!(:page) { FactoryBot.create(:page) }
  let(:portfolio_id) { page.portfolio_id }

  describe 'GET #new' do
    before { get :new,  params: { portfolio_id: portfolio_id } }

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :new }
  end

  describe 'POST #create' do
    let(:params) do
      { portfolio_id: portfolio_id, page: { name: 'P1' } }
    end

    before { post :create, params: params }

    it { is_expected.to redirect_to edit_admin_portfolio_path(portfolio_id) }
    it 'should create a new page' do
      expect do
        post :create, params: params
      end.to change(Page, :count).by(+1)
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: page } }

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :edit }
  end

  describe 'PUT #update' do
    let(:params) do
      { id: page,
        page: { name: 'other page' } }
    end

    before { put :update, params: params }

    it { is_expected.to redirect_to edit_admin_page_path(page) }
    it 'should update the page' do
      expect(find_page.name).to eq params.dig(:page, :name)
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
