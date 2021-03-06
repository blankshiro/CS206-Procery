class Meal {
  String title;
  String description;
  String image;

  Meal(this.title, this.image);
}

List<Meal> getMeal() {
  return <Meal>[
    Meal("cake1", "assets/images/cake1.png"),
    Meal("cake2", "assets/images/cake2.png")
  ];
}