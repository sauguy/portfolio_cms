class Element < ApplicationRecord
  belongs_to :block

  attr_accessor :weight
end
