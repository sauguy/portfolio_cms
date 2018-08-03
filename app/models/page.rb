# frozen_string_literal: true

##
# This class represents a page on a portfolio
class Page < ApplicationRecord
  has_many :blocks, dependent: :destroy
  belongs_to :portfolio

  def ordered_blocks
    blocks.order(:weight)
  end
end
