class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :opening, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :paid

      t.timestamps
    end
  end
end
