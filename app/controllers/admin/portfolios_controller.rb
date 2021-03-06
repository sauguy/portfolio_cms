# frozen_string_literal: true

module Admin
  class PortfoliosController < ApplicationController
    def index
      render 'index', locals: { portfolios: portfolios }
    end

    def new
      render 'new', locals: { portfolio: ::Portfolio.new }
    end

    def create
      ::Portfolio.create(filtered_params)
      redirect_to admin_path
    end

    def edit
      render 'edit', locals: { portfolio: portfolio }
    end

    def update
      portfolio.update(filtered_params)
      redirect_to edit_admin_portfolio_path(portfolio)
    end

    def destroy
      portfolio.destroy
      redirect_to admin_path
    end

    private

    def portfolios
      ::Portfolio.all
    end

    def portfolio
      ::Portfolio.find(params['id'])
    end

    def pages
      @pages ||= portfolio.pages
    end

    def filtered_params
      params.require(:portfolio).permit(:name, :description)
    end
  end
end
