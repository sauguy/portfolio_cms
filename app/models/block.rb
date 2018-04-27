# frozen_string_literal: true

##
# This class represents a block of elements in a page
class Block < ApplicationRecord
  belongs_to :page
  has_many :elements, dependent: :destroy
end
