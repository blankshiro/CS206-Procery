// import 'package:Procery/src/models/Ingredient.dart';
// import 'package:Procery/src/models/Recipe.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// Ingredient flour = Ingredient()
//   ..name = "Flour"
//   ..description = "Flour"
//   ..measurementType = "gram"
//   ..standardQ = 250
//   ..expiryDays = 100
//   ..price = 10.0;

// Ingredient egg = Ingredient()
//   ..name = "Egg"
//   ..description = "Egg"
//   ..measurementType = "num"
//   ..standardQ = 6
//   ..expiryDays = 12
//   ..price = 5.0;

// var recipe1 = Recipe()
//   ..name = 'Recipe1'
//   ..description = 'Recipe1 Desc'
//   ..instructions = 'Recipe1 Instruction'
//   ..prepMins = 15
//   ..ingredients = [flour, egg]
//   ..ingredientsQ = [20, 1];

// var recipe2 = Recipe()
//   ..name = 'Recipe2'
//   ..description = 'Recipe2 Desc'
//   ..instructions = 'Recipe2 Instruction'
//   ..prepMins = 15
//   ..ingredients = [flour, egg]
//   ..ingredientsQ = [80, 3];

// void sampleAlgo(){
//   List<Recipe> recipeList = [recipe1, recipe2];
//   int flourConstraint = 250;
//   int eggConstraint = 6;

//   Map recipes = new Map();
//   recipes.putIfAbsent(recipe1, () => 0);
//   recipes.putIfAbsent(recipe2, () => 0);
//   List tracker = [];

//   print(recipes);

//   for(var i = 0 ; i < flourConstraint; i++){
//     for(var j = 0; j < eggConstraint; j++){
//       for(var k = 0; k < recipeList.length; k++){
//         var current = recipeList.elementAt(k);
//         if(current.ingredientsQ.elementAt(0) <= i && current.ingredientsQ.elementAt(1) <=j){
//           tracker.insert(i, )
//         }
//       }
//     }

//   }
// }

// class Sample extends StatelessWidget{

//   Widget build(BuildContext context){
//     return Scaffold();
//   }
// }
