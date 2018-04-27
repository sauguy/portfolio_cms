# frozen_string_literal: true

class Element
  ##
  # This class represents a link element
  class Link < ApplicationRecord
    belongs_to :element

    delegate :weight, to: :element
    delegate :block, to: :element
  end
end
