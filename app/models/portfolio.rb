# frozen_string_literal: true

##
# This class represents a portfolio
class Portfolio < ApplicationRecord
  has_many :pages, dependent: :destroy
end
