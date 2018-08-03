# frozen_string_literal: true

require 'rails_helper'

describe Admin::BlocksController do
  let!(:block) { FactoryBot.create(:block) }
  let(:page_id) { block.page_id }

  describe 'GET #new' do
    before { get :new,  params: { page_id: page_id } }

    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :new }
  end

  describe 'POST #create' do
    let(:params) do
      { page_id: page_id, block: { weight: 1 } }
    end

    before { post :create, params: params }

    it { is_expected.to redirect_to edit_admin_page_path(page_id) }
    it 'should create a new block' do
      expect do
        post :create, params: params
      end.to change(Block, :count).by(+1)
    end
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

      it { is_expected.to redirect_to edit_admin_page_path(new_block.page.id) }
    end
  end
end
