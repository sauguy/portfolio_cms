# frozen_string_literal: true

class CreateElements < ActiveRecord::Migration[5.0]
  def change
    create_table :elements do |t|
      t.integer :weight
      t.integer :block_id
      t.timestamps
    end
  end
end
