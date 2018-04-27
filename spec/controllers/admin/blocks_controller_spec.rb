# frozen_string_literal: true

require 'rails_helper'

describe Admin::BlocksController do
  let!(:block) { FactoryBot.create(:block) }
  let(:page_id) { block.page_id }

  describe 'GET #index' do
    let!(:other_block) { FactoryBot.create(:block) }
    context 'general scope' do
      before { get :index }

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template :index }
      it 'should display all the pages' do
        assert_equal Block.all, assigns(:blocks)
      end
    end

    context 'pages scope' do
      before { get :index, params: { page_id: page_id } }

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template :index }
      it 'should display only the blocks related to this page' do
        assert_equal Block.where(page_id: page_id), assigns(:blocks)
      end
    end
  end

  describe 'GET #new' do
    before { get :new,  params: { page_id: page_id } }

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :new }
  end

  describe 'POST #create' do
    let(:params) do
      { block: { weight: 1, page_id: page_id } }
    end

    before { post :create, params: params }

    it { is_expected.to redirect_to admin_path }
    it 'should create a new block' do
      expect do
        post :create, params: params
      end.to change(Block, :count).by(+1)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: block } }

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :show }
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: block } }

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :edit }
  end

  describe 'PUT #update' do
    let(:params) do
      { id: block,
        block: { weight: 10 } }
    end

    before { put :update, params: params }

    it { is_expected.to redirect_to edit_admin_block_path(block) }
    it 'should update the block' do
      expect(find_block.weight).to eq params.dig(:block, :weight)
    end
  end

  def find_block
    Block.find(block.id)
  end

  describe 'DELETE #destroy' do
    it 'should delete the block' do
      expect do
        delete :destroy, params: { id: block }
      end.to change(Block, :count).by(-1)
    end

    describe 'redirection' do
      let(:new_block) { FactoryBot.create(:block) }

      before { delete :destroy, params: { id: new_block } }

      it { is_expected.to redirect_to admin_path }
    end
  end
end
