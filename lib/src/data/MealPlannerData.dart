// Data definitions
import '../models/Recipe.dart';
import '../models/PlannerRecord.dart';

// App dependencies
import 'RecipeData.dart';


List recipes = getRecipes();

DateTime today = DateTime.now();

var mealPlan1 = PlannerRecord()
  ..recipe = recipes[1]
  ..date = today
  ..meal = 'B';

var mealPlan2 = PlannerRecord()
  ..recipe = recipes[2]
  ..date = today.add(Duration(days: 1))
  ..meal = 'L';

var mealPlan3 = PlannerRecord()
  ..recipe = recipes[3]
  ..date = today.add(Duration(days: 2))
  ..meal = 'D';

var mealPlan4 = PlannerRecord()
  ..recipe = recipes[4]
  ..date = today
  ..meal = 'B';

List<PlannerRecord> getPlannerRecords() {
  return <PlannerRecord>[mealPlan1, mealPlan2, mealPlan3, mealPlan4];
}

