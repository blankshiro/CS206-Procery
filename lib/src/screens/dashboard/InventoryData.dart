class Inventory {
  String title;
  String description;
  String image;
  int expiry;

  Inventory(this.title, this.description, this.image, this.expiry);
}

List<Inventory> getExpiring() {
  return <Inventory>[
    Inventory("Milk", "1000ml", "assets/images/milk.png", 6),
    Inventory("Butter", "250g", "assets/images/butter.jpg", 8),
    Inventory("Oil", "100ml", "assets/images/oil.jpg", 9),
    Inventory("Sugar", "200g", "assets/images/sugar.jpg", 11),
    Inventory("Chocolate Chip", "300g", "assets/images/chocochip.jpg", 15),
    Inventory("Baking Powder", "100g", "assets/images/bakingpowder.jpeg", 18),
    // Inventory("Eggs", "x6", "assets/images/eggs.png", 6),
  ];
}
