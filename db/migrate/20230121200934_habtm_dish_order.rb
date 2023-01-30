class HabtmDishOrder < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes_orders, id: false do |t|
      t.belongs_to :dish
      t.belongs_to :order
    end
  end
end
