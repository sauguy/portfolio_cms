class Page < ApplicationRecord
  has_many :blocks, dependent: :destroy
end
