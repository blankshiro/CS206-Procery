// Model Imports
import 'package:Procery/src/services/IngredientModel.dart';
import 'package:Procery/src/services/RecipeModel.dart';
import 'package:Procery/src/services/PurchaseModel.dart';
import 'package:Procery/src/services/PlannerRecordModel.dart';
import 'package:Procery/src/services/InventoryModel.dart';
import 'package:Procery/src/services/GroceryListModel.dart';

// External Dependencies
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


  List<SingleChildWidget> providers = [
    ChangeNotifierProvider<RecipeModel>(create: (context) => RecipeModel()),
    ChangeNotifierProvider<IngredientModel>(create: (context) => IngredientModel()),
    ChangeNotifierProvider<PurchaseModel>(create: (context) => PurchaseModel()),
    ChangeNotifierProvider<PlannerRecordModel>(create: (context) => PlannerRecordModel()),
    ChangeNotifierProvider<InventoryModel>(create: (context) => InventoryModel()),
    ChangeNotifierProvider<GroceryListModel>(create: (context) => GroceryListModel()),
  ];

