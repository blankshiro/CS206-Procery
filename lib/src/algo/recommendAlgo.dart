import 'package:Procery/src/models/Ingredient.dart';
import 'package:Procery/src/models/Purchase.dart';
import 'package:Procery/src/models/Recipe.dart';
import 'package:Procery/src/models/GroceryList.dart';
import 'package:Procery/src/models/Inventory.dart';
import 'package:Procery/src/models/PlannerRecord.dart';

/*
  TODO: adding a plannerRecord adds the groceries to the fixed grocery list
  From groceryListList -> Get active & included lists
  Calculate the no. of ingredients going to be bought


  For each ingredient ingrediented fixed q - (needed % the ingredients's fixed qty)
  --> should return the remainder
  Set the remainder as the constraints for the algo

  From recipeList -> Get available recipes to match
  --> pass in as the recipes for the algo

  Run the algo
 */


getRecommend(List<GroceryList> groceryListList,
    List<Inventory> inventoryList, List<Ingredient> ingredientList,
    List<Recipe> recipeList){

    int flourA;
    int eggA;
    int butterA;
    int chocoA;
    int milkA;

    List<GroceryList> activeGL = groceryListList.where((gl) => gl.active == 1).toList();
    for(int i = 0; i < activeGL.length; i++){
      for(int j = 0; j < activeGL[i].purchases.length; j++){
        Purchase curr = activeGL[i].purchases[j];
        int toBuy = activeGL[i].purchases[j].quantity - activeGL[i].purchases[j].purchased;
        switch(curr.ingredient.name){
          case "Flour":
            flourA += toBuy;
            continue;
          case "Egg":
            eggA += toBuy;
            continue;
          case "Butter":
            butterA += toBuy;
            continue;
          case "Chocolate":
            chocoA += toBuy;
            continue;
          case "Milk":
            milkA += toBuy;
            continue;
        }
      }
    }

    print(" flourA: " + flourA.toString() +
        " eggA: " + eggA.toString() +
        " butterA: " + butterA.toString() +
        " chocoA: " + chocoA.toString() +
        " milkA: " + milkA.toString());

    int flourC = ingredientList[0].standardQ - (flourA % ingredientList[0].standardQ);
    int eggC = ingredientList[1].standardQ - (eggA % ingredientList[1].standardQ);
    int butterC = ingredientList[2].standardQ - (butterA % ingredientList[2].standardQ);
    int chocoC = ingredientList[3].standardQ - (chocoA % ingredientList[3].standardQ);
    int milkC = ingredientList[4].standardQ - (milkA % ingredientList[4].standardQ);

    List constraints = [flourC, eggC, butterC, chocoC, milkC];

    List<int> results = recommend(constraints, recipeList);

    Map<Recipe, int> map = Map();
    for(int i = 0; i < results.length; i++){
      if(results[i] > 0){
        map.putIfAbsent(recipeList[i], () => results[i]);
      }
    }

    return map;



}

List<int> recommend(List<int> constraints, List<Recipe>recipeList){

  var tracker = new List.generate(constraints[0] + 1, (_) =>
  new List.generate(constraints[1] + 1, (_) =>
  new List.generate(constraints[2] + 1, (_) =>
  new List.generate(constraints[3] + 1, (_) =>
  new List.generate(constraints[4] + 1, (_) =>
  new List.filled(constraints.length, 0.0),
      growable: false),
      growable: false),
      growable: false),
      growable: false),
      growable: false);

  print("tracker");
  print(tracker[0][0][0]);
  var store = new List.generate(constraints[0] + 1, (_) =>
  new List.generate(constraints[1] + 1, (_) =>
  new List.generate(constraints[2] + 1, (_) =>
  new List.generate(constraints[3] + 1, (_) =>
  new List.generate(constraints[4] + 1, (_) =>
  new List.filled(constraints.length, 0.0),
      growable: false),
      growable: false),
      growable: false),
      growable: false),
      growable: false);

  print("store");
  print(store[0][0][0]);

  for(var a = 0 ; a <= constraints[0]; a++){
    for(var b = 0; b <= constraints[1]; b++){
      for(var c = 0; c <= constraints[2]; c++){
        for(var d = 0; d <= constraints[3]; d++){
          for(var e = 0; e <= constraints[4]; e++){
            for(var i = 0; i < recipeList.length; i++){
              var current = recipeList[i];

              if (current.ingredientsQ[0] > a){
                continue;
              }
              if (current.ingredientsQ[1] > b){
                continue;
              }
              if (current.ingredientsQ[2] > c){
                continue;
              }
              if (current.ingredientsQ[3] > d){
                continue;
              }
              if (current.ingredientsQ[4] > e){
                continue;
              }

              var toCompare = calcListAvg(tracker[a][b][c][d][e]);

              tracker[a][b][c][d][e]
              = findMax(tracker[a][b][c][d][e]
                  , findValue(tracker[a-current.ingredientsQ[0]][b-current.ingredientsQ[1]][c-current.ingredientsQ[2]][d-current.ingredientsQ[3]][e-current.ingredientsQ[4]]
                      , current, constraints));

              if(toCompare <  calcListAvg(tracker[a][b][c][d][e])){

                store[a][b][c][d][e] = List.from(store[a-current.ingredientsQ[0]][b-current.ingredientsQ[1]][c-current.ingredientsQ[2]][d-current.ingredientsQ[3]][e-current.ingredientsQ[4]]);
                store[a][b][c][d][e][i] = store[a][b][c][d][e][i] + 1;

              }
            }
          }
        }
      }
    }
  }

  List result;
  double currentMax = 0.0;
  for(var a = 0 ; a <= constraints[0]; a++){
    for(var b = 0; b <= constraints[1]; b++){
      for(var c = 0; c <= constraints[2]; c++){
        for(var d = 0; d <= constraints[3]; d++){
          for(var e = 0; e <= constraints[4]; e++){
            if(calcListAvg(tracker[a][b][c][d][e]) > currentMax) {
              currentMax = calcListAvg(tracker[a][b][c][d][e]);
              result = store[a][b][c][d][e];
            }
          }
        }
      }
    }
  }

  print("result");
  print(result);

  return result;


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