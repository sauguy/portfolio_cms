# frozen_string_literal: true

module Admin
  class PortfoliosController < ApplicationController
    def index
      render 'index', locals: { portfolios: portfolios }
    end

    def new; end

    def create
      ::Portfolio.create(filtered_params)
      redirect_to admin_path
    end

    def show
      render 'show', locals: { portfolio: portfolio }
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

    def filtered_params
      params[:portfolio].permit(:name, :description)
    end
  end
end
