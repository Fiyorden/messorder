# frozen_string_literal: true

class AddChiefAdminToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :chief, :boolean
    add_column :users, :admin, :boolean
  end
end
