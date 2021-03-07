class Grocery {
  String title;
  String description;
  String image;
  bool bought;

  Grocery(this.title, this.description, this.image, this.bought);
}

List<Grocery> getGrocery() {
  return <Grocery>[
    Grocery("Eggs", "x10", "assets/images/eggs.png", false),
    Grocery("Flour", "100g", "assets/images/flour.png", false)
  ];
}