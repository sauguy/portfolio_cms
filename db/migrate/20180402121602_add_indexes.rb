class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :blocks, :page_id
    add_index :elements, :block_id
    add_index :element_links, :element_id
  end
end
