class Block < ApplicationRecord
  belongs_to :page
  has_many :elements, dependent: :destroy
end
