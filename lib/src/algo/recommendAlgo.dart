import 'package:Procery/src/models/Ingredient.dart';
import 'package:Procery/src/models/Recipe.dart';
import 'package:Procery/src/models/GroceryList.dart';
import 'package:Procery/src/models/Inventory.dart';
import 'package:Procery/src/models/PlannerRecord.dart';

/*
  TODO: adding a plannerRecord adds the groceries to the fixed grocery list
  From groceryListList -> Get active & included lists
  Calculate the no. of ingredients going to be bought
  How about ingredients bought already,
  cant tell if they are to be included
  maybe just assume that they are all to be included in calc?
  (provide option to set? current design doesnt allow this)

  For each ingredient % the ingredients's fixed qty
  --> should return the remainder
  Set the remainder as the constraints for the algo

  From recipeList -> Get available recipes to match
  --> pass in as the recipes for the algo

  Run the algo
 */


List<Recipe> getRecommend(List<GroceryList> groceryListList,
    List<Inventory> inventoryList, List<Ingredient> ingredientList,
    List<Recipe> recipeList){



}

// Calculate the value of the list via average of usages
double calcListAvg (List toCalc){
  double avg = 0.0;
  for(int i = 0; i < toCalc.length; i++){
    avg += toCalc[i];
  }
  return avg / toCalc.length;
}

// Return list with higher average usage of ingredients
List findMax(List usage1, List usage2){
  double avgUsage1 = 0.0;
  for(var i = 0; i < usage1.length; i++){
    avgUsage1 += usage1[i];
  }
  avgUsage1 = avgUsage1 / usage1.length;

  double avgUsage2 = 0.0;
  for(var i = 0; i < usage2.length; i++){
    avgUsage2 += usage2[i];
  }
  avgUsage2 = avgUsage2 / usage2.length;

  if(avgUsage1 >= avgUsage2){
    return usage1;
  }
  return usage2;
}

// Calculate value of list when adding of new recipe
List findValue(List usage1, Recipe current, List constraints){
  List<double> currentUsage = [];
  for(var i = 0; i < current.ingredientsQ.length; i++){
    currentUsage.add(usage1[i] + (current.ingredientsQ[i] / constraints[i]));
  }

  return currentUsage;
}