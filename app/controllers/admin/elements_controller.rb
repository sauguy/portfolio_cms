module Admin
  class ElementsController < ApplicationController
    def new
      render 'new', locals: { element: Element.new(block_id: block.id) }
    end

    private

    def block
      @block ||= Block.find(params[:block_id])
    end
  end
end
