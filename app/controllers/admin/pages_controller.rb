module Admin
  class PagesController < ApplicationController

    def index
      render 'index', locals: { pages: pages }
    end

    def new; end

    def create
      ::Page.create(filtered_params)
      redirect_to admin_path
    end

    def show
      render 'show', locals: { page: page }
    end

    def edit
      render 'edit', locals: { page: page }
    end

    def update
      page.update(filtered_params)
      redirect_to edit_admin_page_path(page)
    end

    def destroy
      page.destroy
      redirect_to admin_path
    end

    private

    def pages
      @pages ||= find_pages
    end

    def find_pages
      return ::Page.all if params['portfolio_id'].blank?
      ::Portfolio.find(params['portfolio_id']).pages
    end

    def page
      @page ||= find_page
    end

    def find_page
      ::Page.find(params['id']) if params['id']
    end

    def filtered_params
      params[:page].permit(:path, :portfolio_id)
    end
  end
end
