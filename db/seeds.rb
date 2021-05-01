# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Recipe.destroy_all
Ingredient.destroy_all
RecipeItem.destroy_all
User.destroy_all
Like.destroy_all
Comment.destroy_all


200.times do 
    Ingredient.create(name: Faker::Food.ingredient)
end

quantity_types = [
  "N/A",
  "Tbsp",
  "Tsp",
  "Cups",
  "Pints",
  "Quarts",
  "Gallons",
  "Ounces",
  "Pounds",
]

quantities = [
  0.5,
  1,
  2,
  3,
  4,
  5,
  10
]

u1 = User.create(username: 'willowdog', password:'123')
u2 = User.create(username: 'sportyspice', password:'123')
u3 = User.create(username: 'tombrady', password:'123')
u4 = User.create(username: 'ben', password:'123')
u5 = User.create(username: 'dana', password:'123')

images = [
  "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20190503-delish-pineapple-baked-salmon-horizontal-ehg-450-1557771120.jpg?crop=0.669xw:1.00xh;0.173xw,0&resize=640:*",
  "https://www.goodfood.com.au/content/dam/images/h/1/m/l/s/p/image.related.portrait.460x544.h1mlbg.png/1584423430324.jpg",
  "https://flockler.com/thumbs/sites/192/quick-spicy-sausage-ragu-685da3b9-7496-4d84-aa99-e11fd427c3e4_s600x0_c4480x2617_l0x2468_q40.jpg",
  "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=700%2C636",
  "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chicken_stew-670d71c.jpg?quality=90&resize=440,400",
  "https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg",
  "https://static01.nyt.com/images/2021/02/17/dining/17tootired-grilled-cheese/17tootired-grilled-cheese-articleLarge.jpg?quality=75&auto=webp&disable=upscale",
  "https://i2.wp.com/www.additudemag.com/wp-content/uploads/2016/11/Treat.Diet_.The_ADHD_diet_what_to_eat_what_to_avoid.Article.6552E.fruit_loops_spoon.ts_90906670-1.jpg?resize=1280%2C720px&ssl=1",
  "https://cdn.vox-cdn.com/thumbor/E1SJrq2UsohJE46zFtpUn9QWq-Y=/0x135:602x587/1200x900/filters:focal(0x135:602x587)/cdn.vox-cdn.com/uploads/chorus_image/image/47205638/adey_abeba.0.0.png",
  "https://pasoroblesdailynews.com/wp-content/uploads/2016/12/chicken-shishkabob.jpg",
  "https://assets3.thrillist.com/v1/image/1864928/828x610/flatten;crop;jpeg_quality=70",
  "https://www.simplyrecipes.com/thmb/Unh3di3tOQHxGGehabRbMrXzvd0=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2015__04__roasted-asparagus-horiz-a-1600-04c1d1ad1d77447dbc0769b0ae55b626.jpg",
]

recipe_names = [
  "Burger", "Rice", "Chow Mein", "Curry Chicken", "Spicy Sausage Ragu", "Chicken and Waffles", "Roast Asparagus", "Chorizo Gnocchi Bake"
]

instructions = [
  "1. Put the lime in the coconut. 2. drink em both up",
  "1. Grab chicken breast firmly. 2. Apply chicken directly to the forehead. 3. Drink your vegetables.",
  "1. Finely dice onion. 2. Saute onion on medium heat until just translucent. 3. Add crushed garlic. 4. Listen to your roommates exclaim 'gosh that smells good' even though all you've done is saute onion and garlic.",
  "1. Go to burger joint. 2. Order burger. 3. Wait for burger. 4. Ingest burger.",
  "1. Bring stock to simmer. 2. Toast rice over medium-low heat until grains start to turn translucent. 3. Add half a cup of warm stock, mixing continuously, adding more stock as it dries up. 4. is this how you make risotto?",
  "1. Brown sausage in bottom of high-walled saute pan over medium high heat until deeply brown. 2. Apply sausage to mouth hole"
]

descriptions = [
  "It's a burger, what do you want from me?",
  "This sausage ragu will whisper sweet nothings, cradling you into the night",
  "They're long, they're pointy, and they make your pee smell funny",
  "What could be more delicious than fried chicken and waffles?",
  "Probably should've gone to Panda Express",
  "That's a spicy meatball"
]

15.times do
  Recipe.create(name: recipe_names.sample, instructions: instructions.sample, description: descriptions.sample, img: images.sample, user_id: User.all.sample.id)
end

rec = Recipe.create(name: 'Curried Chicken', instructions: 'Sautee the chicken in olive oil with curry and other spices and vegetables. It will be delicious and you will enjoy it.', description: 'Scrumptious curry and chicken', img: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190509-coconut-chicken-curry-157-1558039780.jpg?crop=0.668xw:1.00xh;0.116xw,0&resize=980:*', user_id: u1.id)

Recipe.all.each do |recipe|
  3.times do |i|
    RecipeItem.create(recipe_id: recipe.id, quantity: quantities.sample, quantity_type: quantity_types.sample, ingredient_id: Ingredient.all.sample.id)
  end
end

# RecipeItem.create(recipe_id: rec.id, quantity: 5, quantity_type: 'tbsp', ingredient_id: Ingredient.all[0].id)
# RecipeItem.create(recipe_id: rec.id, quantity: 100, quantity_type: 'gram', ingredient_id: Ingredient.all[1].id)
# RecipeItem.create(recipe_id: rec.id, quantity: 51.5, quantity_type: 'cup', ingredient_id: Ingredient.all[2].id)

Like.create(user_id: u1.id, recipe_id: rec.id)
Like.create(user_id: u3.id, recipe_id: rec.id)
Like.create(user_id: u2.id, recipe_id: rec.id)
Like.create(user_id: u4.id, recipe_id: Recipe.all.sample.id)
Like.create(user_id: u5.id, recipe_id: Recipe.all.sample.id)

Comment.create(user_id: u1.id, recipe_id: rec.id, body: 'Such nums')
Comment.create(user_id: u2.id, recipe_id: rec.id, body: 'This is so tasty I will eat it every day.')
Comment.create(user_id: u3.id, recipe_id: rec.id, body: 'I love this chicken curry more than I love football.')

puts "it's all seedy baby"