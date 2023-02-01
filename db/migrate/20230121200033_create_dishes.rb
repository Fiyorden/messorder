# frozen_string_literal: true

class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
