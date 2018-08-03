class AddNameToPages < ActiveRecord::Migration[5.0]
  def change
    rename_column :pages, :path, :name
  end
end
