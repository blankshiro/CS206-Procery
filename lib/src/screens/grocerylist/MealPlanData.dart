class MealPlanList {
  String meal;
  String ingredients;
  int quantity;

  MealPlanList(this.meal, this.ingredients, this.quantity);
}

List<MealPlanList> getMealPlanList() {
  return <MealPlanList>[
    MealPlanList("Breakfast", "Chocolate Muffins", 10),
    MealPlanList("Breakfast", "Strawberry Muffins", 10),
    MealPlanList("Lunch", "Coconut Cake", 1),
    MealPlanList("Dinner", "Red Velvet Cake", 1),
  ];
}
