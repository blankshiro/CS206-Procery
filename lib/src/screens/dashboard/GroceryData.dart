class Grocery {
  String name;
  String quantity;
  // String image;
  bool checked;

  Grocery(this.name, this.quantity, this.checked);
}

List<Grocery> getGrocery() {
  return <Grocery>[
    Grocery("Cocoa Powder", "200g", false),
    Grocery("Banana", "5", false),
    Grocery("Eggs", "10", false),
    Grocery("Flour", "100g", false)
  ];
}