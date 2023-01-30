class CreateOpenings < ActiveRecord::Migration[7.0]
  def change
    create_table :openings do |t|
      t.datetime :from_at
      t.datetime :to_at

      t.timestamps
    end
  end
end
