# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Type.create([{ name: 'Petit-déjeuner', enabled: true }, { name: 'Soupe', enabled: true },
             { name: 'Petite faim', enabled: true }, { name: 'Sandwich', enabled: true },
             { name: 'Salade', enabled: true }, { name: 'Pâtes', enabled: true },
             { name: 'Boisson', enabled: true }])

Dish.create(name: 'Café', price: 0.50, type: Type.where(name: 'Boisson').first, enabled: true)
Dish.create(name: 'Pain au chocolat', price: 1.00, type: Type.where(name: 'Petit-déjeuner').first, enabled: true)
Dish.create(name: 'Croissant', price: 1.00, type: Type.where(name: 'Petit-déjeuner').first, enabled: true)
Dish.create(name: 'Soupe Maison', price: 0.50, type: Type.where(name: 'Soupe').first, enabled: true)
Dish.create(name: 'Croque-monsieur', price: 1.50, type: Type.where(name: 'Petite faim').first, enabled: true)
Dish.create(name: 'Croque-monsieur avec crudités', price: 2.50, type: Type.where(name: 'Petite faim').first,
            enabled: true)
Dish.create(name: 'Baguette garnie américain', price: 3.00, type: Type.where(name: 'Sandwich').first, enabled: true)
Dish.create(name: 'Baguette garnie thon', price: 3.00, type: Type.where(name: 'Sandwich').first, enabled: true)
Dish.create(name: 'Baguette garnie surimi', price: 3.00, type: Type.where(name: 'Sandwich').first, enabled: true)
Dish.create(name: 'Baguette garnie poulet andalouse', price: 3.00, type: Type.where(name: 'Sandwich').first,
            enabled: true)
Dish.create(name: 'Baguette garnie dagobert', price: 3.00, type: Type.where(name: 'Sandwich').first, enabled: true)
Dish.create(name: 'Baguette garnie jambon', price: 3.00, type: Type.where(name: 'Sandwich').first, enabled: true)
Dish.create(name: 'Baguette garnie fromage', price: 3.00, type: Type.where(name: 'Sandwich').first, enabled: true)
Dish.create(name: 'Baguette garnie salade de viande', price: 3.00, type: Type.where(name: 'Sandwich').first,
            enabled: true)
Dish.create(name: 'Salade composée jambon', price: 4.00, type: Type.where(name: 'Salade').first, enabled: true)
Dish.create(name: 'Salade composée fromage', price: 4.00, type: Type.where(name: 'Salade').first, enabled: true)
Dish.create(name: "Salade composée roulade d'asperge", price: 4.00, type: Type.where(name: 'Salade').first,
            enabled: true)
Dish.create(name: 'Salade composée tomates au thon', price: 4.00, type: Type.where(name: 'Salade').first, enabled: true)
Dish.create(name: 'Salade composée pêches au thon', price: 4.00, type: Type.where(name: 'Salade').first, enabled: true)
Dish.create(name: 'Salade composée Saumon fumé', price: 5.00, type: Type.where(name: 'Salade').first, enabled: true)
Dish.create(name: 'Pâtes bolognaise (petit)', price: 3.00, type: Type.where(name: 'Pâtes').first, enabled: true)
Dish.create(name: 'Pâtes 4 fromages (petit)', price: 3.00, type: Type.where(name: 'Pâtes').first, enabled: true)
Dish.create(name: 'Pâtes bolognaise (grand)', price: 4.00, type: Type.where(name: 'Pâtes').first, enabled: true)
Dish.create(name: 'Pâtes 4 fromages (grand)', price: 4.00, type: Type.where(name: 'Pâtes').first, enabled: true)

(Time.zone.today..Date.new(2023, 0o2, 17)).each do |date|
  next unless date.cwday <= 5

  Opening.create(from_at: DateTime.new(date.year, date.month, date.day, 8, 45, 0).in_time_zone('Brussels'),
                 to_at: DateTime.new(date.year, date.month, date.day, 9, 15,
                                     0).in_time_zone('Brussels'))
  Opening.create(from_at: DateTime.new(date.year, date.month, date.day, 10, 15, 0).in_time_zone('Brussels'),
                 to_at: DateTime.new(date.year, date.month, date.day, 10, 45,
                                     0).in_time_zone('Brussels'))
  Opening.create(from_at: DateTime.new(date.year, date.month, date.day, 12, 0, 0).in_time_zone('Brussels'),
                 to_at: DateTime.new(date.year, date.month, date.day, 13, 15,
                                     0).in_time_zone('Brussels'))
  Opening.create(from_at: DateTime.new(date.year, date.month, date.day, 18, 0, 0).in_time_zone('Brussels'),
                 to_at: DateTime.new(date.year, date.month, date.day, 19, 45,
                                     0).in_time_zone('Brussels'))
end
