import 'package:Procery/src/models/Ingredient.dart';
import 'package:Procery/src/models/Recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Ingredient flour = Ingredient()
  ..name = "Flour"
  ..description = "Flour"
  ..measurementType = "gram"
  ..standardQ = 500
  ..expiryDays = 100
  ..price = 10.0;

Ingredient egg = Ingredient()
  ..name = "Egg"
  ..description = "Egg"
  ..measurementType = "num"
  ..standardQ = 6
  ..expiryDays = 12
  ..price = 5.0;

Ingredient butter = Ingredient()
  ..name = "Butter"
  ..description = "Butter"
  ..measurementType = "gram"
  ..standardQ = 50
  ..expiryDays = 50
  ..price = 4.0;

var recipe1 = Recipe()
  ..name = 'Recipe1'
  ..description = 'Recipe1 Desc'
  ..instructions = ['Instruction 1', 'Instruction 1B', 'Instruction 1C']
  ..prepMins = 15
  ..ingredients = [flour, egg, butter]
  ..ingredientsQ = [150, 5, 20];

var recipe2 = Recipe()
  ..name = 'Recipe2'
  ..description = 'Recipe2 Desc'
  ..instructions = ['Instruction 2', 'Instruction 2B', 'Instruction 2C']
  ..prepMins = 15
  ..ingredients = [flour, egg, butter]
  ..ingredientsQ = [80, 3, 10];

void sampleAlgo(){
  List<Recipe> recipeList = [recipe1, recipe2];
  int flourC = 150;
  int eggC = 6;
  int butterC = 20;

  List constraints = [flourC, eggC, butterC];

  var tracker = new List.generate(flourC + 1, (_) =>
  new List.generate(eggC + 1, (_) =>
  new List.generate(butterC + 1, (_) =>
  new List.filled(constraints.length, 0.0),
      growable: false),
      growable: false),
      growable: false);

  print("tracker");
  print(tracker[0][0][0]);
  var store = new List.generate(flourC + 1, (_) =>
  new List.generate(eggC + 1, (_) =>
  new List.generate(butterC + 1, (_) =>
  new List.filled(recipeList.length, 0.0),
      growable: false),
      growable: false),
      growable: false);

  print("store");
  print(store[0][0][0]);

  for(var a = 0 ; a <= flourC; a++){
    for(var b = 0; b <= eggC; b++){
      for(var c = 0; c <= butterC; c++){
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

          var toCompare = calcListAvg(tracker[a][b][c]);

          tracker[a][b][c]
          = findMax(tracker[a][b][c]
              , findValue(tracker[a-current.ingredientsQ[0]][b-current.ingredientsQ[1]][c-current.ingredientsQ[2]]
                  , current, constraints));

          if(toCompare <  calcListAvg(tracker[a][b][c])){

            store[a][b][c] = List.from(store[a-current.ingredientsQ[0]][b-current.ingredientsQ[1]][c-current.ingredientsQ[2]]);
            store[a][b][c][i] = store[a][b][c][i] + 1;

            if((a == 80 || a == 160) && c == 20 && b == 6){
              print("log");
              print(a-current.ingredientsQ[0]);
              print(b-current.ingredientsQ[1]);
              print(c-current.ingredientsQ[2]);
              print(store[a-current.ingredientsQ[0]][b-current.ingredientsQ[1]][c-current.ingredientsQ[2]]);
              print(a);
              print(b);
              print(c);
              print(i);
              print(current.name);
              print(store[a][b][c]);
            }
          }


        }
      }
    }
  }

  List result;
  double currentMax = 0.0;
  for(int a = 0; a <= flourC; a++){
    for(int b = 0; b <= eggC; b++){
      for(int c = 0; c <= butterC; c++){
        if(calcListAvg(tracker[a][b][c]) > currentMax){
          currentMax = calcListAvg(tracker[a][b][c]);
          result = store[a][b][c];
        }
      }
    }
  }

  print("result");
  print(result);


}

double calcListAvg (List toCalc){
  double avg = 0.0;
  for(int i = 0; i < toCalc.length; i++){
    avg += toCalc[i];
  }
  return avg / toCalc.length;
}

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

List findValue(List usage1, Recipe current, List constraints){
  List<double> currentUsage = [];
  for(var i = 0; i < current.ingredientsQ.length; i++){
    currentUsage.add(usage1[i] + (current.ingredientsQ[i] / constraints[i]));
  }

  return currentUsage;
}





class Sample extends StatelessWidget{

  Widget build(BuildContext context){
    sampleAlgo();
    return Scaffold(

    );
  }
}
