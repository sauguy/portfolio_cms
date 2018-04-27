# frozen_string_literal: true

class CreateElementLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :element_links do |t|
      t.string :title
      t.string :target
      t.string :img
      t.text :description
      t.integer :element_id
    end
  end
end
