##
# This class represents a page on a portfolio
class Page < ApplicationRecord
  has_many :blocks, dependent: :destroy
  belongs_to :portfolio
end
