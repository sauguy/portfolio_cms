class Element
  class Link < ApplicationRecord
    belongs_to :element

    delegate :weight, to: :element
    delegate :block, to: :element
  end
end
