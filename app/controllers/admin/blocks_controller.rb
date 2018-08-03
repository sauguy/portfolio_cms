# frozen_string_literal: true

module Admin
  class BlocksController < ApplicationController
    def new
      render 'new', locals: { block: ::Block.new }
    end

    def create
      ::Block.create(filtered_params.merge(page_id: params[:page_id]))
      redirect_to edit_admin_page_path(params[:page_id])
    end

    def edit
      render 'edit', locals: { block: block }
    end

    def update
      block.update(filtered_params)
      redirect_to edit_admin_block_path(block)
    end

    def destroy
      page_id = block.page.id
      block.destroy
      redirect_to edit_admin_page_path(page_id)
    end

    private

    def blocks
      @blocks ||= find_blocks
    end

    def find_blocks
      return ::Block.all if params['page_id'].blank?
      ::Page.find(params['page_id']).blocks
    end

    def block
      @block ||= find_block
    end

    def find_block
      ::Block.find(params['id']) if params['id']
    end

    def filtered_params
      params[:block].permit(:weight, :page_id)
    end
  end
end
