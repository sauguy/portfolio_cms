# frozen_string_literal: true

##
# This class represents an element in a block
class Element < ActiveRecord::Base
  belongs_to :block

  attr_accessor :weight

  AVAILABLE_TYPES = [:link].freeze
end
