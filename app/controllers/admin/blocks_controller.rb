module Admin
  class BlocksController < ApplicationController
    def index
      render 'index', locals: { blocks: blocks }
    end

    def new; end

    def create
      ::Block.create(filtered_params)
      redirect_to admin_path
    end

    def show
      render 'show', locals: { block: block }
    end

    def edit
      render 'edit', locals: { block: block }
    end

    def update
      block.update(filtered_params)
      redirect_to edit_admin_block_path(block)
    end

    def destroy
      block.destroy
      redirect_to admin_path
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
