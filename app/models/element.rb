##
# This class represents an element in a block
class Element < ApplicationRecord
  belongs_to :block

  attr_accessor :weight
end
