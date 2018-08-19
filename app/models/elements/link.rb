# frozen_string_literal: true

module Elements
  ##
  # This class represents a link element
  class Link < ActiveRecord::Base
    belongs_to :element

    delegate :weight, to: :element
    delegate :block, to: :element
  end
end
