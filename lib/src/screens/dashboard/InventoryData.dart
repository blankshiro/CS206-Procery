class Inventory {
  String title;
  String description;
  String image;
  int expiry;

  Inventory(this.title, this.description, this.image, this.expiry);
}

List<Inventory> getExpiring() {
  return <Inventory>[
    Inventory("Eggs", "x6", "assets/images/eggs.png", 6),
    Inventory("Eggs", "x6", "assets/images/eggs.png", 6),
    // Dashboard("Cake 2", "So good", "assets/images/cake_2.png")
  ];
}
