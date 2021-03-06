class Grocery {
  String title;
  String description;
  String image;

  Grocery(this.title, this.description, this.image);
}

List<Grocery> getGrocery() {
  return <Grocery>[
    Grocery("Eggs", "x10", "assets/images/eggs.png"),
    Grocery("Flour", "100g", "assets/images/flour.png")
  ];
}