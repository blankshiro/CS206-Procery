class Inventory {
  String name;
  String description;
  String image;
  int expiry;
  bool checked;

  Inventory(this.name, this.description, this.image, this.expiry, this.checked);
}

List<Inventory> getExpiring() {
  return <Inventory>[
    Inventory("Milk", "1000ml", "assets/images/milk.png", 6, false),
    Inventory("Butter", "250g", "assets/images/butter.jpg", 8, false),
    Inventory("Oil", "100ml", "assets/images/oil.jpg", 9, false),
    Inventory("Sugar", "200g", "assets/images/sugar.jpg", 11, false),
    Inventory("Chocolate Chip", "300g", "assets/images/chocochip.jpg", 15, false),
    Inventory("Baking Powder", "100g", "assets/images/bakingpowder.jpeg", 18, false),
  ];
}
