
import 'package:Procery/src/services/IngredientModel.dart';
import 'package:Procery/src/services/RecipeModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


  List<SingleChildWidget> providers = [
    ChangeNotifierProvider<RecipeModel>(create: (context) => RecipeModel()),
    ChangeNotifierProvider<IngredientModel>(create: (context) => IngredientModel()),
  ];

