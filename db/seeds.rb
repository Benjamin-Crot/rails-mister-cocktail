# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Ingredient.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
user_serialized = open(url).read
user = JSON.parse(user_serialized)
ingredient_array = user['drinks']

ingredient_array.each do |i|
  ingredient = Ingredient.new(name: i['strIngredient1'])
  ingredient.save!
end
puts 'Done'

Cocktail.destroy_all

Cocktail.create(name: 'Mojito')
Cocktail.create(name: 'Moscow Mule')
Cocktail.create(name: 'Piña Colada')
Cocktail.create(name: 'Ti Punch')
Cocktail.create(name: 'Margarita')
Cocktail.create(name: 'Gin Tonic')
Cocktail.create(name: 'Tequila Sunrise')
Cocktail.create(name: 'Whisky Sour')
