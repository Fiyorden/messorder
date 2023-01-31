class AddKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "dishes_orders", "dishes", name: "dishes_orders_dish_id_fk"
    add_foreign_key "dishes_orders", "orders", name: "dishes_orders_order_id_fk"
  end
end
