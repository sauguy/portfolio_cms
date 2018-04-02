class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
    add_reference :pages, :portfolio, foreign_key: true
  end
end
