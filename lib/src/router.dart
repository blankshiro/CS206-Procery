import 'package:auto_route/auto_route_annotations.dart';
import 'package:Procery/src/screens/dashboard/DashboardExplore.dart';
import 'package:Procery/src/screens/recipe/RecipeExplore.dart';
import 'package:Procery/src/screens/BaseScreen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: BaseScreen, initial: true),
    MaterialRoute(page: RecipeExplore, name: 'recipeExplore')
  ],
)
class $Router {}
