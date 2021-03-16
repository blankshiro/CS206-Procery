import '../../models/Recipe.dart';
import '../../models/Ingredient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//https://iambaker.net/cake-recipes/

Ingredient flour = Ingredient()
  ..name = "Flour"
  ..description = "Flour"
  ..measurementType = "gram"
  ..standardQ = 250
  ..expiryDays = 100
  ..price = 10.0;

Ingredient egg = Ingredient()
  ..name = "Egg"
  ..description = "Egg"
  ..measurementType = "num"
  ..standardQ = 6
  ..expiryDays = 12
  ..price = 5.0;

var recipe1 = Recipe(
    //https://iambaker.net/the-perfect-chocolate-cake/
    name: "The Perfect Chocolate Cake",
    description:
        "This rich and decadent chocolate cake has been around for decades and is always a crowd-pleaser!",
    image: "assets/images/choco_cake.jpg",
    instructions: [
      "Sift the flour, sugar, cocoa, baking soda, baking powder, and salt into the bowl and mix until combined.",
      "In another bowl, combine the buttermilk, oil, eggs, and vanilla.",
      "With the mixer on low speed, slowly add the wet ingredients to the dry. With mixer still on low, add the coffee and stir just to combine, scraping the bottom of the bowl with a rubber spatula. Pour the batter into two 8-inch round prepared pans and bake for 30 to 40 minutes at 350°F, until a cake tester or toothpick comes out mostly clean (not wet).",
      "Cool in the pans for 30 minutes, then turn them out onto a cooling rack and cool completely."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0
);

var recipe2 = Recipe(
    // https://iambaker.net/chocolate-craving-cake/
    name: "Chocolate Craving Cake",
    description: "Small in size but not in flavor!",
    image: "assets/images/choco_cake_2.jpg",
    instructions: [
      "Preheat oven to 350°F. Line an 8x8-inch glass or ceramic baking dish with parchment paper and spray sides and bottom. If using a metal baking pan, heat oven to 325°F.",
      "Mix flour, sugar, cocoa powder, baking powder, baking soda, and salt in the bowl of stand mixer.",
      "Add in egg, milk, oil, and vanilla and mix on low until incorporated. When mixed in increase speed to medium and mix for 2 minutes.",
      "Add in warm water and gently stir- batter will be very thin.",
      "Pour batter into prepared dish. Bake for 35-40 minutes, or until an inserted toothpick is removed.",
      "Cool for 10 minutes in the pan, then continue cooling on a rack until room temperature."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe3 = Recipe(
    // https://iambaker.net/homemade-coconut-cake/
    name: "Coconut Cake",
    description: "This Coconut Cake recipe is a family favorite!",
    image: "assets/images/coconut_cake.jpg",
    instructions: [
      "Preheat oven to 350°F. Prepare three 8-inch round cake pans.",
      "Add coconut oil and sugar to stand mixer and beat on medium-high until incorporated about 1-2 minutes.",
      "Add coconut extract to the coconut milk. Now, with the mixer on low, add that milk mixture to the sugar mixture in the stand mixer.",
      "Sift together flour and baking powder; add to ingredients in stand mixer slowly.",
      "Beat at low speed just until incorporated. Turn mixer off.",
      "In a separate bowl, beat egg whites at medium speed until stiff peaks form.",
      "Remove mixer bowl from stand mixer and gently fold egg whites into batter.",
      "Pour batter into prepared pans.",
      "Bake at 350°F for 18-25 minutes or until the center does not appear wet and the cake has pulled slightly away from the sides of the pan. Do not overbake!!!",
      "Remove cakes from oven and let rest in pan for about 5 minutes.",
      "Turn out cakes onto baking rack and level if necessary. Now drizzle each layer with 2-3 tablespoons of simple syrup.",
      "You can decorate immediately or chill cakes until ready to assemble."
    ],
    prepMins: 15,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe4 = Recipe(
    //https://www.countryliving.com/food-drinks/recipes/a37729/speckled-malted-coconut-cake-recipe/
    name: "Speckled Malted Coconut Cake",
    description: "This robin's egg cake tastes just as good as it looks.",
    image: "assets/images/malted_coconut_cake.jpg",
    instructions: [
      "Preheat oven to 350 degrees F. Lightly grease three 8-inch cake pans and line bottoms with parchment paper rounds. Whisk together flour, baking powder, malt powder, and salt in a bowl.",
      "Whisk together oil, half-and-half, sugar, vanilla, coconut extract, and whole egg in a separate bowl until smooth. Fold in flour mixture just until incorporated. Beat egg whites with an electric mixer on medium-high speed until stiff peaks form, 1 to 2 minutes. Fold egg whites into batter just until combined.",
      "Divide batter among prepared pans. Bake until a toothpick inserted in the center comes out clean, 18 to 22 minutes. Cool in pans on a wire rack for 15 minutes, then invert onto racks to cool completely.",
      "Place one layer on a cake plate and frost top with 1 cup Coconut Buttercream. Repeat two more times. Frost sides with remaining Coconut Buttercream.",
      "Stir together food coloring and 2 drops water in a bowl. Dip the tip of a wide, stiff paintbrush into the mixture. Holding the brush 6 to 8 inches from the cake, gently fling the mixture onto iced cake. Repeat for desired effect."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe5 = Recipe(
    // https://www.countryliving.com/food-drinks/recipes/a41986/raspberry-pink-velvet-cake-recipe/?visibilityoverride
    name: "Raspberry Pink Velvet Cake with Raspberry Cream Cheese Frosting",
    description:
        "Topped with fluffy meringues and edible flowers, this pretty-in-pink raspberry velvet cake is about as springy as it gets.",
    image: "assets/images/raspberry_cheesecake.jpg",
    instructions: [
      "Preheat oven to 350°F. Grease and flour 3 (8-inch) cake pans. Whisk together flour, baking powder, and salt in a bowl.",
      "Beat butter and sugar on medium speed with an electric mixer until light and creamy, 1 to 2 minutes. Add 1 cup raspberries, and beat until smooth, 15 to 20 seconds. Add eggs, one at a time, beating until blended after each addition (mixture will look curdled). Beat in vanilla. Reduce mixer speed to low and beat in flour mixture and buttermilk alternately, beginning and ending with flour mixture, just until flour is incorporated. Mix in food coloring, if desired. Divide batter among prepared pans.",
      "Bake until a wooden pick inserted in center comes out clean, 23 to 25 minutes. Cool in pans on wire racks 10 minutes, then invert onto wire racks to cool completely.",
      "Toss together preserves and remaining 3 cups raspberries in a bowl. Place one layer on a cake plate and top with 1/2 of the preserve mixture; repeat one more time. Top with remaining cake layer. Frost top and sides of cake with frosting. Decorate with meringue kisses, edible flowers, and raspberries.",
      "To make the frosting, beat butter and cream cheese on medium speed with an electric mixer until creamy, 1 to 2 minutes. Beat in raspberries, vanilla, and salt, until raspberries are broken down, 15 to 20 seconds. Reduce mixer speed to low and gradually add confectioners’ sugar until blended and smooth after each addition, 45 seconds to 1 minute."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe6 = Recipe(
    //https://www.epicurious.com/recipes/food/views/olive-oil-apple-cake-with-spiced-sugar
    name: "Olive Oil Apple Cake with Spiced Sugar",
    description:
        "It’s earthy thanks to the olive oil, warm thanks to the spices.",
    image: "assets/images/olive_oil_cake.jpg",
    instructions: [
      "Preheat oven to 350°F. Pour about 1 Tbsp. oil into a 9x5\" loaf pan and coat bottom and sides with fingertips. Sprinkle granulated sugar onto sides and bottom of pan to lightly coat.",
      "Grate apples, peel and all, on the large holes of a box grater. Gather apples in a clean kitchen towel and wring out excess liquid. Be aggressive! You want them as dry as possible when they go into the batter.",
      "Whisk cinnamon, pepper, cardamom, and ginger in a medium bowl. Transfer 1/4 tsp. spice mixture to a small bowl; set aside. Add flour and baking powder to remaining spice mixture and whisk to combine.",
      "Whisk together eggs, egg yolks, brown sugar, vanilla, salt, and 1/2 cup granulated sugar in a large bowl. Continue whisking vigorously until lightened in color and thickened. Whisking with one hand and pouring with the other, slowly stream 1 cup oil into egg mixture until combined. Gently fold flour mixture into whipped eggs with a flexible rubber spatula just until combined, taking care not to overmix.",
      "Fluff up grated apples and scatter over batter. Gently fold to incorporate.",
      "Transfer batter to prepared pan; smooth top. Add 2 tsp. granulated sugar to reserved spice mixture and mix to combine. Sprinkle spiced sugar evenly over top of batter.",
      "Bake cake until deep golden brown and a tester inserted into the center comes out clean, 60–70 minutes. Let cake cool in pan. Run a butter knife or offset spatula along edge of cake to loosen and invert onto a platter."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 1);

var recipe7 = Recipe(
    //https://www.epicurious.com/recipes/food/views/buckwheat-banana-cake-with-yogurt-espresso-frosting
    name: "Buckwheat Banana Cake with Yogurt-Espresso Frosting",
    description:
        "Earthy, nutrient-rich whole grain flours give this classic banana loaf cake recipe some added personality.",
    image: "assets/images/banana_cake.jpg",
    instructions: [
      "Preheat oven to 350°F. Coat an 8 1/2x4 1/2\" loaf pan with nonstick spray, then line with parchment, letting it hang over on both of the longer sides. Whisk whole wheat flour, buckwheat flour, cinnamon, salt, baking soda, and baking powder in a medium bowl.",
      "Mash bananas and brown sugar in a large bowl until virtually no lumps of banana remain and brown sugar is dissolved. Mix in eggs, oil, and sour cream. Add dry ingredients and mix in with a rubber spatula. Scrape batter into prepared pan and smooth top.",
      "Bake cake until the top springs back when gently pressed and a tester inserted into the center comes out clean, 55–65 minutes. Transfer pan to a wire rack and let cake cool in pan 30 minutes. Turn out cake onto rack and let cool completely.",
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe8 = Recipe(
    //https://www.epicurious.com/recipes/food/views/east-62nd-street-lemon-cake
    name: "Lemon Cake",
    description:
        "When I sent this recipe to my friend Craig Claiborne, he printed it in the New York Times.",
    image: "assets/images/lemon_cake.jpg",
    instructions: [
      "Adjust an oven rack one-third up from the bottom of oven. Preheat the oven to 350°F. Butter a plain or fancy tube pan with an 11- to 12-cup capacity and dust it lightly with fine, dry bread crumbs.",
      "Sift together flour, baking powder, and salt and set aside. In large bowl of electric mixer, beat the butter to soften it a bit. Add the sugar and beat for 2 to 3 minutes. Beat in the eggs individually, scraping the bowl as necessary with a rubber spatula to keep mixture smooth. On lowest speed, alternately add the dry ingredients in three additions and the milk in two additions, scraping the bowl with the rubber spatula as necessary and beating only until incorporated after each addition. Remove the bowl from the mixer. Stir in lemon zest. Turn the batter into prepared pan. Level top by rotating pan briskly back and forth.",
      "Bake for 1 hour and 5 to 10 minutes, until a cake tester comes out dry.",
      "Let cake stand in the pan for about 5 minutes and then cover with a rack and invert. Place over a large piece of aluminum foil or wax paper.",
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe9 = Recipe(
    //https://www.epicurious.com/recipes/food/views/red-velvet-mug-cake-51206050
    name: "Red Velvet Mug Cake",
    description:
        "This über-trendy cake is actually a vintage recipe from the Deep South.",
    image: "assets/images/red_velvet_mug.jpg",
    instructions: [
      "In a large mug, whisk together the egg and oil with a fork. Stir in the food coloring, buttermilk, vanilla, and sugar. Add the cocoa, flour, salt, and vinegar. Beat the batter until smooth. Divide the batter between two mugs. Microwave separately for 1 1/2 to 2 1/2 minutes each until risen and firm."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe10 = Recipe(
    //https://sallysbakingaddiction.com/super-moist-chocolate-cupcakes/
    name: "Super Moist Chocolate Cupcakes",
    description:
        "These super moist chocolate cupcakes pack TONS of chocolate flavor in each cupcake wrapper!",
    image: "assets/images/choco_cupcake.jpg",
    instructions: [
      "Preheat the oven to 350°F (177°C). Line a 12-cup muffin pan with cupcake liners. Line a second pan with 2 liners – this recipe makes about 14 cupcakes. Set aside.",
      "Whisk the flour, cocoa powder, baking powder, baking soda, and salt together in a large bowl until thoroughly combined. Set aside. In a medium bowl, whisk the eggs, granulated sugar, brown sugar, oil, and vanilla together until combined. Pour half of the wet ingredients into the dry ingredients. Then half of the buttermilk. Gently whisk for a few seconds. Repeat with the remaining wet ingredients and buttermilk. Stir until *just* combined; do not overmix. The batter will be thin.",
      "Pour or spoon the batter into the liners. Fill only halfway (this is imperative! only halfway!) to avoid spilling over the sides or sinking.",
      "Bake for 18-21 minutes, or until a toothpick inserted in the center comes out clean. Allow to cool completely before frosting. I usually let them cool in the pan.",
      "Frost cooled cupcakes however you’d like. I used chocolate buttercream and Wilton 1M piping tip for these pictured cupcakes. Top with sprinkles, if desired. Store leftovers in the refrigerator for up to 5 days."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe11 = Recipe(
    //https://prettysimplesweet.com/vanilla-cupcakes/
    name: "Vanilla Cupcakes",
    description:
        "Classic and simple recipes like this are always my favorite ones! ",
    image: "assets/images/vanilla_cupcake.jpg",
    instructions: [
      "Preheat oven to 350F/180C. Line muffin tin with cupcake liners. Set aside.",
      "In a medium bowl, sift together flour, baking powder, and salt. Set aside.",
      "In a standing mixer fitted with the paddle attachment, beat together butter and sugar on medium speed until light and fluffy, about 3 minutes. Scrape down the sides and bottom of the bowl as necessary. On medium speed, beat in eggs, one at a time, beating well after each addition. Add vanilla extract and beat until combined. With the mixer on low speed, add half of the dry ingredients and beat just until combined. Add milk and beat until combined. Add the other half of the dry ingredients and beat slowly or fold by hand only until combined. Do not over mix – the less you mix, the lighter the cake will be.",
      "Divide batter evenly between the cups, filling them about 3/4 full. Bake for 15-20 minutes (or 8-10 minutes if making mini cupcakes) until a toothpick inserted into the center comes out clean or with just a few moist crumbs. Allow cupcakes to sit for 10 minutes, then remove from pan and allow to cool completely on a wire rack.",
      "Unfrosted cupcakes can be kept tightly covered at room temperature for up to 3 days, or in the freezer for up to 2 months. Thaw, still covered, on the counter or overnight in the fridge."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe12 = Recipe(
    //https://www.olivemagazine.com/recipes/baking-and-desserts/classic-chocolate-brownies/
    name: "Classic Chocolate Brownies",
    description:
        "A classic, gooey chocolate brownie recipe that can be ramped up with added ingredients",
    image: "assets/images/choco_brownies.jpg",
    instructions: [
      "Heat the oven to 180C/fan 160C/gas 4.",
      "Line a 22cm square brownie tin with baking parchment. Melt the butter and chocolate together in a microwave or in a bowl set over a pan of simmering water. Cool to room temperature.",
      "Whisk the eggs and sugar together until the mixture is light and fluffy.",
      "Fold the chocolate mixture into the egg mixture and sift on the flour, baking powder and cocoa.",
      "Fold this in to give a fudgy batter.",
      "(To ramp it up, add 100g chopped white or milk chocolate chunks OR 100g toasted, roughly chopped hazelnuts or pecans OR 2 handfuls of baby marshmallows.)",
      "Bake for 25-30 minutes or until the top is cracked but the middle just set. Cool completely, then lift out of the tin and cut."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe13 = Recipe(
    //https://www.olivemagazine.com/recipes/baking-and-desserts/classic-millionaires-shortbread/
    name: "Classic Millionaire’s Shortbread",
    description:
        "This is the perfect trio of buttery shortbread, gooey caramel and thick, sweet chocolate.",
    image: "assets/images/classic_shortbread.jpg",
    instructions: [
      "Heat the oven to 180C/fan 160C/gas 4. Grease and line a 20cm brownie or square tin. Put the flour, sugar and butter in a food processor and pulse until it forms a dough. Press the dough into the base of the tin, and press into the corners with your fingertips. Prick with a fork and bake for 20 minutes until golden and dry. Leave to cool.",
      "Put the caramel ingredients in a small pan over a medium low heat and cook, continually whisking for 2-3 minutes until the sugar has melted. Cook whisking for a further 6 minutes until thickened. Pour over the cooled shortbread, smooth over, cool to room temperature, and chill until set (about 2 hours). You can freeze to speed this up if you like.",
      "Melt the chocolate in the microwave or in a heatproof bowl over a pan of simmering water until smooth and glossy. Leave to cool slightly, then pour over the set caramel. Cool again until set. Sprinkle with a pinch more salt and cut into squares with a hot knife to easily go through the chocolate. Best stored in fridge for up to 3 days.",
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe14 = Recipe(
    //https://www.olivemagazine.com/recipes/baking-and-desserts/apricot-and-white-chocolate-cookies/
    name: "Apricot and White Chocolate Cookies",
    description:
        "They are perfect for a mid-morning snack or edible gift at Christmas.",
    image: "assets/images/white_choco_cookies.jpg",
    instructions: [
      "Heat the oven to 190C/fan 170C/gas 5. Beat the butter and sugars together until the mixture is light and creamy, then beat in the egg and add the vanilla extract and the milk. Mix the flour into the mixture to make a stiff dough, then add 100g of the chocolate and apricots and work them in.",
      "Line a baking sheet with baking paper, scoop out the cookie dough in tablespoons and roll each into a ball. Sit these about 8cm apart as they will spread out as they cook. Press a fork onto each ball to flatten it out slightly. Bake for 10 minutes, or until the cookies are golden but not brown, rest them for a couple of minutes before lifting them off the tray onto a rack to cool. Repeat with the remaining mixture.",
      "Melt the remaining chocolate and drizzle it back and forth over the cookies.",
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe15 = Recipe(
    //https://www.olivemagazine.com/recipes/family/croissant-cinnamon-buns/
    name: "Croissant Cinnamon Buns",
    description: "Check out these easy-to-make, moreish cinnamon buns.",
    image: "assets/images/cinnamon_buns.jpg",
    instructions: [
      "Unroll the croissant dough rolls, and cut each in 1/2 widthways so you have 4 smaller rectangles. Spread each with the butter, then mix together the sugar, cinnamon and orange zest, and sprinkle evenly over each. Roll the pieces from the shortest side, into a sausage, then cut into 3. Repeat with the other pieces.",
      "Heat the oven to 190C/fan 170C/gas 5. Put each roll into the hole of a non-stick muffin tin, spiral side facing up. Bake for 20-25 minutes or until golden on top and cooked through. Remove to a wire rack, spirals facing upwards, to cool, with a piece of baking paper underneath the rack.",
      "Sift the icing sugar into a bowl and add the vanilla and milk, mixing well – it should be a thick, drizzle-able consistency.",
      "Once the buns are warm but no longer hot, drizzle with the icing, then eat straightaway."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe16 = Recipe(
    //https://www.olivemagazine.com/recipes/sticky-honey-cakes/
    name: "Sticky Honey Cakes",
    description:
        "This recipe for sticky honey cakes is really easy to make and they look great. ",
    image: "assets/images/honey_cakes.jpg",
    instructions: [
      "Use 10g butter to grease either 2 × 12-mould bun tins or if you want larger cakes, 1 × 12 hole cupcake tin. Heat the oven to 180c/160c fan/gas 4.",
      "Beat the butter and sugar together for 2 minutes, until light. Add the honey and beat for a couple more minutes.",
      "Beat in the eggs, one by one, then fold in the flour and ginger, finishing with the lemon juice. Divide between the buttered moulds and bake for 20 minutes, until risen, golden and springy. Cool on wire racks for 15 minutes.",
      "To make the glaze, melt the butter in a small pan, remove from the heat and stir in the honey and icing sugar using a balloon whisk.",
      "Dip the tops of the honey cakes into the warm glaze or drizzle over thickly with a spoon. If the glaze gets too solid, warm it through very gently to melt. Put the glazed cakes back on the wire racks to set, iced-sides up."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe17 = Recipe(
    //https://www.olivemagazine.com/recipes/baking-and-desserts/salted-maple-brownies/
    name: "Salted Maple Brownies",
    description:
        "This recipe is really easy to make but looks impressive and delivers big flavours",
    image: "assets/images/maple_brownies.jpg",
    instructions: [
      "Heat the oven to 180C/fan 160C/gas 4. Line a 22cm square tin with baking parchment, leaving some overhanging so you can lift the whole lot out easily. To make the base, mix the biscuit crumbs with the milk powder, maple syrup, salt, butter and cream and squeeze some in your hand, it should stick together. Press the mixture into the base of the tin.",
      "Melt the butter and chocolate in a microwave or in a bowl set over a pan of simmering water, then cool to room temperature. Whisk the eggs and sugar until the mixture is pale and thick. Fold the chocolate mixture into the eggs then sift over the flour, baking powder and cocoa. Fold this in to make a thick batter and pour it onto the base. Drizzle over the maple syrup and sprinkle on some salt flakes.",
      "Bake for 15-20 minutes, or until the top is cracked but the middle just set. Cool completely in the tin then lift it out and cut it into squares."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe18 = Recipe(
    //https://www.olivemagazine.com/recipes/coffee-and-walnut-cupcakes/
    name: "Coffee and Walnut Cupcakes",
    description: "Coffee and walnut cake is a teatime favourite. ",
    image: "assets/images/coffee_walnut_cupcake.jpg",
    instructions: [
      "Heat the oven to 180C/fan 160C/gas 4 and line a 12-hole muffin tin with muffin cases. Put the walnuts in a food processor with about half the sugar and whizz until very finely chopped (like ground almonds).",
      "Mix the milk and coffee to dissolve the coffee (if it needs some help, pop it in the microwave for a few seconds).",
      "Tip the walnut-sugar mix, remaining sugar, milky coffee, soft butter, oil, eggs, flours and bicarb into a large mixing bowl and beat with an electric whisk until smooth. Divide between the cases then bake for 18 minutes, or until golden and risen, and a skewer poked into the centre comes out clean. Cool for 5 minutes in the tin, then lift the cakes onto a wire rack to cool completely.",
      "For the icing, put the butter in a big mixing bowl and beat for about 5 minutes until very pale and creamy. Sift in the icing sugar and cocoa then add the coffee and vanilla and beat for another 3-5 minutes until very fluffy.",
      "To decorate, put the icing into a large piping bag fitted with a star nozzle – for our ruffle icing, we used a Wilton 2D nozzle (from lakeland.co.uk). Pipe swirls of icing on top of each cake, then leave to set for 20 minutes before eating."
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe19 = Recipe(
    //https://www.thespruceeats.com/vanilla-muffins-3058482
    name: "Perfect Vanilla Muffins",
    description:
        "Amazing light and fluffy muffin that can be the base of lots of other muffin additions. ",
    image: "assets/images/vanilla_muffins.jpg",
    instructions: [
      "Preheat the oven to 400 F. Grease 24 muffin cups or line them with paper cupcake liners.",
      "In a large bowl, combine the flour, sugar, baking powder, and salt. Stir to mix thoroughly.",
      "In a medium bowl, whisk together the milk, butter, eggs, and vanilla extract or paste until combined.",
      "For the icing, put the butter in a big mixing bowl and beat for about 5 minutes until very pale and creamy. Sift in the icing sugar and cocoa then add the coffee and vanilla and beat for another 3-5 minutes until very fluffy.",
      "Pour the wet mixture into the dry ingredients. Use a spoon to mix thoroughly.",
      "Spoon into greased or paper-lined muffin tins.",
      "Bake in the preheated oven for about 15 to 20 minutes. A dark pan will take less time than a light colored pan. The muffins are done when a toothpick or cake tester comes out clean when inserted in the middle of a muffin. Remove the muffins from the tin and let cool on a cooling rack. Serve and enjoy!"
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

var recipe20 = Recipe(
    //https://www.delish.com/cooking/recipe-ideas/a32936759/banana-nut-muffins-recipe/
    name: "Banana Nut Muffins",
    description:
        "Light and moist, full of toasted walnuts, and just sweet enough. ",
    image: "assets/images/banana_nut_muffins.jpg",
    instructions: [
      "Preheat oven to 350° and line two muffin tins with liners. In a large bowl, whisk together flour, salt, baking powder, baking soda, and cinnamon. ",
      "In another large bowl, whisk together melted butter and sugars. Add egg and vanilla and whisk until combined. Stir in mashed bananas and yogurt. Add banana mixture to dry ingredients and stir just until combined, then fold in walnuts. ",
      "Divide batter between 18 liners, filling ¾ full. Bake until a toothpick inserted in middle comes out clean, 18 to 20 minutes.",
    ],
    prepMins: 15,
    calories: 200,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1],
    likes: 0);

List<Recipe> getRecipes() {
  return <Recipe>[
    recipe1,
    recipe2,
    recipe3,
    recipe4,
    recipe5,
    recipe6,
    recipe7,
    recipe8,
    recipe9,
    recipe10,
    recipe11,
    recipe12,
    recipe13,
    recipe14,
    recipe15,
    recipe16,
    recipe17,
    recipe18,
    recipe19,
    recipe20
  ];
}
