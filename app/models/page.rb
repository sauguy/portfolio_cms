##
# This class represents a page on the portfolio
class Page < ApplicationRecord
  has_many :blocks, dependent: :destroy
end
