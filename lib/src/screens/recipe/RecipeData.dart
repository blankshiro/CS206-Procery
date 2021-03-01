// class Recipe {
//   String title;
//   String description;
//   String image;
//   int calories;

//   Recipe(this.title, this.description, this.image, this.calories);
// }

// List<Recipe> getRecipes() {
//   return <Recipe>[
//     Recipe(
//         "Cake 1", "So irresistibly delicious", "assets/images/cake_1.png", 250),
//     Recipe("Cake 2", "So good", "assets/images/cake_2.png", 200),
//     Recipe("Cake 3", "So much wow", "assets/images/cake_3.jpg", 150),
//     Recipe("Cake 4", "So irresistible", "assets/images/cake_4.jpg", 190),
//     Recipe("Cake 5", "So tasty", "assets/images/cake_5.jpg", 250),
//   ];
// }
import './Recipe.dart';
import './Ingredient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
    name: "cake1",
    description: "So irresistibly delicious",
    image: "assets/images/cake_1.png",
    instructions: "instruction1",
    prepMins: 15,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1]);

var recipe2 = Recipe(
    name: "cake2",
    description: "So good",
    image: "assets/images/cake_2.png",
    instructions: "instruction2",
    prepMins: 15,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1]);

var recipe3 = Recipe(
    name: "cake3",
    description: "So much wow",
    image: "assets/images/cake_3.jpg",
    instructions: "instruction3",
    prepMins: 15,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1]);

var recipe4 = Recipe(
    name: "cake4",
    description: "So irresistibly delicious",
    image: "assets/images/cake_4.jpg",
    instructions: "instruction4",
    prepMins: 15,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1]);

var recipe5 = Recipe(
    name: "cake5",
    description: "So irresistibly delicious",
    image: "assets/images/cake_5.jpg",
    instructions: "instruction5",
    prepMins: 15,
    ingredients: [flour, egg],
    ingredientsQ: [20, 1]);

List<Recipe> getRecipes() {
  return <Recipe>[recipe1, recipe2, recipe3, recipe4, recipe5];
}
