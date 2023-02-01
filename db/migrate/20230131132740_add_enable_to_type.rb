# frozen_string_literal: true

class AddEnableToType < ActiveRecord::Migration[7.0]
  def change
    add_column :types, :enabled, :boolean
  end
end
