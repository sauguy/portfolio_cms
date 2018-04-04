module Admin
  module Portfolios
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
        ::Page.all
      end

      def page
        ::Page.find(params['id'])
      end

      def filtered_params
        params[:page].permit(:name, :description)
      end
    end
  end
end
