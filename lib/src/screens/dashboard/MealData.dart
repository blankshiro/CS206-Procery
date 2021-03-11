// import '';
//
// class Day {
//   List<Meal> mealList;
//   DateTime date;
//   Day(this.date, this.mealList);
// }

// List<Day> getDay() {
//   return <Day>[
//     // year, month, day
//     Day(new DateTime.utc(2021, 3, 10), getMeals()),
//     Day(new DateTime.utc(2021, 3, 11), getMeals())
//   ];
// }

class Meal {
  DateTime date;
  int time;
  String title;
  String image;

  Meal(this.date, this.time, this.title, this.image);
}

// String getImage() {
//
// }

// List<Meal> getMeals() {
//   List<Meal> mealList = [];
//   for (int i = 0; i < mealData().length; i++) {
//     if (mealData()[i].date == DateTime.now()) {
//       mealList.add(mealData()[i]);
//     }
//   }
//   return mealList;
// }

List<Meal> getMeal() {
  return <Meal> [
    // 0 -> B, 1 -> L, 2 -> D
    Meal(new DateTime.utc(2021, 3, 11).toLocal(), 0, "Banana Cake with Yogurt-Espresso Frosting", "assets/images/banana_cake.jpg"),
    Meal(new DateTime.utc(2021, 3, 11).toLocal(), 1, "Super Moist Chocolate Cupcakes", "assets/images/choco_cupcake.jpg"),
    Meal(new DateTime.utc(2021, 3, 11).toLocal(), 2, "Vanilla Cupcakes", "assets/images/vanilla_cupcake.jpg"),
    Meal(new DateTime.utc(2021, 3, 12).toLocal(), 0, "Super Moist Chocolate Cupcakes", "assets/images/choco_cupcake.jpg"),
    Meal(new DateTime.utc(2021, 3, 12).toLocal(), 1, "Vanilla Cupcakes", "assets/images/vanilla_cupcake.jpg"),
    Meal(new DateTime.utc(2021, 3, 12).toLocal(), 2, "Buckwheat Banana Cake with Yogurt-Espresso Frosting", "assets/images/banana_cake.jpg"),
  ];
}