require 'rails_helper'

describe Admin::PortfoliosController do
  let!(:portfolio) { FactoryBot.create(:portfolio) }

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
      { portfolio: { name: 'P1', description: 'Description of P1' } }
    end

    before { post :create, params: params }

    it { is_expected.to redirect_to admin_path }
    it 'should create a new portfolio' do
      expect do
        post :create, params: params
      end.to change(Portfolio, :count).by(+1)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: portfolio } }

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :show }
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: portfolio } }

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :edit }
  end

  describe 'PUT #update' do
    let(:params) do
      { id: portfolio,
        portfolio: { name: 'New name',
                     description: 'New description' } }
    end

    before { put :update, params: params }

    it { is_expected.to redirect_to edit_admin_portfolio_path(portfolio) }
    it 'should update the portfolio' do
      expect(find_portfolio.name).to eq params.dig(:portfolio, :name)
      expect(find_portfolio.description)
        .to eq params.dig(:portfolio, :description)
    end
  end

  def find_portfolio
    ::Portfolio.find(portfolio.id)
  end

  describe 'DELETE #destroy' do
    it 'should delete the portfolio' do
      expect do
        delete :destroy, params: { id: portfolio }
      end.to change(Portfolio, :count).by(-1)
    end

    describe 'redirection' do
      let(:new_portfolio) { FactoryBot.create(:portfolio) }

      before { delete :destroy, params: { id: new_portfolio } }

      it { is_expected.to redirect_to admin_path }
    end
  end
end
