# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Dose.destroy_all

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

file = URI.open('https://static1.villaschweppes.com/articles/1/49/09/1/@/352763-le-cocktail-gimlet-opengraph_1200-2.jpeg')
cocktail1 = Cocktail.create(name: 'Mojito')
cocktail1.photo.attach(io: file, filename: 'mojit.jpeg', content_type: 'image/jpeg')
# cocktail2 = Cocktail.create(name: 'Moscow Mule')
# cocktail3 = Cocktail.create(name: 'Piña Colada')
# Cocktail.create(name: 'Ti Punch')
# Cocktail.create(name: 'Margarita')
# Cocktail.create(name: 'Gin Tonic')
# Cocktail.create(name: 'Tequila Sunrise')
# Cocktail.create(name: 'Whisky Sour')
