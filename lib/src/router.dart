import 'package:auto_route/auto_route_annotations.dart';
import 'package:Procery/src/screens/dashboard/DashboardExplore.dart';
import 'package:Procery/src/screens/recipe/RecipeExplore.dart';
import 'package:Procery/src/screens/BaseScreen.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentPage.dart';
import 'package:Procery/src/screens/mealplanner/MealPlannerInitial.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    // MaterialRoute(page: BaseScreen, initial: true),
    MaterialRoute(page: RecipeExplore, name: 'recipeExplore'),
    MaterialRoute(page: DashboardExplore, name: 'dashboardExplore', initial: true),
    MaterialRoute(page: GLCurrentPage, name: 'gLExplore'),
    MaterialRoute(page: MealPlannerInitial, name: 'mealPlannerExplore'),
  ],
)
class $Router {}
