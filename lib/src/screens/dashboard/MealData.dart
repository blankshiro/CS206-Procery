class Meal {
  DateTime date;
  int time;
  String name;
  String image;

  Meal(this.date, this.time, this.name, this.image);
}

List<Meal> getMeal() {
  return <Meal> [
    // 0 -> B, 1 -> L, 2 -> D
    Meal(new DateTime.utc(2021, 3, 12).toLocal(), 0, "Buckwheat Banana Cake with Yogurt-Espresso Frosting", "assets/images/banana_cake.jpg"),
    Meal(new DateTime.utc(2021, 3, 12).toLocal(), 1, "Super Moist Chocolate Cupcakes", "assets/images/choco_cupcake.jpg"),
    Meal(new DateTime.utc(2021, 3, 12).toLocal(), 2, "Vanilla Cupcakes", "assets/images/vanilla_cupcake.jpg"),
    Meal(new DateTime.utc(2021, 3, 13).toLocal(), 0, "Super Moist Chocolate Cupcakes", "assets/images/choco_cupcake.jpg"),
    Meal(new DateTime.utc(2021, 3, 13).toLocal(), 1, "Vanilla Cupcakes", "assets/images/vanilla_cupcake.jpg"),
    Meal(new DateTime.utc(2021, 3, 13).toLocal(), 2, "Buckwheat Banana Cake with Yogurt-Espresso Frosting", "assets/images/banana_cake.jpg"),
  ];
}