# frozen_string_literal: true

class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.integer :page_id
      t.integer :weight
      t.timestamps
    end
  end
end
