import 'dart:io';
import 'package:flutter/material.dart' hide Router;
import 'package:hive/hive.dart';

import 'package:Procery/src/provider_list.dart';
import 'package:Procery/src/router.gr.dart';


import 'src/models/Recipe.dart';
import 'src/models/Ingredient.dart';
import 'src/models/Purchase.dart';
import 'src/models/PlannerRecord.dart';
import 'src/models/Inventory.dart';
import 'src/models/GroceryList.dart';

import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  print("path");
  print(directory.path);

  // Register new adaptor for each database 'box'
  Hive.registerAdapter(IngredientAdapter());
  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(PurchaseAdapter());
  Hive.registerAdapter(PlannerRecordAdapter());
  Hive.registerAdapter(InventoryAdapter());
  Hive.registerAdapter(GroceryListAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Procery App',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato',
        ),
        onGenerateRoute: Router(),
      ),
    );
  }
}
